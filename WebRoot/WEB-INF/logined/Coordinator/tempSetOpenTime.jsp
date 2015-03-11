<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Set Open Time</title>
</head>

<body>
	<table>
		<tr>
			<th>Time</th>
			<th>Modify to Change</th>
		</tr>
		<tr>
			<td>Upload Topics</td>
			<td><form action="${pageContext.request.contextPath }/tempSetOpenTime.do?flag=setUploadTopicTime" method="post"><input type="text" name="start" value="${UTstartDateTime }"><input type="text" name="end" value="${UTendDateTime }"><input type="submit" value="submit"></form></td>
		</tr>
		<tr>
			<td>Choose Topics</td>
			<td><form action="${pageContext.request.contextPath }/tempSetOpenTime.do?flag=setChooseTopicTime" method="post"><input type="text" name="start" value="${CTstartDateTime }"><input type="text" name="end" value="${CTendDateTime }"><input type="submit" value="submit"></form></td>
		</tr>
		<tr>
			<td>Choose Examiner</td>
			<td><form action="${pageContext.request.contextPath }/tempSetOpenTime.do?flag=setChooseExaminerTime" method="post"><input type="text" name="start" value="${CEstartDateTime }"><input type="text" name="end" value="${CEendDateTime }"><input type="submit" value="submit"></form></td>
		</tr>
		<tr>
			<td>Choose Presentation Time</td>
			<td><form action="${pageContext.request.contextPath }/tempSetOpenTime.do?flag=setChoosePresentationTime" method="post"><input type="text" name="start" value="${CPstartDateTime }"><input type="text" name="end" value="${CPendDateTime }"><input type="submit" value="submit"></form></td>
		</tr>
		<tr>
			<td>Presentation Period</td>
			<td><form action="${pageContext.request.contextPath }/tempSetOpenTime.do?flag=setPresentationTime" method="post"><input type="text" name="start" value="${PreStartDateTime }"><input type="text" name="end" value="${PreEndDateTime }"><input type="submit" value="submit"></form></td>
		</tr>
	</table>
</body>
</html>