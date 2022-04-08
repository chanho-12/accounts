<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="com.test.Accounts.calendar.model.vo.CalDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	CalDto dto=(CalDto)request.getAttribute("dto");
%>
<body>
<h1 align="center">상세보기</h1>
<table border="1" align="center">
	<tr>
		<th>ID</th>
		<td>${ requestScope.dto.id }</td>
	</tr>
	<tr>
		<th>구매일</th>
		<td><%=toDates(dto.getMdate())%></td>
	</tr>
	<tr>
		<th>상호명</th>
		<td>${ dto.title }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea rows="10" cols="60" readonly>${ dto.content }</textarea></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" value="수정" onclick="location.href='updateForm.do?seq=${dto.seq}'"/>
			<%-- <input type="button" value="삭제" onclick="location.href='calMuldel.do?seq=${dto.seq}'" /> --%>
			<input type="button" value="목록" onclick="location.href='calBoardList.do'"/>
			<input type="button" value="달력" onclick="location.href='calendar.do?year=${sessionScope.ymd.year}&month=${sessionScope.ymd.month}'"/>
		</td>
	</tr>
</table>
</body>
<%!
	public String toDates(String mdate){
	
	
		String m=mdate.substring(0,4)+"-"
				+mdate.substring(4,6)+"-"
				+mdate.substring(6,8)+" "
				+mdate.substring(8,10)+":"
				+mdate.substring(10)+":00";
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일 HH시mm분");
		Timestamp tm = Timestamp.valueOf(m);
	
		return sdf.format(tm);
	}
 %>
</html>