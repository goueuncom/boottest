package exceltest;

import java.io.FileOutputStream;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

/* xlsx 파일 출력시 선언
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
*/
public class XlsxWrite {
	
	static HSSFRow row;
	static HSSFCell cell;
	
	/* xlsx 파일 출력시 선언
	static XSSFRow row;
	static XSSFCell cell;
	*/
	
	public static void main(String[] args){
		
		HSSFWorkbook workbook = new HSSFWorkbook();
		//Sheet명 설정
		HSSFSheet sheet = workbook.createSheet("mySheet");
		
		/* xlsx 파일 출력시 선언
		XSSFWorkbook workbook = new XSSFWorkbook();
		XSSFSheet sheet = workbook.createSheet("mySheet");
		*/



		//출력 row 생성
		row = sheet.createRow(0);
		//출력 cell 생성
		row.createCell(0).setCellValue("DATA 11");
		row.createCell(1).setCellValue("DATA 12");
		row.createCell(2).setCellValue("DATA 13");

		//출력 row 생성
		row = sheet.createRow(1);
		//출력 cell 생성
		row.createCell(0).setCellValue("DATA 21");
		row.createCell(1).setCellValue("DATA 22");
		row.createCell(2).setCellValue("DATA 23");

		row = sheet.createRow(2);
		//출력 cell 생성
		row.createCell(0).setCellValue("DATA 31");
		row.createCell(1).setCellValue("DATA 32");
		row.createCell(2).setCellValue("DATA 33");

		// 출력 파일 위치및 파일명 설정
		FileOutputStream outFile;
		try {
			outFile = new FileOutputStream("E:\\XlsWrite.xls");
			workbook.write(outFile);
			outFile.close();
			
			System.out.println("파일생성 완료");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}