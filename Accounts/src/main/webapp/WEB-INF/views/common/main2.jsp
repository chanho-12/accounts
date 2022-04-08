<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Smart Account</title>
    <style>
    section {
   position: relative;
   }
/*    section>div {
      width: 700px;
      background: #ccffff;
   }
   section div table {
      width: 680px;
      background: white;
   } */
    </style>
    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
    <script   type="text/javascript">
    $(function(){
       //최근 등록한 공지글 3개출력되게하는 함수
       $.ajax({
          url: "ntop3.do",
          type: "post",
          dataType: "json",
          success: function(data){
             console.log("success : "+data);  //Object로 받아짐
             
             //Object로받은걸 String으로 바꿈
             var jsonStr = JSON.stringify(data);
             
             //String으로바꾼걸 실제사용할 json객체로 바꿈
             var json = JSON.parse(jsonStr);
             
             var values = "";
             for(var i in json.list){ //i변수가 자동으로1씩증가
                values += "<tr><td>"+json.list[i].noticeno+"</td><td><a href='ndetail.do?noticeno="+json.list[i].noticeno+"'>"
                      +decodeURIComponent(json.list[i].noticetitle).replace(/\+/gi, " ")+"</a></td><td>"+json.list[i].noticedate+"</td></tr>";
                      
                
                
             } //for in문 닫기
             
             $("#newnotice").html($("#newnotice").html()+values);
             
          },
          error: function(jqXHR, textstatus, errorthrown){
             console.log("error : "+jqXHR+", "+textstatus+", "+errorthrown);
          }
          
       });
       
       
       //조회수많은 인기게시원글 상위3개 조회출력
       $.ajax({
          url: "btop3.do",
          type: "post",
          dataType: "json",
          success: function(data){
             console.log("success : "+data);  //Object로 받아짐
             
             //Object로받은걸 String으로 바꿈
             var jsonStr = JSON.stringify(data);
             
             //String으로바꾼걸 실제사용할 json객체로 바꿈
             var json = JSON.parse(jsonStr);
             
             var values = "";
             for(var i in json.list){ //i변수가 자동으로1씩증가
                values += "<tr><td>"+json.list[i].board_num+"</td><td><a href='bdetail.do?board_num="+json.list[i].board_num+"'>"
                      +decodeURIComponent(json.list[i].board_title).replace(/\+/gi, " ")+"</a></td><td>"+json.list[i].board_readcount+"</td></tr>";
                      
                
                
             } //for in문 닫기
             
             $("#toplist").html($("#toplist").html()+values);
             
          },
          error: function(jqXHR, textstatus, errorthrown){
             console.log("error : "+jqXHR+", "+textstatus+", "+errorthrown);
          }
          
       });
       
    });    
    
    
   function movePage(){
      location.href="loginPage.do";
   }
   
   </script>

    <!-- Custom fonts for this template-->
    <link href="${ pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${ pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
   
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function addComma(){
   var regexp = /\B(?=(\d{3})+(?!\d))/g;
   return num.toString().replace(regexp, ',');
}
</script>
<script type="text/javascript">
   $(function(){ 
         var camera = "${ sessionScope.loginMember.userid }";
         $.ajax({
            url: "acc.do",
            type: "post",
            dataType: "json",
            data: { userid : camera },
            success: function(data){
               console.log("success : "+ data);
               var jsonStr = JSON.stringify(data);     
               var json = JSON.parse(jsonStr);
               var values = "";
               $("#cameara_total11").html(data) + addComma;
            },
            error: function(jqXHR, textstatus, errorthrown){
                console.log("error : "+ jqXHR + ", " + textstatus + ", "+ errorthrown);
             }
         }); 
      });   
</script>

<script type="text/javascript">
   $(function(){ 
         var camera = "${ sessionScope.loginMember.userid }";
         $.ajax({
            url: "acd.do",
            type: "post",
            dataType: "json",
            data: { userid : camera },
            success: function(data){
               console.log("success : "+ data);
               var jsonStr = JSON.stringify(data);     
               var json = JSON.parse(jsonStr);
               var values = "";
               $("#cameara_total12").html(data);
            },
            error: function(jqXHR, textstatus, errorthrown){
                console.log("error : "+ jqXHR + ", " + textstatus + ", "+ errorthrown);
             }
         }); 
      });   
</script>

<script type="text/javascript">
   $(function(){ 
         var camera = "${ sessionScope.loginMember.userid }";
         $.ajax({
            url: "ace.do",
            type: "post",
            dataType: "json",
            data: { userid : camera },
            success: function(data){
               console.log("success : "+ data);
               var jsonStr = JSON.stringify(data);     
               var json = JSON.parse(jsonStr);
               var values = "";
               $("#cameara_total13").html(data);
            },
            error: function(jqXHR, textstatus, errorthrown){
                console.log("error : "+ jqXHR + ", " + textstatus + ", "+ errorthrown);
             }
         }); 
      });   
</script>
</head>

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
                <div class="sidebar-brand-text mx-3">Smart Account <sup></sup></div>
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
                   <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                       <i class="fas fa-fw fa-cog"></i>
                       <span>공지 및 게시판</span>
                   </a>
                   <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                       <div class="bg-white py-2 collapse-inner rounded">
                           <h6 class="collapse-header"></h6>
                           <a class="collapse-item" href="/accounts/nlist.do">공지사항</a>
                           <a class="collapse-item" href="/accounts/blist.do?page=1">게시판</a>
                       </div>
                   </div>
               </li>
            </c:if>
            <!-- 로그인한경우 : 관리자 -->
            <c:if test="${ !empty loginMember and loginMember.admin eq 'Y'}" >
               <li class="nav-item">
                   <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                       <i class="fas fa-fw fa-cog"></i>
                       <span>공지 및 게시판</span>
                   </a>
                   <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                       <div class="bg-white py-2 collapse-inner rounded">
                           <h6 class="collapse-header"></h6>
                           <a class="collapse-item" href="/accounts/nlist.do">공지사항</a>
                           <a class="collapse-item" href="/accounts/blist.do?page=1">게시판</a>
                       </div>
                   </div>
               </li>
            </c:if>
            <!-- 로그인한경우 : 일반회원 -->
            <c:if test="${ !empty loginMember and loginMember.admin ne 'Y' }">
               <li class="nav-item">
                   <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                       <i class="fas fa-fw fa-cog"></i>
                       <span>공지 및 게시판</span>
                   </a>
                   <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                       <div class="bg-white py-2 collapse-inner rounded">
                           <h6 class="collapse-header"></h6>
                           <a class="collapse-item" href="/accounts/nlist.do">공지사항</a>
                           <a class="collapse-item" href="/accounts/blist.do?page=1">게시판</a>
                       </div>
                   </div>
               </li>
         </c:if>
         
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
                <img class="sidebar-card-illustration mb-2" src="/Accounts/resources/img/undraw_rocket.svg" alt="...">
                <p class="text-center mb-2"><strong>SB Admin Pro</strong> is packed with premium features, components, and more!</p>
                <a class="btn btn-success btn-sm" href="https://startbootstrap.com/theme/sb-admin-pro">Upgrade to Pro!</a>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

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
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
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
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
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
                           <c:if test="${ empty loginMember }" >
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" onclick="movePage();"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <c:url var="callMyInfo" value="myinfo.do">
                                   <c:param name="userid" value="${ loginMember.userid }" />
                                </c:url>
                                <a class="dropdown-item" href="${ callMyInfo }">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="${ pageContext.servletContext.contextPath }/mlist.do">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Member Management
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Board Management
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
                  <h1 class="h3 mb-0 text-gray-800" align="center">가계부</h1>
                  
               </div>
               
            
                  <div align="center">
                  
                  </div>
               <!-- Content Row -->
               <div class="row">

                  <!-- Earnings (Monthly) Card Example -->
                  <div class="col-xl-3 col-md-6 mb-4">
                     <div class="card border-left-primary shadow h-100 py-2">
                        <div class="card-body">
                           <div class="row no-gutters align-items-center">
                              <div class="col mr-2">
                                 <div
                                    class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                    오늘 지출금액</div>
                                 <div class="h5 mb-0 font-weight-bold text-gray-800" id="cameara_total11" ></div>
                                                                                    
                              </div>
                              <div class="col-auto">
                                 <i class="fas fa-calendar fa-2x text-gray-300"></i>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>

                  <!-- Earnings (Monthly) Card Example -->
                  <div class="col-xl-3 col-md-6 mb-4">
                     <div class="card border-left-success shadow h-100 py-2">
                        <div class="card-body">
                           <div class="row no-gutters align-items-center">
                              <div class="col mr-2">
                                 <div
                                    class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                    월간 지출금액</div>
                                 <div class="h5 mb-0 font-weight-bold text-gray-800" id="cameara_total12"></div>
                              </div>
                              <div class="col-auto">
                                 <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>

                  <!-- Earnings (Monthly) Card Example -->
                  <div class="col-xl-3 col-md-6 mb-4">
                     <div class="card border-left-info shadow h-100 py-2">
                        <div class="card-body">
                           <div class="row no-gutters align-items-center">
                              <div class="col mr-2">
                                 <div
                                    class="text-xs font-weight-bold text-info text-uppercase mb-1">다음
                                    지출금액(예상액)</div>
                                 <div class="row no-gutters align-items-center">
                                    <div class="col-auto">
                                       <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800" id="cameara_total13"></div>
                                    </div>
                                 </div>
                              </div>
                              <div class="col-auto">
                                 <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>



                  <!-- Content Row -->

                  <div class="row">

                     <!-- Area Chart -->
                     <div class="col-xl-8 col-lg-7">
                        <div class="card shadow mb-4">
                           <!-- Card Header - Dropdown -->
                           <div
                              class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                              <h6 class="m-0 font-weight-bold text-primary">주간 그래프</h6>
                              <div class="dropdown no-arrow">
                                 <div
                                    class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                    aria-labelledby="dropdownMenuLink">
                                    <div class="dropdown-header">Dropdown Header:</div>
                                    <a class="dropdown-item" href="#">Action</a> <a
                                       class="dropdown-item" href="#">Another action</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                 </div>
                              </div>
                           </div>
                           <!-- Card Body -->
                           <!-- chart-area-demo.js -->
                           <div class="card-body">
                              <div class="chart-area" >
                                 <canvas id="myAreaChart" ></canvas>
                              </div>
                           </div>
                        </div>
                     </div>
                        
                        <!-- Approach -->
                        <div class="col-xl-4 col-lg-5">
                           <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Notice</h6>
                                </div>
                                <div class="card-body">
                                    <section>
                              <!-- 최근등록 3개조회출력 -->
                              <div style="float:left; border: 1px solid navy; padding: 5px; margin: 5px;">
                                 <h4>최근 공지글</h4>
                                 <table id="newnotice" border="1" cellspacing="0">
                                    <tr>
                                       <th>번호</th>
                                       <th>제목</th>
                                       <th>날짜</th>
                                    </tr>
                                 </table>
                              </div>
                              
                              <!-- 조회수많은게시글 3개조회출력 -->
                              <div style="float:left; border: 1px solid navy; padding: 5px; margin: 5px;">
                                 <h4>인기 게시글</h4>
                                 <table id="toplist" border="1" cellspacing="0">
                                    <tr>
                                       <th>번호</th>
                                       <th>제목</th>
                                       <th>조회수</th>
                                    </tr>
                                 </table>
                              </div>
                           </section>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
            
            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a role="button" class="btn btn-primary" onclick="javascript:location.href='logout.do';">Logout</a>
                    
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="${ pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${ pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${ pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${ pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="${ pageContext.request.contextPath}/resources/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${ pageContext.request.contextPath}/resources/js/demo/chart-area-demo.js"></script>
    <script src="${ pageContext.request.contextPath}/resources/js/demo/chart-pie-demo.js"></script>

</body>

</html>