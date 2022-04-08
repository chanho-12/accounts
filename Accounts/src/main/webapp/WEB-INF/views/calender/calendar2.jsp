<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.test.Accounts.calendar.model.dao.ICalDao"%>
<%@page import="com.test.Accounts.calendar.model.dao.CalDaoImp"%>
<%@page import="com.test.Accounts.common.Util"%>
<%@page import="com.test.Accounts.calendar.model.vo.CalDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AccountCalendar</title>

<style type="text/css">
	#calendar{
		border-collapse: collapse; /* 테두리 실선*/
		border: 1px solid gray;
	}
	#calendar td{
		width:80px;
		height:80px;
		text-align:left;
		vertical-align:top;
		
	}
	a{
		text-decoration:none;
	}
	img{
		width:15px;
		height:15px;
	}
	td:hover{
		backgroungd-color:pink;
	}
	
	.cPreview{
		position:absolute;
		left:-20px;
		top:-30px;
		background:pink;
		width:40px;
		height:40px;
		text-align:conter;
		font-weight:bold;
		border-radius:20px 20px 1px 20px; 
	}
	
	td{
		position:relative;
	}
	
	td > p{
		margin-bottom:1px;
		font-size:5px;
		background-color:pink;
		color:white;
		
	}
</style>

<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function isTwo(str){
	return str.length<2?"0"+str:str;
}

$(function(){
	$(".countView").hover(function(){
		var aObj=$(this);
		var year=$(".y").text().trim();
		var month=$(".m").text().trim();
		var date=$(this).text().trim();
		var yyyyMMdd=year+isTwo(month)+isTwo(date);
		//alert(yyyyMMdd);
		
		$.ajax({
			method:"post",
			url:"calCountAjax.do",
			data:{"yyyyMMdd":yyyyMMdd},
			dataType:"text",
			async:false,
			success:function(val){
				//alert("통신성공"+val);
				aObj.after("<div class='cPreview'>"+val+"</div>");
			},
			error:function(){
				alert("통신실패");
			}
		});
		
	},function(){
		$(".cPreview").remove();		
	});
	
});

</script>


</head>
<%
	String paramYear=request.getParameter("year");
	String paramMonth=request.getParameter("month");

	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH)+1;
	
	if(paramYear != null){
		year=Integer.parseInt(paramYear);
		
	}
	if(paramMonth != null){
		month=Integer.parseInt(paramMonth);
	}
	if(month>12){
		month=1;
		year++;
	}
	if(month<1){
		month=12;
		year--;
	}
	
	cal.set(year, month-1, 1);
	int dayOfWeek=cal.get(Calendar.DAY_OF_WEEK);
	
	//현재월 마지막날
	int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	
	//해당달 게시글내용받아옴
	List<CalDto> clist=(List<CalDto>)request.getAttribute("clist");  //캐스팅
	
	
	/*String yyyymm = year + Util.isTwo(String.valueOf(month));
	
	Map<String,String> map = new HashMap<String,String>();
	map.put("id", "K001");
	map.put("yyyymm", yyyymm);
	
	ICalDao dao = new CalDaoImp();
	List<CalDto> clist= dao.calViewList(map); */  //왜에러나는지모름
	
%>


<body>

<!-- <h1 align="center">가계부 달력보기</h1> -->


<table border="1" id="calendar" align="center">
	<caption>
		<a href="calendar.do?year=<%=year-1%>&month=<%=month%>">◁</a>
		<a href="calendar.do?year=<%=year%>&month=<%=month-1%>">◀</a>
		<span class="y"><%=year%></span>년<span class="m"><%=month%></span>월
		<a href="calendar.do?year=<%=year%>&month=<%=month+1%>">▶</a>
		<a href="calendar.do?year=<%=year+1%>&month=<%=month%>">▷</a>
	</caption>
	<tr>
		<th>일</th>
		<th>월</th>
		<th>화</th>
		<th>수</th>
		<th>목</th>
		<th>금</th>
		<th>토</th>
	</tr>
	<tr>
		<%
			for(int i=0; i<dayOfWeek-1;i++){
				out.print("<td>&nbsp;</td>");
			}
			//날짜출력for문
			for(int i=1; i<=lastDay; i++){
				%>
				
				<td>
					<a class="countView" style="color:<%=Util.fontColor(dayOfWeek, i) %>;"  href="calBoardList.do?year=<%=year%>&month=<%=month%>&date=<%=i%>"><%=i%></a>
					
					<a href="insertCalForm.do?year=<%=year%>&month=<%=month%>&date=<%=i%>">
						<img src="${ pageContext.request.contextPath}/resources/img/pen.png" alt="내용추가" />
					</a>
					<%=getCalViewList(i,clist) %>
					<%-- <c:forEach items="${ requestScope.list }" var="c">
					${c.title}
					${c.writer }
					</c:forEach> --%>
					
				</td>			
				<%
				if((dayOfWeek-1+i)%7==0){
					out.print("</tr><tr>");
				}
			}
			//공백출력
			int countNbsp=(7-(dayOfWeek-1+lastDay)%7)%7;
			for(int i=0;i<countNbsp;i++){
				out.print("<td>&nbsp;</td>");
			}
		%>
	</tr>
</table>

<br>
<br><br>
<br><br>


<table align="center">
<tr>
<th>
<a href="main.do">
<button>메인으로돌아가기</button>
</a>
</th>

<th>
<button onclick="javascript:history.go(-1);">뒤로</button>
</th>
</tr>
</table>


<%!
	public String getCalViewList(int i, List<CalDto> clist){
		String d=Util.isTwo(i+"");
		String cList="";
		for(CalDto calDto : clist){
			if(calDto.getMdate().substring(6,8).equals(d)){
				cList+="<p>"
						+calDto.getContent()
						+"</p>";
			}
		}
		return cList;
	}
%>
</body>
</html>



