/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.uic.web.struts.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.uic.util.BaseUtil;
import com.uic.util.PropertiesHelper;
import com.uic.web.struts.form.PreTimeForm;

/**
 * MyEclipse Struts Creation date: 11-07-2014
 * 
 * XDoclet definition:
 * 
 * @struts.action parameter="flag"
 */
public class OpenTimeAction extends DispatchAction {
	/*
	 * Generated Methods
	 */

	/**
	 * Method execute
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward goUi(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		if (request.getSession().getAttribute("role").equals("coordinator")) {
			//prepare data for the jsp page
			PropertiesHelper ph = new PropertiesHelper("/WEB-INF/config/FYP-system.properties");
			//upload topics for teachers time
			String UTstartDateTime = ph.getProperties("UploadTopicsStartDateTime");
			String UTendDateTime = ph.getProperties("UploadTopicsEndDateTime");
			//choose topic for students time
			String CTstartDateTime = ph.getProperties("ChooseTopicStartDateTime");
			String CTendDateTime = ph.getProperties("ChooseTopicEndDateTime");
			//choose examiners for students time
			String CEstartDateTime = ph.getProperties("ChooseExaminersStartDateTime");
			String CEendDateTime = ph.getProperties("ChooseExaminersEndDateTime");
			
			//System.out.println(startDateTime);
			//upload topics time load
			if(UTstartDateTime!=null&&UTendDateTime!=null){			
				String[] start = UTstartDateTime.split(" ");
				String[] end = UTendDateTime.split(" ");
				String[] startTime = start[1].split(":");
				String[] endTime = end[1].split(":");
				
				request.setAttribute("UTstartDate", start[0]);
				request.setAttribute("UTstartHH", startTime[0]);
				request.setAttribute("UTstartMM", startTime[1]);
				request.setAttribute("UTstartSS", startTime[2]);
				request.setAttribute("UTendDate", end[0]);
				request.setAttribute("UTendHH", endTime[0]);
				request.setAttribute("UTendMM", endTime[1]);
				request.setAttribute("UTendSS", endTime[2]);
				
				request.setAttribute("UploadTopicsDateTime", "true");
				request.setAttribute("UploadTopicsStartDateTime", UTstartDateTime);
				request.setAttribute("UploadTopicsEndDateTime", UTendDateTime);
			}else{
				request.setAttribute("UploadTopicsDateTime", "false");
			}
			//choose topic time load
			if(CTstartDateTime!=null&&CTendDateTime!=null){			
				String[] start = CTstartDateTime.split(" ");
				String[] end = CTendDateTime.split(" ");
				String[] startTime = start[1].split(":");
				String[] endTime = end[1].split(":");
				
				request.setAttribute("CTstartDate", start[0]);
				request.setAttribute("CTstartHH", startTime[0]);
				request.setAttribute("CTstartMM", startTime[1]);
				request.setAttribute("CTstartSS", startTime[2]);
				request.setAttribute("CTendDate", end[0]);
				request.setAttribute("CTendHH", endTime[0]);
				request.setAttribute("CTendMM", endTime[1]);
				request.setAttribute("CTendSS", endTime[2]);
				
				request.setAttribute("ChooseTopicDateTime", "true");
				request.setAttribute("ChooseTopicStartDateTime", CTstartDateTime);
				request.setAttribute("ChooseTopicEndDateTime", CTendDateTime);
			}else{
				request.setAttribute("ChooseTopicDateTime", "false");
			}
			//choose examiners time load
			if(CEstartDateTime!=null&&CEendDateTime!=null){			
				String[] start = CEstartDateTime.split(" ");
				String[] end = CEendDateTime.split(" ");
				String[] startTime = start[1].split(":");
				String[] endTime = end[1].split(":");
				
				request.setAttribute("CEstartDate", start[0]);
				request.setAttribute("CEstartHH", startTime[0]);
				request.setAttribute("CEstartMM", startTime[1]);
				request.setAttribute("CEstartSS", startTime[2]);
				request.setAttribute("CEendDate", end[0]);
				request.setAttribute("CEendHH", endTime[0]);
				request.setAttribute("CEendMM", endTime[1]);
				request.setAttribute("CEendSS", endTime[2]);
				
				request.setAttribute("ChooseExaminersDateTime", "true");
				request.setAttribute("ChooseExaminersStartDateTime", CEstartDateTime);
				request.setAttribute("ChooseExaminersEndDateTime", CEendDateTime);
			}else{
				request.setAttribute("ChooseExaminersDateTime", "false");
			}

			return mapping.findForward("goOpenTimeUi");
		} else {
			request.setAttribute("msg", "ERROR: Permission denied.");
			return mapping.findForward("goLogin");
		}
	}
	
	public ActionForward saveUploadTopicsDateTime(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		if (request.getSession().getAttribute("role").equals("coordinator")) {
			PreTimeForm dateTimeForm = (PreTimeForm)form;
			
			//get date and time from jsp
			String startDate = dateTimeForm.getStartDate();
			String startTime = dateTimeForm.getStartTime();
			String endDate = dateTimeForm.getEndDate();
			String endTime = dateTimeForm.getEndTime();
			
			//format conversion
			String startDateTime = startDate+" "+startTime;
			String endDateTime = endDate+" "+endTime;
			
			java.util.Date dStartTime = BaseUtil.StringConvertDate(startDateTime);
			java.util.Date dEndTime = BaseUtil.StringConvertDate(endDateTime);
			
			java.util.Date nowDate = new java.util.Date();
			
			if(dStartTime.after(nowDate)&&dEndTime.after(nowDate)&&dStartTime.before(dEndTime)){
				PropertiesHelper ph = new PropertiesHelper("/WEB-INF/config/FYP-system.properties");
				
				try {
					ph.setProperties("UploadTopicsStartDateTime", startDateTime);
					ph.setProperties("UploadTopicsEndDateTime", endDateTime);
					ph.setProperties("UploadTopicsDateTimeState", "true");
					
					/*ph.setProperties("ChooseTopicDateTimeState", "false");
					ph.setProperties("ChooseExaminersDateTimeState", "false");*/
					
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				request.setAttribute("TimeOperation", "success");
				request.setAttribute("message", "Save upload topics time: from "+startDateTime+" to "+endDateTime+".");
			}else{
				request.setAttribute("TimeOperation", "error");
				request.setAttribute("message", "Upload topics start or end time error! Please check.");
			}
			
			return new ActionForward("/openTime.do?flag=goUi");
		} else {
			request.setAttribute("msg", "ERROR: Permission denied.");
			return mapping.findForward("goLogin");
		}
	}
	
	public ActionForward saveChooseTopicDateTime(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		if (request.getSession().getAttribute("role").equals("coordinator")) {
			//get upload topics end time
			PropertiesHelper ph = new PropertiesHelper("/WEB-INF/config/FYP-system.properties");
			String state = ph.getProperties("UploadTopicsDateTimeState");
			if(state.equals("true")){
				String UTendDateTime = ph.getProperties("UploadTopicsEndDateTime");
				
				PreTimeForm dateTimeForm = (PreTimeForm)form;
				
				//get date and time from jsp
				String startDate = dateTimeForm.getCT_startDate();
				String startTime = dateTimeForm.getCT_startTime();
				String endDate = dateTimeForm.getCT_endDate();
				String endTime = dateTimeForm.getCT_endTime();
				
				//format conversion
				String startDateTime = startDate+" "+startTime;
				String endDateTime = endDate+" "+endTime;
				
				java.util.Date dStartTime = BaseUtil.StringConvertDate(startDateTime);
				java.util.Date dEndTime = BaseUtil.StringConvertDate(endDateTime);
				java.util.Date UTTime = BaseUtil.StringConvertDate(UTendDateTime);
				
				if(dStartTime.after(UTTime)&&dEndTime.after(UTTime)&&dStartTime.before(dEndTime)){
					try {
						ph.setProperties("ChooseTopicStartDateTime", startDateTime);
						ph.setProperties("ChooseTopicEndDateTime", endDateTime);
						ph.setProperties("ChooseTopicDateTimeState", "true");
					} catch (Exception e) {
						// TODO: handle exception
						e.printStackTrace();
					}
					request.setAttribute("TimeOperation", "success");
					request.setAttribute("message", "Save choose topic for student time: from "+startDateTime+" to "+endDateTime+".");
				}else{
					request.setAttribute("TimeOperation", "error");
					request.setAttribute("message", "Choose topic start or end time error! Please check.");
				}
			}else{
				request.setAttribute("TimeOperation", "error");
				request.setAttribute("message", "Upload topics time state is error! Please check.");
			}
			
			return new ActionForward("/openTime.do?flag=goUi");
		}else {
			request.setAttribute("msg", "ERROR: Permission denied.");
			return mapping.findForward("goLogin");
		}
		
	}
	public ActionForward saveChooseExaminersDateTime(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		if (request.getSession().getAttribute("role").equals("coordinator")) {
			//get upload topics end time
			PropertiesHelper ph = new PropertiesHelper("/WEB-INF/config/FYP-system.properties");
			
			String state1 = ph.getProperties("UploadTopicsDateTimeState");
			String state2 = ph.getProperties("ChooseTopicDateTimeState");
			
			if(state1.equals("true")&&state2.equals("true")){
				String CTendDateTime = ph.getProperties("ChooseTopicEndDateTime");
				
				PreTimeForm dateTimeForm = (PreTimeForm)form;
				
				//get date and time from jsp
				String startDate = dateTimeForm.getCE_startDate();
				String startTime = dateTimeForm.getCE_startTime();
				String endDate = dateTimeForm.getCE_endDate();
				String endTime = dateTimeForm.getCE_endTime();
				
				//format conversion
				String startDateTime = startDate+" "+startTime;
				String endDateTime = endDate+" "+endTime;
				
				java.util.Date dStartTime = BaseUtil.StringConvertDate(startDateTime);
				java.util.Date dEndTime = BaseUtil.StringConvertDate(endDateTime);
				java.util.Date CTTime = BaseUtil.StringConvertDate(CTendDateTime);
				
				if(dStartTime.after(CTTime)&&dEndTime.after(CTTime)&&dStartTime.before(dEndTime)){
					try {
						ph.setProperties("ChooseExaminersStartDateTime", startDateTime);
						ph.setProperties("ChooseExaminersEndDateTime", endDateTime);
						ph.setProperties("ChooseExaminersDateTimeState", "true");
					} catch (Exception e) {
						// TODO: handle exception
						e.printStackTrace();
					}
					request.setAttribute("TimeOperation", "success");
					request.setAttribute("message", "Save choose examiners for students time: from "+startDateTime+" to "+endDateTime+".");
				}else{
					request.setAttribute("TimeOperation", "error");
					request.setAttribute("message", "Choose examiners for students start or end time error! Please check.");
				}
			}else{
				request.setAttribute("TimeOperation", "error");
				request.setAttribute("message", "Choose topic for students or Upload topics for teachers time state is error! Please check.");
			}
			
			return new ActionForward("/openTime.do?flag=goUi");
		}else {
			request.setAttribute("msg", "ERROR: Permission denied.");
			return mapping.findForward("goLogin");
		}
	}
}