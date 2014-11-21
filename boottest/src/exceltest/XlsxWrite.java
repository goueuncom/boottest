package exceltest;

import java.io.FileOutputStream;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

/* xlsx ���� ��½� ����
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
*/
public class XlsxWrite {
	
	static HSSFRow row;
	static HSSFCell cell;
	
	/* xlsx ���� ��½� ����
	static XSSFRow row;
	static XSSFCell cell;
	*/
	
	public static void main(String[] args){
		
		HSSFWorkbook workbook = new HSSFWorkbook();
		//Sheet�� ����
		HSSFSheet sheet = workbook.createSheet("mySheet");
		
		/* xlsx ���� ��½� ����
		XSSFWorkbook workbook = new XSSFWorkbook();
		XSSFSheet sheet = workbook.createSheet("mySheet");
		*/



		//��� row ����
		row = sheet.createRow(0);
		//��� cell ����
		row.createCell(0).setCellValue("DATA 11");
		row.createCell(1).setCellValue("DATA 12");
		row.createCell(2).setCellValue("DATA 13");

		//��� row ����
		row = sheet.createRow(1);
		//��� cell ����
		row.createCell(0).setCellValue("DATA 21");
		row.createCell(1).setCellValue("DATA 22");
		row.createCell(2).setCellValue("DATA 23");

		row = sheet.createRow(2);
		//��� cell ����
		row.createCell(0).setCellValue("DATA 31");
		row.createCell(1).setCellValue("DATA 32");
		row.createCell(2).setCellValue("DATA 33");

		// ��� ���� ��ġ�� ���ϸ� ����
		FileOutputStream outFile;
		try {
			outFile = new FileOutputStream("E:\\XlsWrite.xls");
			workbook.write(outFile);
			outFile.close();
			
			System.out.println("���ϻ��� �Ϸ�");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}