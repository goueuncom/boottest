package semi;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Tax_outputCommand implements Command{
	Vector outputlist = new Vector();
	Vector pricelist = new Vector();
	Vector totallist = new Vector();
	Vector partlist = new Vector();
	StockDto comparedDto1 = new StockDto();
	StockDto comparedDto2 = new StockDto();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	DBConnectionMgr pool = null;
	String sql1 = null;
	String sql2 = null;
	String sql3 = null;
	String quarters = null;
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		String sort = req.getParameter("code");
		String quarter = req.getParameter("quarter");
		String year = req.getParameter("year");
		System.out.println("command"+year);
		System.out.println("sort : "+req.getParameter("code"));
		
		if(quarter == null){
			quarters = " and odate >= '"+ year +"-01-01' and odate <= '"+ year +"-12-31' ";
			System.out.println("����");
		}
		else if(quarter != null){
			if(quarter.equals("1q")){
				quarters = " and odate >= '"+ year +"-01-01' and odate <= '"+ year +"-03-31' ";
			}
			
			else if(quarter.equals("2q")){
				quarters = " and odate >= '"+ year +"-04-01' and odate <= '"+ year +"-06-30' ";
			}
			
			else if(quarter.equals("3q")){
				quarters = " and odate >= '"+ year +"-07-01' and odate <= '"+ year +"-09-30' ";
			}
			
			else if(quarter.equals("4q")){
				quarters = " and odate >= '"+ year +"-10-01' and odate <= '"+ year +"-12-31' ";
			}
		}
		
	
		
		
		pool = DBConnectionMgr.getInstance();
		try{
			con = pool.getConnection();
			/*String sql = "select name , sum(count) from toutput where odate >= ? and odate <= ? group by code";                        // sql ����
			*/
			sql1 = "select toutput.code, name, cname, toutput.des "
					+ "from toutput inner join tlist on toutput.code = tlist.code " + quarters + " group by ";
			
			// ȸ��� or �μ��� ���Ľ� group by ���� �߰�
			if(sort.equals("cname") || sort.equals("des")){
				sort += ", name";
			}
			sql1 += sort;
			System.out.println(sql1);
			pstmt = con.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				StockDto stockdto = new StockDto();
				stockdto.setCode(rs.getInt("toutput.code"));
				stockdto.setName(rs.getString("name"));
				stockdto.setCname(rs.getString("cname"));
				stockdto.setDes(rs.getInt("toutput.des"));
				outputlist.add(stockdto);
			}
			
			// ���� ���� �� �Ѱ�, �Ѿ�
			String re_sort = req.getParameter("code");
			int itemCount = 0;	// ���� �� �Ѱ�
			int itemPrice = 0;	// ���� �� �Ѿ�
			int totalPrice = 0;	// ��ü �԰� �Ѿ�
			String comp1 = null;
			String comp2 = null;
			String name1 = null;
			String name2 = null;
			sql2 = "select toutput.code, name, cname, toutput.des, sum(count), sum(count)*sprice from toutput"
					+ " inner join tlist on toutput.code = tlist.code" + quarters + "group by toutput.code";
			pstmt = con.prepareStatement(sql2);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				StockDto priceDto = new StockDto();
				priceDto.setCode(rs.getInt("toutput.code"));
				priceDto.setName(rs.getString("name"));
				priceDto.setCname(rs.getString("cname"));
				priceDto.setDes(rs.getInt("toutput.des"));
				priceDto.setCount(rs.getInt("sum(count)"));
				priceDto.setPrice(rs.getInt("sum(count)*sprice"));
				pricelist.add(priceDto);
			}
			if(re_sort.equals("cname")){
				for(int i=0; i<outputlist.size(); i++){
					itemCount = 0;
					itemPrice = 0;
					comparedDto1 = (StockDto) outputlist.get(i);
					StockDto totalDto = new StockDto();
					for(int j=0; j<pricelist.size(); j++){
						comparedDto2 = (StockDto) pricelist.get(j);
						comp1 = comparedDto1.getCname();
						comp2 = comparedDto2.getCname();
						name1 = comparedDto1.getName();
						name2 = comparedDto2.getName();
						if(comp1.equals(comp2) && name1.equals(name2)){
							itemCount += comparedDto2.getCount();
							itemPrice += comparedDto2.getPrice();
						}
					}
					totalDto.setCname(comp1);
					totalDto.setName(name1);
					totalDto.setCount(itemCount);
					totalDto.setPrice(itemPrice);
					totallist.add(totalDto);
					totalPrice += itemPrice;
					System.out.println(totalDto.getCname() + ", " + totalDto.getCount() + ", " + totalDto.getPrice());
				}
			}

			
			req.setAttribute("totalPrice", totalPrice);

			// ��ü��, �μ��� �Ѱ�, �Ѿ�
			sql3 = "select toutput.code, sum(count), sum(count)*sprice from toutput inner join tlist "
					+ " on toutput.code = tlist.code " + quarters + " group by ";
			if(re_sort.equals("code")){		// �ڵ�, �μ����� ��� toutput�� tlist �ʵ���� ��ġ�� ��� ����
				re_sort = "toutput.code";
			}
			else if(re_sort.equals("des")){ 
				re_sort = "toutput.des";
			}
			sql3 += re_sort;
			
			pstmt = con.prepareStatement(sql3);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				StockDto partDto = new StockDto();
				partDto.setCode(rs.getInt("toutput.code"));
				partDto.setCount(rs.getInt("sum(count)"));
				partDto.setPrice(rs.getInt("sum(count)*sprice"));
				partlist.add(partDto);
			}
			
		} catch (Exception err) {
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		req.setAttribute("partlist", partlist);
		req.setAttribute("totallist", totallist);
		req.setAttribute("outputlist", outputlist);
		
		// requestScope : totalPrice, outputlist, totallist
		return "Tax-total-output-search.jsp";
	}	
}