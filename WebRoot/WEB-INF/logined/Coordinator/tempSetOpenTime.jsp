<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Set Open Time</title>
</head>

<body>
	<p>${tempMsg }  </p>
	<table>
		<tr>
			<th>Open Time Period</th>
			<th colspan="2">Modify to Change (eg:2015-03-14 09:00:00)</th>
		</tr>
		
		<tr>
			<td>Choose Topics</td>
			<td><form action="${pageContext.request.contextPath }/tempSetOpenTime.do?flag=setChooseTopicTime" method="post">From:<input type="text" name="start" value="${CTstartDateTime }"></td><td>To:<input type="text" name="end" value="${CTendDateTime }">&nbsp;<input type="submit" value="Submit"></form></td>
		</tr>
		<tr>
			<td>Choose Examiner</td>
			<td><form action="${pageContext.request.contextPath }/tempSetOpenTime.do?flag=setChooseExaminerTime" method="post">From:<input type="text" name="start" value="${CEstartDateTime }"></td><td>To:<input type="text" name="end" value="${CEendDateTime }">&nbsp;<input type="submit" value="Submit"></form></td>
		</tr>
		<tr>
			<td>Choose Presentation Time</td>
			<td><form action="${pageContext.request.contextPath }/tempSetOpenTime.do?flag=setChoosePresentationTime" method="post">From:<input type="text" name="start" value="${CPstartDateTime }"></td><td>To:<input type="text" name="end" value="${CPendDateTime }">&nbsp;<input type="submit" value="Submit"></form></td>
		</tr>
		<tr>
			<td>Presentation Period</td>
			<td><form action="${pageContext.request.contextPath }/tempSetOpenTime.do?flag=setPresentationTime" method="post">From:<input type="text" name="start" value="${PreStartDateTime }"></td><td>To:<input type="text" name="end" value="${PreEndDateTime }">&nbsp;<input type="submit" value="Submit"></form></td>
		</tr>
	</table>
</body>
</html>