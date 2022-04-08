<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.test.Accounts.calendar.model.dao.ICalDao"%>
<%@page import="com.test.Accounts.calendar.model.dao.CalDaoImp"%>
<%@page import="com.test.Accounts.common.Util"%>
<%@page import="com.test.Accounts.calendar.model.vo.CalDto"%>
<%@page import="com.test.Accounts.camera.model.vo.Camera"%>
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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<!-- Custom fonts for this template-->
<link
   href="${ pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
   rel="stylesheet" type="text/css">
<link
   href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
   rel="stylesheet">

<!-- Custom styles for this template-->
<link
   href="${ pageContext.request.contextPath}/resources/css/sb-admin-2.min.css"
   rel="stylesheet">

<script type="text/javascript"
   src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>


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
<script type="text/javascript">
   $(function(){ 
         var camera = "${ sessionScope.loginMember.userid }";
         $.ajax({
            url: "acc2.do",
            type: "post",
            dataType: "json",
            data: { userid : camera },
            success: function(data){
               console.log("success : "+ data);
               var jsonStr = JSON.stringify(data);     
               var json = JSON.parse(jsonStr);
               var values = "";
               $("#cameara_total11").html(data);
            },
            error: function(jqXHR, textstatus, errorthrown){
                console.log("error : "+ jqXHR + ", " + textstatus + ", "+ errorthrown);
             }
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
   List<Camera> camera=(List<Camera>)request.getAttribute("camera");
   
   
   /*String yyyymm = year + Util.isTwo(String.valueOf(month));
   
   Map<String,String> map = new HashMap<String,String>();
   map.put("id", "K001");
   map.put("yyyymm", yyyymm);
   
   ICalDao dao = new CalDaoImp();
   List<CalDto> clist= dao.calViewList(map); */  //왜에러나는지모름
   
%>


<body id="page-top">
<!-- Page Wrapper -->
   <div id="wrapper">

      <!-- Sidebar -->
      <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

         <!-- Sidebar - Brand -->
         <a class="sidebar-brand d-flex align-items-center justify-content-center" href="main.do">
            <div class="sidebar-brand-icon rotate-n-15">
               <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">Smart Account <sup></sup>
            </div>
         </a>

         <!-- Divider -->
         <hr class="sidebar-divider my-0">

         <!-- Nav Item - Dashboard -->
         <li class="nav-item active">
            <a class="nav-link" href="main.do">
               <i class="fas fa-fw fa-tachometer-alt"></i>
               <span>Dashboard</span></a>
         </li>

         <!-- Divider -->
         <hr class="sidebar-divider">

         <!-- Heading -->
         <div class="sidebar-heading">
            Providing Function
         </div>

         <!-- Nav Item - Pages Collapse Menu -->
         <!-- 로그인안한경우 보여질 기본메뉴 -->
            <c:if test="${ empty loginMember }">
               <li class="nav-item">
                   <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                       aria-expanded="true" aria-controls="collapseTwo">
                       <i class="fas fa-fw fa-cog"></i>
                       <span>공지 및 게시판</span>
                   </a>
                   <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                       <div class="bg-white py-2 collapse-inner rounded">
                           <h6 class="collapse-header"></h6>
                           <a class="collapse-item" href="${ pageContext.servletContext.contextPath }/nlist.do">공지사항</a>
                           <a class="collapse-item" href="${ pageContext.servletContext.contextPath }/blist.do?page=1">게시판</a>
                       </div>
                   </div>
               </li>
            </c:if>
            <!-- 로그인한경우 : 관리자 -->
            <c:if test="${ !empty loginMember and loginMember.admin eq 'Y'}" >
                 <li class="nav-item">
                   <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                       aria-expanded="true" aria-controls="collapseTwo">
                       <i class="fas fa-fw fa-cog"></i>
                       <span>공지 및 게시판</span>
                   </a>
                   <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                       <div class="bg-white py-2 collapse-inner rounded">
                           <h6 class="collapse-header"></h6>
                           <a class="collapse-item" href="${ pageContext.servletContext.contextPath }/nlist.do">공지사항</a>
                           <a class="collapse-item" href="${ pageContext.servletContext.contextPath }/blist.do?page=1">게시판</a>
                       </div>
                   </div>
               </li>
            </c:if>
            <!-- 로그인한경우 : 일반회원 -->
            <c:if test="${ !empty loginMember and loginMember.admin ne 'Y' }">
               <li class="nav-item">
                   <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                       aria-expanded="true" aria-controls="collapseTwo">
                       <i class="fas fa-fw fa-cog"></i>
                       <span>공지 및 게시판</span>
                   </a>
                   <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                       <div class="bg-white py-2 collapse-inner rounded">
                           <h6 class="collapse-header"></h6>
                           <a class="collapse-item" href="${ pageContext.servletContext.contextPath }/nlist.do">공지사항</a>
                           <a class="collapse-item" href="${ pageContext.servletContext.contextPath }/blist.do?page=1">게시판</a>
                       </div>
                   </div>
               </li>
            </c:if>
            
         <!-- Nav Item - Utilities Collapse Menu -->
         
         <!-- Nav Item - Pages Collapse Menu -->
         <!-- Nav Item - Pages Collapse Menu -->
            <!-- 로그인안한경우 -->
            <c:if test="${ empty loginMember }">
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>로그인 및 회원가입</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header"></h6>
                        <a class="collapse-item" href="loginPage.do">로그인</a>
                        <a class="collapse-item" href="enrollPage.do">회원가입</a>
                        
                    </div>
                </div>
            </li>
         </c:if>
         
            <!-- Nav Item - Charts -->
            <c:if test="${ empty loginMember }">
            <li class="nav-item">
                <a class="nav-link" href="loginPage.do">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>영수증</span></a>
            </li>
         </c:if>
         
         
         <!-- 로그인:관리자 -->
         <c:if test="${ !empty loginMember and loginMember.admin eq 'Y'}" >
            <li class="nav-item">
                   <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo33" aria-expanded="true" aria-controls="collapseTwo33">
                       <i class="fas fa-fw fa-cog"></i>
                       <span>영수증</span>
                   </a>
                   <div id="collapseTwo33" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                       <div class="bg-white py-2 collapse-inner rounded">
                           <h6 class="collapse-header"></h6>
                           <a class="collapse-item" href="clist.do">영수증내역</a>
                           <a class="collapse-item" href="cupload.do">영수증등록</a>
                       </div>
                   </div>
               </li>
         </c:if>
         
         <!-- 로그인:일반회원 -->
            <c:if test="${ !empty loginMember and loginMember.admin ne 'Y' }">
               <li class="nav-item">
                   <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo33" aria-expanded="true" aria-controls="collapseTwo33">
                       <i class="fas fa-fw fa-cog"></i>
                       <span>영수증</span>
                   </a>
                   <div id="collapseTwo33" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                       <div class="bg-white py-2 collapse-inner rounded">
                           <h6 class="collapse-header"></h6>
                           <a class="collapse-item" href="clist.do">영수증내역</a>
                           <a class="collapse-item" href="cupload.do">영수증등록</a>
                       </div>
                   </div>
               </li>
               
         </c:if>
            <!-- Nav Item - Tables -->
            <!-- 로그인없음 -->
            <c:if test="${ empty loginMember }">
            <li class="nav-item">
                <a class="nav-link" href="loginPage.do">
                    <i class="fas fa-fw fa-table"></i>
                    <span>가계부</span></a>
            </li>
         </c:if>
         
         <!-- 로그인:관리자 -->
         <c:if test="${ !empty loginMember and loginMember.admin eq 'Y'}" >
                     
               <li class="nav-item">
                   <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo332" aria-expanded="true" aria-controls="collapseTwo33">
                       <i class="fas fa-fw fa-table"></i>
                       <span>가계부</span>
                   </a>
                   <div id="collapseTwo332" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                       <div class="bg-white py-2 collapse-inner rounded">
                           <h6 class="collapse-header"></h6>
                           <a class="collapse-item" href="calendar.do">달력보기</a>
                           <a class="collapse-item" href="accountbook.do">소비패턴분석</a>
                       </div>
                   </div>
               </li>
            </c:if>
            
            <!-- 로그인:일반회원 -->
            <c:if test="${ !empty loginMember and loginMember.admin ne 'Y' }">
            <li class="nav-item">
                   <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo332" aria-expanded="true" aria-controls="collapseTwo33">
                       <i class="fas fa-fw fa-table"></i>
                       <span>가계부</span>
                   </a>
                   <div id="collapseTwo332" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                       <div class="bg-white py-2 collapse-inner rounded">
                           <h6 class="collapse-header"></h6>
                           <a class="collapse-item" href="calendar.do">달력보기</a>
                           <a class="collapse-item" href="accountbook.do">소비패턴분석</a>
                       </div>
                   </div>
               </li>
            </c:if>
            
         <!-- Divider -->
         <hr class="sidebar-divider d-none d-md-block">

         <!-- Sidebar Toggler (Sidebar) -->
         <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
         </div>

         <!-- Sidebar Message -->
         <div class="sidebar-card d-none d-lg-flex">
            <img class="sidebar-card-illustration mb-2" src="${ pageContext.request.contextPath}/resources/img/undraw_rocket.svg"   alt="...">
            <p class="text-center mb-2"><strong>SB Admin Pro</strong> is packed with premium features, components, and more!   </p>
            <a class="btn btn-success btn-sm" href="https://startbootstrap.com/theme/sb-admin-pro">Upgrade to Pro!</a>
         </div>

      </ul>
      <!-- End of Sidebar -->
      
      <!-- Content Wrapper -->
      <div id="content-wrapper" class="d-flex flex-column">

         <!-- Main Content -->
         <div id="content">

            <!-- Topbar -->
            <nav
               class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

               <!-- Sidebar Toggle (Topbar) -->
               <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                  <i class="fa fa-bars"></i>
               </button>

               <!-- Topbar Search -->
               <form
                  class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                  <div class="input-group">
                     
                     <div class="input-group-append">
                        
                     </div>
                  </div>
               </form>

               <!-- Topbar Navbar -->
               <ul class="navbar-nav ml-auto">

                  <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                  <li class="nav-item dropdown no-arrow d-sm-none">
                     <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" 
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-search fa-fw"></i>
                  </a> <!-- Dropdown - Messages -->
                     <div
                        class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                        aria-labelledby="searchDropdown">
                        <form class="form-inline mr-auto w-100 navbar-search">
                           <div class="input-group">
                              <input type="text"
                                 class="form-control bg-light border-0 small"
                                 placeholder="Search for..." aria-label="Search"
                                 aria-describedby="basic-addon2">
                              <div class="input-group-append">
                                 <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                 </button>
                              </div>
                           </div>
                        </form>
                     </div>
                  </li>

                  <!-- Nav Item - Alerts -->
                  <li class="nav-item dropdown no-arrow mx-1">
                     <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown"   role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        
                     </a>
                     <!-- Dropdown - Alerts -->
                     
                  </li>

                  <!-- Nav Item - Messages -->
                  <li class="nav-item dropdown no-arrow mx-1">
                     <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        
                     </a> 
                     <!-- Dropdown - Messages -->
                     
                  </li>

                  <div class="topbar-divider d-none d-sm-block"></div>

                  <!-- Nav Item - User Information -->
                  <li class="nav-item dropdown no-arrow">
                     <c:if   test="${ empty loginMember }">
                     <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" onclick="movePage();" 
                        data-toggle="dropdown"   aria-haspopup="true" aria-expanded="false">
                        <span class="mr-2 d-none d-lg-inline text-gray-600 small">Login</span>

                     </a>
                     </c:if>
                     <!-- 로그인한경우 : 관리자 -->
                     <c:if test="${ !empty loginMember and loginMember.admin eq 'Y' }">
                     <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">my menu</span>
                                
                            </a>
                        <!-- Dropdown - User Information -->
                        <div   class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                           aria-labelledby="userDropdown">
                           <c:url var="callMyInfo" value="myinfo.do">
                              <c:param name="userid" value="${ loginMember.userid }" />
                           </c:url>
                           <a class="dropdown-item" href="${ callMyInfo }"> <i
                              class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                              Profile
                           </a> <a class="dropdown-item"
                              href="${ pageContext.servletContext.contextPath }/mlist.do">
                              <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                              Member Management
                           </a> <a class="dropdown-item" href="#"> <i
                              class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> Board
                              Management
                           </a>
                           <div class="dropdown-divider"></div>
                           <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                              <i role="button" onclick="javascript:href='logout.do';" class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                              Logout


                           </a>
                        </div>
                        </c:if>
                        <!-- 로그인한경우 : 일반회원 -->
                     <c:if test="${ !empty loginMember and loginMember.admin ne 'Y' }">
                     <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">my menu</span>
                                
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <c:url var="callMyInfo2" value="myinfo.do">
                                   <c:param name="userid" value="${ loginMember.userid }" />
                                </c:url>
                                <a class="dropdown-item" href="${ callMyInfo2 }">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                   
                                    <i role="button" onclick="javascript:href='logout.do';" class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                    
                                    
                                </a>
                            </div>
                            </c:if>
                        </li>

                    </ul>

                </nav>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">

               <!-- Page Heading -->
               <div   class="d-sm-flex align-items-center justify-content-between mb-4">
                  <h1 class="h3 mb-0 text-gray-800" align="center">가계부 달력보기</h1>
                  
               </div>
               
               
                  <br>
                  
                  
                  <div align="center">
                  <caption>
                  <a href="calendar.do?year=<%=year-1%>&month=<%=month%>">◁</a>
                  <a href="calendar.do?year=<%=year%>&month=<%=month-1%>">◀</a>
                  <span class="y"><%=year%></span>년<span class="m"><%=month%></span>월
                  <a href="calendar.do?year=<%=year%>&month=<%=month+1%>">▶</a>
                  <a href="calendar.do?year=<%=year+1%>&month=<%=month%>">▷</a>
               </caption>
                  </div>
                  <table border="1" id="calendar" align="center">
               
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
                           <div id="cameara_total11"></div>
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
                              <%-- <%if()
                              
                              outprint("<div id="cameara_total11"></div>")
                              
                              %> --%>
                              <%-- <c:forEach items = "${ aa }" var = "aa">
                                  <div>${aa}</div>
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
               <%-- <input type="text" name="camera_date" value="${aa.camera_date}"> --%>
               </div>
               </div>
            </div>
            
                  
                  



         <!-- Footer -->
         <%-- <footer class="sticky-footer bg-white">
            <div class="container my-auto">
               <div class="copyright text-center my-auto">
                  <span>Copyright &copy; Your Website 2021</span>
                  <div>
                     <c:forEach items = "${ aa }" var = "aa">
                     <h1>${ aa.camera_date }asdfasdf</h1>
                     </c:forEach>
                     </div>
               </div>
            </div>
         </footer> --%>
         <!-- End of Footer -->
      
      </div>
      <!-- End of Content Wrapper -->

   
   <!-- End of Page Wrapper -->
   
   <!-- Scroll to Top Button-->
   <a class="scroll-to-top rounded" href="#page-top"> <i
      class="fas fa-angle-up"></i>
   </a>

   <!-- Logout Modal-->
   <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
               <button class="close" type="button" data-dismiss="modal"
                  aria-label="Close">
                  <span aria-hidden="true">×</span>
               </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready
               to end your current session.</div>
            <div class="modal-footer">
               <button class="btn btn-secondary" type="button"
                  data-dismiss="modal">Cancel</button>
               <a role="button" class="btn btn-primary"
                  onclick="javascript:location.href='logout.do';">Logout</a>

            </div>
         </div>
      </div>
   </div>

   <!-- Bootstrap core JavaScript-->
   <script
      src="${ pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
   <script
      src="${ pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

   <!-- Core plugin JavaScript-->
   <script
      src="${ pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

   <!-- Custom scripts for all pages-->
   <script
      src="${ pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>

   <!-- Page level plugins -->
   <script
      src="${ pageContext.request.contextPath}/resources/vendor/chart.js/Chart.min.js"></script>

   <!-- Page level custom scripts -->
   <script
      src="${ pageContext.request.contextPath}/resources/js/demo/chart-area-demo.js"></script>
   <script
      src="${ pageContext.request.contextPath}/resources/js/demo/chart-pie-demo.js"></script>
   


<!-- <table align="center">
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
</table> -->


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

   /* public String getCalViewList(int i, List<Camera> clist){
   String d=Util.isTwo(i+"");
   String cList="";
   for(Camera camera : clist){
      if(camera.getCamera_date2().substring(6,8).equals(d)){
         cList+="<p>"
               +camera.getCamera_total()
               +"</p>";
      }
   }
   return cList; */

%>

<%-- $(function(){ 
         var camera = "${ sessionScope.loginMember.userid }";
         $.ajax({
            url: "acc2.do",
            type: "post",
            dataType: "json",
            data: { userid : camera },
            success: function(data){
               console.log("success : "+ data);
               var jsonStr = JSON.stringify(data);     
               var json = JSON.parse(jsonStr);
               var values = "";
               $("#cameara_total11").html(data);
            },
            error: function(jqXHR, textstatus, errorthrown){
                console.log("error : "+ jqXHR + ", " + textstatus + ", "+ errorthrown);
             }
         }); 
      });   --%> 
</body>
</html>


