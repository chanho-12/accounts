<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="listCount" value="${ requestScope.listCount }" />
<c:set var="startPage" value="${ requestScope.startPage }" />
<c:set var="endPage" value="${ requestScope.endPage }" />
<c:set var="maxPage" value="${ requestScope.maxPage }" />
<c:set var="currentPage" value="${ requestScope.currentPage }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function showWriteForm(){
   location.href="${ pageContext.servletContext.contextPath }/bwform.do";
   
}

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
                <div class="sidebar-brand-text mx-3">Smart <br>Account</div>
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
                           <h6 class="collapse-header">Custom Components:</h6>
                           <a class="collapse-item" href="/accounts/nlist.do">Notice</a>
                           <a class="collapse-item" href="/accounts/blist.do?page=1">Board</a>
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
                           <h6 class="collapse-header">Custom Components:</h6>
                           <a class="collapse-item" href="/accounts/nlist.do">Notice</a>
                           <a class="collapse-item" href="/accounts/blist.do?page=1">Board</a>
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
                           <h6 class="collapse-header">Custom Components:</h6>
                           <a class="collapse-item" href="/accounts/nlist.do">Notice</a>
                           <a class="collapse-item" href="/accounts/blist.do?page=1">Board</a>
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
                    <span>Pages</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Login Screens:</h6>
                        <a class="collapse-item" href="loginPage.do">Login</a>
                        <a class="collapse-item" href="enrollPage.do">Register</a>
                        
                    </div>
                </div>
            </li>
         </c:if>
         
            <!-- Nav Item - Charts -->
            <c:if test="${ empty loginMember }">
            <li class="nav-item">
                <a class="nav-link" href="loginPage.do">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Camera</span></a>
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
                           <h6 class="collapse-header">Custom Components:</h6>
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
                           <h6 class="collapse-header">Custom Components:</h6>
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
                <a class="nav-link" href="accountbook.do">
                    <i class="fas fa-fw fa-table"></i>
                    <span>가계부</span></a>
            </li>
            </c:if>
            
            <!-- 로그인:일반회원 -->
            <c:if test="${ !empty loginMember and loginMember.admin ne 'Y' }">
            <li class="nav-item">
                <a class="nav-link" href="accountbook.do">
                    <i class="fas fa-fw fa-table"></i>
                    <span>가계부</span></a>
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
            
<h2 align="center">게시글 목록 : 총 ${ listCount } 개</h2>
<c:if test="${ !empty sessionScope.loginMember }">
   <div style="align:center; text-align:center;">
      <button onclick="showWriteForm();">글쓰기</button>
   </div>
</c:if>
<br>
<table align="center" border="1" width="700" cellspacing="0">
   <tr><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th><th>첨부파일</th></tr>
   <c:forEach items="${ requestScope.list }" var="b">
      <tr>
         <td>${ b.board_num }</td>
         
         <td>
         <!-- 제목글자앞에 댓글인지 대댓글인지 표시기호 , 들려쓰기  -->
         <c:if test="${ b.board_lev eq 2 }">&nbsp; &nbsp; ▶ </c:if>
         <c:if test="${ b.board_lev eq 3 }">&nbsp; &nbsp; &nbsp; &nbsp; ▶▶ </c:if>
         <!-- 로그인한회원만 상세보기 볼수있도록 -->
         <c:if test="${ !empty sessionScope.loginMember }">
            <c:url var="bdt" value="bdetail.do">
               <c:param name="board_num" value="${ b.board_num }" />
               <c:param name="page" value="${ currentPage }" />
            </c:url>
            <a href="${ bdt }">${ b.board_title }</a>
         </c:if>
         
         
         <c:if test="${ empty sessionScope.loginMember }">
            <a>${ b.board_title }</a>
         </c:if>      
         </td>
         
         <td>${ b.board_writer }</td>
         
         <td><fmt:formatDate value="${ b.board_date }" type="date" pattern="yyyy-MM-dd" /></td>
         
         <td>${ b.board_readcount }</td>
         
         <td>
         <c:if test="${ !empty b.board_original_filename }">
         ◎
         </c:if>
         <c:if test="${ empty b.board_original_filename }">
         &nbsp;
         </c:if>
         </td>
         
      </tr>
   </c:forEach>
</table>
<br>
<!-- 페이징처리 -->
<div style="text-align:center;">
<!-- 1페이지로이동 -->
<c:if test="${ currentPage eq 1 }">
   [맨처음] &nbsp;
</c:if>
<c:if test="${ currentPage > 1 }">
   <c:url var="blf" value="/blist.do">
      <c:param name="page" value="1" />
   </c:url>
   <a href="${ blf }">[맨처음]</a>
</c:if>


<!-- 이전페이지그룹으로 이동처리 -->
<c:if test="${ (currentPage - 10) < startPage and (currentPage - 10) > 1 }">
   <c:url var="blf2" value="/blist.do">
      <c:param name="page" value="${ startPage -10 }" />
   </c:url>
   <a href="${ blf2 }">[이전그룹]</a>
</c:if>
<c:if test="${ !((currentPage - 10) < startPage and (currentPage - 10) > 1) }">
   [이전그룹] &nbsp;
</c:if>


<!-- 현재페이지속한 페이지그룹 출력 -->
<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
   <c:if test="${ p eq currentPage }">
      <font size="4" color="red"><b>[${ p }]</b></font>
   </c:if>
   <c:if test="${ p ne currentPage }">
      <c:url var="blt5" value="/blist.do">
      <c:param name="page" value="${ p }" />
   </c:url>
   <a href="${ blt5 }">${ p }</a>
   </c:if>
</c:forEach>

<!-- 다음페이지그룹으로 이동처리 -->
<c:if test="${ (currentPage + 10) > endPage and (currentPage + 10) < maxPage }">
   <c:url var="blf3" value="/blist.do">
      <c:param name="page" value="${ endPage + 10 }" />
   </c:url>
   <a href="${ blf3 }">[다음그룹]</a>
</c:if>
<c:if test="${ !((currentPage - 10) > endPage and (currentPage + 10) < maxPage) }">
   [다음그룹] &nbsp;
</c:if>


<!-- 끝페이지이동 -->
<c:if test="${ currentPage eq maxPage }">
   [맨끝] &nbsp;
</c:if>
<c:if test="${ currentPage < maxPage }">
   <c:url var="blf4" value="/blist.do">
      <c:param name="page" value="${ maxPage }" />
   </c:url>
   <a href="${ blf4 }">[맨끝]</a>
</c:if>
</div>

<br>
<br>
<br>
<table align="center">
<td>
<a href="${ pageContext.servletContext.contextPath }/main.do">HOME</a>
</td>
</table>



            
            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <c:import url="/WEB-INF/views/common/footer.jsp" />
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
    <script src="${ pageContext.request.contextPath}/resources/js/demo/chart-area-demo1.js"></script>
    <script src="${ pageContext.request.contextPath}/resources/js/demo/chart-pie-demo.js"></script>








</body>
</html>