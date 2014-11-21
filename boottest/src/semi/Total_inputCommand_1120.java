package semi;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class Total_inputCommand_1120 implements Command{
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
			
			if(re_sort.equals("code")){
				for(int i=0; i<pricelist.size(); i++){
					StockDto totalDto = new StockDto();
					comparedDto1 = (StockDto) pricelist.get(i);
					itemCount = comparedDto1.getCount();
					itemPrice = comparedDto1.getPrice();
					totalDto.setCode(comparedDto1.getCode());
					totalDto.setCount(itemCount);
					totalDto.setPrice(itemPrice);
					totallist.add(totalDto);
					totalPrice += itemPrice;
					System.out.println(totalDto.getCode() + ", " + totalDto.getCount() + ", " + totalDto.getPrice() + ", " + totalPrice);
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
					totalDto.setCount(itemCount);
					totalDto.setPrice(itemPrice);
					totallist.add(totalDto);
					totalPrice += itemPrice;
					System.out.println(totalDto.getName() + ", " + totalDto.getCount() + ", " + totalDto.getPrice());
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
					totalDto.setCname(comp1);
					totalDto.setName(name1);
					totalDto.setCount(itemCount);
					totalDto.setPrice(itemPrice);
					totallist.add(totalDto);
					totalPrice += itemPrice;
					System.out.println(totalDto.getCname() + ", " + totalDto.getCount() + ", " + totalDto.getPrice());
				}
			}
			else if(re_sort.equals("des")){
				int des1 = 0, des2 = 0;
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
					totalDto.setDes(des1);
					totalDto.setName(name1);
					totalDto.setCount(itemCount);
					totalDto.setPrice(itemPrice);
					totallist.add(totalDto);
					totalPrice += itemPrice;
					System.out.println(totalDto.getDes() + ", " + totalDto.getCount() + ", " + totalDto.getPrice());
				}
			}
			req.setAttribute("totalPrice", totalPrice);
			
			// 업체별, 부서별 총계, 총액
			sql3 = "select tinput.code, sum(count), sum(count)*price from tinput inner join tlist "
					+ " on tinput.code = tlist.code group by ";
			if(re_sort.equals("code")){		// 코드, 부서명의 경우 tinput과 tlist 필드명이 겹치니 잡아 주자
				re_sort = "tinput.code";
			}
			else if(re_sort.equals("des")){ 
				re_sort = "tinput.des";
			}
			sql3 += re_sort;
			
			pstmt = con.prepareStatement(sql3);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				StockDto partDto = new StockDto();
				partDto.setCode(rs.getInt("tinput.code"));
				partDto.setCount(rs.getInt("sum(count)"));
				partDto.setPrice(rs.getInt("sum(count)*price"));
				partlist.add(partDto);
			}
			
		} catch (Exception err) {
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		req.setAttribute("partlist", partlist);
		req.setAttribute("totallist", totallist);
		req.setAttribute("inputlist", inputlist);
		
		// requestScope : totalPrice, inputlist, totallist
		return "total-input-search.jsp";
	}	
}