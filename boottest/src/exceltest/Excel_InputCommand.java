package exceltest;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

import semi.StockDto;

public class Excel_InputCommand implements Command{
	// excel ����
	static HSSFRow row;
	static HSSFCell cell;
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res) {
		//System.out.println("excel!!!!");
		
		HttpSession session = req.getSession();
		Vector partlist = (Vector) session.getAttribute("partlist");
		
		// ���ο� ���� ��ũ ��Ʈ ����
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet("mySheet");
        
        // �ش� ��Ʈ�� �ະ�� ����� �Է�
        for(int rownum = 0; rownum < partlist.size(); rownum++) 
        {
        	Row r = sheet.createRow(rownum);
        	StockDto exDto = new StockDto();
        	exDto = (StockDto) partlist.get(rownum);
        	
        	r.createCell(0).setCellValue(exDto.getCode());
        	r.createCell(1).setCellValue(exDto.getName());
        	r.createCell(2).setCellValue(exDto.getCname());
        	r.createCell(3).setCellValue(exDto.getDes());
        	r.createCell(4).setCellValue(exDto.getPrice());
        	System.out.println(exDto.getCode() + ", " + exDto.getName() + ", " +
				   exDto.getCname() + ", " + exDto.getDes() + ", " + exDto.getPrice());
		}
			
		// �ش� ��ũ��Ʈ�� ������.
		FileOutputStream outFile = null;
		try {
			Date date = new Date();
			SimpleDateFormat ft = 
				      new SimpleDateFormat ("yyyyMMdd_hhmmss");
			String strDate = ft.format(date);
			System.out.println(strDate);		// ���� �����ð����� ���ϸ� �ٸ���
			String realPath = null;

			outFile = new FileOutputStream("E:\\Xls_test_code.xls");
			workbook.write(outFile);
			outFile.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		return "total-input-search.jsp";
	}
}