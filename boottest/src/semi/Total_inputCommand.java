package semi;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Iterator;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class Total_inputCommand implements Command{
	Vector inputlist = new Vector();
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
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("total_searchCommand");
		
		HttpSession session = req.getSession();
		
		String sort = req.getParameter("code");
		System.out.println("sort : "+req.getParameter("code"));
		
		pool = DBConnectionMgr.getInstance();
		try{
			con = pool.getConnection();
			
			sql1 = "select tinput.code, name, cname, tinput.des "
					+ "from tinput inner join tlist on tinput.code = tlist.code group by ";
			
			// 회사명 or 부서명 정렬시 group by 조건 추가
			if(sort.equals("cname") || sort.equals("des")){
				sort += ", name";
			}
			sql1 += sort;
			//System.out.println(sql1);
			pstmt = con.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				StockDto stockdto = new StockDto();
				stockdto.setCode(rs.getInt("tinput.code"));
				stockdto.setName(rs.getString("name"));
				stockdto.setCname(rs.getString("cname"));
				stockdto.setDes(rs.getInt("tinput.des"));
				inputlist.add(stockdto);
			}
			
			// 정렬 조건 별 총계, 총액
			String re_sort = req.getParameter("code");
			int itemCount = 0;	// 조건 별 총계
			int itemPrice = 0;	// 조건 별 총액
			int totalPrice = 0;	// 전체 입고 총액
			int des1 = 0, des2 = 0;
			String comp1 = null;
			String comp2 = null;
			String name1 = null;	// cname 만으로는 같은 업체, 다른 상품을 구분할 수 없다
			String name2 = null;	// des 만으로도 같은 부서, 다른 상품을 구분할 수 없다
			
			sql2 = "select tinput.code, name, cname, tinput.des, sum(count), sum(count)*price from tinput"
					+ " inner join tlist on tinput.code = tlist.code group by tinput.code";
			pstmt = con.prepareStatement(sql2);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				StockDto priceDto = new StockDto();
				priceDto.setCode(rs.getInt("tinput.code"));
				priceDto.setName(rs.getString("name"));
				priceDto.setCname(rs.getString("cname"));
				priceDto.setDes(rs.getInt("tinput.des"));
				priceDto.setCount(rs.getInt("sum(count)"));
				priceDto.setPrice(rs.getInt("sum(count)*price"));
				pricelist.add(priceDto);
			}

			sql3 = "select tinput.code, name, cname, tinput.des "
					+ "from tinput inner join tlist on tinput.code = tlist.code group by ";
			
			sql3 += re_sort;
			pstmt = con.prepareStatement(sql3);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				StockDto partDto = new StockDto();
				partDto.setCode(rs.getInt("tinput.code"));
				partDto.setName(rs.getString("name"));
				partDto.setCname(rs.getString("cname"));
				partDto.setDes(rs.getInt("tinput.des"));
				partlist.add(partDto);
			}
			
			if(re_sort.equals("code")){
				for(int i=0; i<pricelist.size(); i++){
					StockDto totalDto = new StockDto();
					totalDto = (StockDto) pricelist.get(i);
					totallist.add(totalDto);
					totalPrice += totalDto.getPrice();
					System.out.println(totalDto.getCode() + ", " + totalDto.getName() + ", " + totalDto.getPrice() + ", " + totalPrice);
				}
			}
			else if(re_sort.equals("name")){
				for(int i=0; i<inputlist.size(); i++){
					StockDto totalDto = new StockDto();
					itemCount = 0;
					itemPrice = 0;
					comparedDto1 = (StockDto) inputlist.get(i);
					comp1 = comparedDto1.getName();
					for(int j=0; j<pricelist.size(); j++){
						comparedDto2 = (StockDto) pricelist.get(j);
						comp2 = comparedDto2.getName();
						if(comp1.equals(comp2)){
							itemCount += comparedDto2.getCount();
							itemPrice += comparedDto2.getPrice();
						}
					}
					totalDto.setName(comp1);
					totalDto.setCname(comparedDto1.getCname());
					totalDto.setDes(comparedDto1.getDes());
					totalDto.setPrice(itemPrice);
					totallist.add(totalDto);
					totalPrice += itemPrice;
					System.out.println(totalDto.getName() + ", " + totalDto.getCname() + ", " + totalDto.getPrice());
				}
			}
			else if(re_sort.equals("cname")){
				
				for(int i=0; i<inputlist.size(); i++){
					itemCount = 0;
					itemPrice = 0;
					comparedDto1 = (StockDto) inputlist.get(i);
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
					totalDto.setCode(comparedDto1.getCode());
					totalDto.setCname(comp1);
					totalDto.setName(name1);
					totalDto.setCount(itemCount);
					totalDto.setPrice(itemPrice);
					totallist.add(totalDto);
					totalPrice += itemPrice;
					System.out.println(totalDto.getCode() + ", " + totalDto.getCname() + ", " + totalDto.getName() + ", " + totalDto.getPrice());
				}
				System.out.println("-------------------------");

				for(int k=0; k<partlist.size(); k++){
					itemPrice = 0;
					comparedDto1 = (StockDto) partlist.get(k);
					StockDto partDto = new StockDto();
					for(int l=0; l<totallist.size(); l++){
						comparedDto2 = (StockDto) totallist.get(l);
						comp1 = comparedDto1.getCname();
						comp2 = comparedDto2.getCname();
						if(comp1.equals(comp2)){
							itemPrice += comparedDto2.getPrice();
						}
						else{
							itemPrice = comparedDto2.getPrice();
						}
					}
					partDto.setCode(comparedDto1.getCode());
					partDto.setCname(comp1);
					partDto.setPrice(itemPrice);
					partlist.add(partDto);
					//System.out.println(partDto.getCode() + ", " + partDto.getCname() + ", " + partDto.getPrice());
				}
				
			}
			else if(re_sort.equals("des")){
				for(int i=0; i<inputlist.size(); i++){
					itemCount = 0;
					itemPrice = 0;
					comparedDto1 = (StockDto) inputlist.get(i);
					StockDto totalDto = new StockDto();
					for(int j=0; j<pricelist.size(); j++){
						comparedDto2 = (StockDto) pricelist.get(j);
						des1 = comparedDto1.getDes();
						des2 = comparedDto2.getDes();
						name1 = comparedDto1.getName();
						name2 = comparedDto2.getName();
						if(des1 == des2 && name1.equals(name2)){
							itemCount += comparedDto2.getCount();
							itemPrice += comparedDto2.getPrice();
						}
					}
					totalDto.setCode(comparedDto1.getCode());
					totalDto.setDes(des1);
					totalDto.setName(name1);
					totalDto.setCount(itemCount);
					totalDto.setPrice(itemPrice);
					totallist.add(totalDto);
					totalPrice += itemPrice;
					System.out.println(totalDto.getDes() + ", " + totalDto.getName() + ", " + totalDto.getPrice());
				}
			}
			System.out.println("------------------------------");
			/*
			for(int k=0; k<totallist.size(); k++){
				itemPrice = 0;
				comparedDto1 = (StockDto) totallist.get(k);
				StockDto partDto = new StockDto();
				des1 = comparedDto1.getDes();
				int code1 = comparedDto1.getCode();
				for(int l=0; l<totallist.size(); l++){
					comparedDto2 = (StockDto) totallist.get(l);
					des2 = comparedDto2.getDes();
					int code2 = comparedDto2.getCode();
					if(code1 == code2){
						itemPrice = comparedDto2.getPrice();
					}
					else if((code1 != code2) && (des1 == des2)){
						itemPrice += comparedDto2.getPrice();
					}
				}
				partDto.setCode(code1);
				partDto.setDes(des1);
				partDto.setName(comparedDto1.getName());
				partDto.setPrice(itemPrice);
				partlist.add(partDto);
				System.out.println(partDto.getCode() + ", " + partDto.getDes() + ", " + partDto.getName() + ", " + partDto.getPrice());
			}
			*/
			session.setAttribute("totalPrice", totalPrice);
			
		} catch (Exception err) {
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		session.setAttribute("partlist", partlist);
		session.setAttribute("totallist", totallist);
		session.setAttribute("inputlist", inputlist);
		
		// requestScope : totalPrice, inputlist, totallist, partlist
		return "total-input-search.jsp";
	}
	
	
}