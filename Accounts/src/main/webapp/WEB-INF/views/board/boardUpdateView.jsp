<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="currentPage" value="${ requestScope.page }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
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
            
<h2 align="center">${ board.board_num } 번 게시글 수정페이지</h2>
<br>

<!-- 원글수정폼-->
<c:if test="${ board.board_lev eq 1 }">
<form action="boriginup.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="board_num" value="${ board.board_num }">
<input type="hidden" name="page" value="${ currentPage }">
<c:if test="${ !empty board.board_original_filename }">
   <input type="hidden" name="board_original_filename" value="${ board.board_original_filename }">
   <input type="hidden" name="board_rename_filename" value="${ board.board_rename_filename }">
</c:if>
<table align="center" width="500" border="1" cellspacing="0" cellpadding="5">
   <tr><th>제목</th><td><input type="text" name="board_title" value="${ board.board_title }"></td></tr>
   <tr><th>작성자</th><td><input type="text" name="board_writer" readonly value="${ board.board_writer }"></td></tr>
   
   <tr><th>첨부파일</th>
      <td>
      <!-- 원래 첨부파일이있는경우 -->
      <c:if test="${ !empty board.board_original_filename }">
         ${ board.board_original_filename } &nbsp;
         <input type="checkbox" name="delFlag" value="yes"> 파일삭제 <br>
      </c:if>
      <br>
      
      새로첨부 : <input type="file" name="upfile">
      
      </td>
      
   </tr>
         
   <tr><th>글내용</th><td><textarea name="board_content" rows="5" cols="50">${ board.board_content }</textarea></td></tr>
   <tr><<td colspan="2">
      <input type="submit" value="수정하기"> &nbsp;
      <input type="reset" value="수정취소"> &nbsp;
      <button onclick="javascript:history.go(-1); return false;">이전페이지로</button></td></tr>
</table>
</form>
</c:if>

<!-- 댓글대댓글수정폼 -->
<c:if test="${ board.board_lev ne 1 }">
<form action="boreplyup.do" method="post">
<input type="hidden" name="board_num" value="${ board.board_num }">
<input type="hidden" name="page" value="${ currentPage }">

<table align="center" width="500" border="1" cellspacing="0" cellpadding="5">
   <tr><th>제목</th><td><input type="text" name="board_title" value="${ board.board_title }"></td></tr>
   <tr><th>작성자</th><td><input type="text" name="board_writer" readonly value="${ board.board_writer }"></td></tr>
            
   <tr><th>글내용</th><td><textarea name="board_content" rows="5" cols="50">${ board.board_content }</textarea></td></tr>
   <tr><<td colspan="2">
      <input type="submit" value="수정하기"> &nbsp;
      <input type="reset" value="수정취소"> &nbsp;
      <button onclick="javascript:history.go(-1); return false;">이전페이지로</button></td></tr>
</table>
</form>
</c:if>
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