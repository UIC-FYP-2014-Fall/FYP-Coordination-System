package com.uic.test;

import java.util.Date;

import com.uic.util.BaseUtil;
import com.uic.util.SystemUtil;

public class testProperties {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		/*String startTime = SystemUtil.getKeyValue("PreStartTime");

		System.out.println(startTime);

		Date nowDate = new Date();

		System.out.println(nowDate);

		Date sT = BaseUtil.StringConvertDate(startTime);
		
		System.out.println(sT);
		

		boolean flag = sT.before(nowDate);
		
		if (flag)
			
			System.out.print("早于今天");
		
		else
			
			System.out.print("晚于今天");*/
		
		//System.out.println(SystemUtil.getKeyValue("DefaultTeacherPassword"));
		SystemUtil.writeProperties("PreStartTime", "2014-10-31 12:00:00");
		//SystemUtil.delete();

	}

}
