/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.uic.web.struts.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.uic.domain.AssessItem;
import com.uic.domain.Gradelevel;
import com.uic.domain.StudentGrade;
import com.uic.service.imp.AssessItemServiceImp;
import com.uic.service.imp.GradeLevelServiceImp;
import com.uic.service.inter.AssessItemServiceInter;
import com.uic.service.inter.GradeLevelServiceInter;


/**
 * MyEclipse Struts Creation date: 05-28-2015
 * 
 * XDoclet definition:
 * 
 * @struts.action parameter="flag"
 */
public class GradeReportAction extends DispatchAction {
	
	
	private List<AssessItem> getAssessItemList(){
		AssessItemServiceInter assessItemService = new AssessItemServiceImp();
		return assessItemService.getAssessItems();
	}
	
	private static List<Gradelevel> getLevelList(){
		GradeLevelServiceInter gradeLevelService = new GradeLevelServiceImp();
		List<Gradelevel> gradeLevelList = gradeLevelService.getValidGradeLevels();
		
		List<Gradelevel> list = new ArrayList<>();
		//repackage
		for(int i=0;i<gradeLevelList.size();i++){
			Gradelevel gradelevel = new Gradelevel();
			gradelevel=gradeLevelList.get(i);
			if(i==0){
				gradelevel.setPreTotal(gradeLevelList.get(i).getPercent());
			}else{
				gradelevel.setPreTotal((short) (gradeLevelList.get(i-1).getPreTotal()+gradeLevelList.get(i).getPercent()));
			}
			list.add(gradelevel);
		}
		return list;
	}
	
	/*private static HashMap<Integer, AssessItem> hashMapAssessItem(){
		HashMap<Integer , AssessItem> map = new HashMap<>();
		List<AssessItem> list = getAssessItemList();
		for(int i=0;i<list.size();i++){
			map.put(list.get(i).getId(), list.get(i));
		}
		return map;
	}*/
	/*private static HashMap<String, Short> getGradeLevelList(){
		GradeLevelServiceInter gradeLevelService = new GradeLevelServiceImp();
		List<Gradelevel> list = gradeLevelService.getValidGradeLevels();
		
		HashMap<String, Short> map = new HashMap<>();
		
		for(int i=0;i<list.size();i++){
			map.put(list.get(i).getGradeLevel(), list.get(i).getPercent());
		}
		return map;
	}*/
	
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
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		if (request.getSession().getAttribute("role").equals("coordinator")) {
			// 1. load data
			AssessItemServiceInter assessItemService = new AssessItemServiceImp();
			//check total Assessment Item percentage is 100%
			if(assessItemService.totalPercent()==100){
				//System.out.println("OK!");
				//List<AssessItem> assessItemList = assessItemService.getAssessItems();
				
				GradeLevelServiceInter gradeService = new GradeLevelServiceImp();
				//get valid studentGrade List
				List<StudentGrade> studentGradeList = gradeService.getValidStudentGrade();
				int sumCount = studentGradeList.size();
				// return page student grade data list
				List<StudentGrade> newStudentGradeList = new ArrayList<>();
				
				for(int i=0;i<studentGradeList.size();i++){
					// handle averageGrade for every valid student
					StudentGrade studentGrade = new StudentGrade();
					studentGrade = studentGradeList.get(i);
					
					studentGrade.setAssessItemGrade(gradeHelper(studentGradeList.get(i).getAverageGrade()));
					
					studentGrade.setTotalLetterGrade(getLetterGrade(i,sumCount));
					
					newStudentGradeList.add(studentGrade);
				}
				//System.out.println(assessItemList.size());
				//System.out.println(newStudentGradeList.size());
				
				if(getLevelList().size()>0&&(sumCount*getLevelList().get(0).getPercent()/100)<1){
					request.setAttribute("warnInfo", "true");
				}
				
				//System.out.println(newStudentGradeList.get(0).getStudent().getName());
				//System.out.println(newStudentGradeList.get(0).getAssessItemGrade().get(0).getGrade());
				// return assessItem List
				request.setAttribute("assessItemList", getAssessItemList());
				// return student grade list
				request.setAttribute("studentGradeList", newStudentGradeList);
				
				request.setAttribute("validateAssessmentItem", "true");
			}else{
				request.setAttribute("validateAssessmentItem", "false");
			}
			
			return mapping.findForward("goGradeReportUi");
		} else {
			request.setAttribute("msg", "ERROR: Permission denied.");
			return mapping.findForward("goLogin");
		}
	}
	
	private List<AssessItem> gradeHelper(String averageGrade) {
		// get grade record from database such as
		// String averageGrade="5,4.00;16,3.78;10,2.50;14,3.00;9,3.50;15,3.33;12,3.11;8,3.44;13,3.00;";
		List<AssessItem> list = getAssessItemList();
		List<AssessItem> newList = new ArrayList<>();
		
		//AssessItemServiceInter assessItemService = new AssessItemServiceImp();

		// remove the last ';
		char lastChar = averageGrade.charAt(averageGrade.length() - 1);

		if (lastChar == ';') {
			// remove
			averageGrade = averageGrade.substring(0, averageGrade.length() - 1);
		}
		// split grade record
		String[] tmp = averageGrade.split(";");
		
		//System.out.println(averageGrade);
		
		//List<AssessItem> assessItemList = new ArrayList<>();
		HashMap<String, String> map = new HashMap<>();
		
		for (int i = 0; i < tmp.length; i++) {
			String tmp2[] = tmp[i].split(",");
			map.put(tmp2[0], tmp2[1]);
		}
	
		for(int j=0;j<list.size();j++){
			AssessItem assessItem = new AssessItem();
			assessItem.setId(list.get(j).getId());
			assessItem.setGrade(map.get(list.get(j).getId()+""));
			newList.add(assessItem);
		}
		
		return newList;
	}
	
	/**
	 * 
	 * @param student
	 * @param studentGradeList
	 * @return final letter grade for the student order by grade level
	 */
	private String getLetterGrade(int index,int totalCount){
		
		String str = "";
		
		List<Gradelevel> list = getLevelList();

		if (list.size() > 0) {
			if ((totalCount * list.get(0).getPercent() / 100) >= 1) {

				for (int i = 0; i < list.size(); i++) {
					if (index <= Math.ceil(totalCount
							* list.get(i).getPreTotal() / 100)) {
						str = list.get(i).getGradeLevel();
						break;
					}
				}
			}
		}
		
		return str;
	}
	
	
	
}
