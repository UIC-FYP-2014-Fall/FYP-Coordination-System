package com.uic.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import jxl.Sheet;
import jxl.Workbook;

import com.uic.domain.Student;

public class ExcelHelper {
	/**
	 * 
	 * @param file
	 * @return
	 */
	public List<Student> addCustomerAssign(File file) {
		
		System.out.print(file.getPath());
		
		List<Student> ls = new ArrayList<Student>();
		jxl.Workbook rwb = null;
		
		try {
			InputStream is = new FileInputStream(file);
			rwb = Workbook.getWorkbook(is);
			// 使用第一个工作表
			Sheet rs = rwb.getSheet(0);

			int rsRows = rs.getRows();
			System.out.printf("总共%d行", rsRows);
			int rsColumns = rs.getColumns();
			System.out.printf("总共%d列", rsColumns);

			for (int i = 1; i < rsRows; i++) {// 如第一行为属性项则从第二行开始取数据(int i=0
												// ;i<rsRows;i++)
				// 从第一列读取
				String cell0 = rs.getCell(0, i).getContents() + " ";
				String cell1 = rs.getCell(1, i).getContents() + " ";
				System.out.println(cell0);
				String cell2 = rs.getCell(2, i).getContents() + " ";
				String cell3 = rs.getCell(3, i).getContents() + " ";
				String cell4 = rs.getCell(4, i).getContents() + " ";
				String cell5 = rs.getCell(5, i).getContents() + " ";
				String cell6 = rs.getCell(6, i).getContents() + " ";
				//String cell7 = rs.getCell(7, i).getContents() + " ";

				if (cell0 != null && !cell0.equals(" ") && cell1 != null
						&& !cell1.equals(" ") && cell2 != null
						&& !cell2.equals(" ") && cell3 != null
						&& !cell3.equals(" ") && cell4 != null
						&& !cell4.equals(" ") && cell5 != null
						&& !cell5.equals(" ") && cell6 != null
						&& !cell6.equals(" ")) {
					Student student = new Student();
					student.setSid(rs.getCell(0, i).getContents());
					student.setPassword(rs.getCell(1, i).getContents());
					student.setName(rs.getCell(2, i).getContents());
					student.setEmail(rs.getCell(3, i).getContents());
					student.setTelephone(rs.getCell(4, i).getContents());
					student.setSex(rs.getCell(5, i).getContents());
					student.setProgram(rs.getCell(6, i).getContents());
					ls.add(student);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rwb.close();
		}
		return ls;
	}
}
