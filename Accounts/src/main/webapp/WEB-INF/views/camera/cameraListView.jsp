<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="listCount" value="${ requestScope.listCount }"/>
<c:set var="startPage" value="${ requestScope.startPage}"/>
<c:set var="endPage" value="${ requestScope.endPage}"/>
<c:set var="maxPage" value="${ requestScope.maxPage}"/>
<c:set var="currentPage" value="${ requestScope.currentPage}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
<title></title>
<style>
    section {
   position: relative;
   }
</style>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
   showDiv();
   
   $("input[name=item]").on("change", function(){
      showDiv();
   });
   
});

function showDiv(){
   if($("input[name=item]").eq(0).is(":checked")){
      $("#storeNameDiv").css("display", "block");
      $("#dateDiv").css("display", "none");
   }
   
   if($("input[name=item]").eq(1).is(":checked")){
      $("#storeNameDiv").css("display", "none");
      $("#dateDiv").css("display", "block");
   }
   

}
</script>
    <!-- Custom fonts for this template-->
    <link href="${ pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${ pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">

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
            <!-- ????????????????????? ????????? ???????????? -->
            <c:if test="${ empty loginMember }">
               <li class="nav-item">
                   <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                       <i class="fas fa-fw fa-cog"></i>
                       <span>?????? ??? ?????????</span>
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
            <!-- ?????????????????? : ????????? -->
            <c:if test="${ !empty loginMember and loginMember.admin eq 'Y'}" >
               <li class="nav-item">
                   <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                       <i class="fas fa-fw fa-cog"></i>
                       <span>?????? ??? ?????????</span>
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
            <!-- ?????????????????? : ???????????? -->
            <c:if test="${ !empty loginMember and loginMember.admin ne 'Y' }">
               <li class="nav-item">
                   <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                       <i class="fas fa-fw fa-cog"></i>
                       <span>?????? ??? ?????????</span>
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
            <!-- ????????????????????? -->
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
         
         
         <!-- ?????????:????????? -->
         <c:if test="${ !empty loginMember and loginMember.admin eq 'Y'}" >
            <li class="nav-item">
                   <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo33" aria-expanded="true" aria-controls="collapseTwo33">
                       <i class="fas fa-fw fa-cog"></i>
                       <span>?????????</span>
                   </a>
                   <div id="collapseTwo33" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                       <div class="bg-white py-2 collapse-inner rounded">
                           <h6 class="collapse-header">Custom Components:</h6>
                           <a class="collapse-item" href="clist.do">???????????????</a>
                           <a class="collapse-item" href="cupload.do">???????????????</a>
                       </div>
                   </div>
               </li>
         </c:if>
         
         <!-- ?????????:???????????? -->
            <c:if test="${ !empty loginMember and loginMember.admin ne 'Y' }">
               <li class="nav-item">
                   <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo33" aria-expanded="true" aria-controls="collapseTwo33">
                       <i class="fas fa-fw fa-cog"></i>
                       <span>?????????</span>
                   </a>
                   <div id="collapseTwo33" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                       <div class="bg-white py-2 collapse-inner rounded">
                           <h6 class="collapse-header">Custom Components:</h6>
                           <a class="collapse-item" href="clist.do">???????????????</a>
                           <a class="collapse-item" href="cupload.do">???????????????</a>
                       </div>
                   </div>
               </li>
               
         </c:if>
            <!-- Nav Item - Tables -->
            <!-- ??????????????? -->
            <c:if test="${ empty loginMember }">
            <li class="nav-item">
                <a class="nav-link" href="loginPage.do">
                    <i class="fas fa-fw fa-table"></i>
                    <span>?????????</span></a>
            </li>
         </c:if>
         
         <!-- ?????????:????????? -->
         <c:if test="${ !empty loginMember and loginMember.admin eq 'Y'}" >
         <li class="nav-item">
                <a class="nav-link" href="accountbook.do">
                    <i class="fas fa-fw fa-table"></i>
                    <span>?????????</span></a>
            </li>
            </c:if>
            
            <!-- ?????????:???????????? -->
            <c:if test="${ !empty loginMember and loginMember.admin ne 'Y' }">
            <li class="nav-item">
                <a class="nav-link" href="accountbook.do">
                    <i class="fas fa-fw fa-table"></i>
                    <span>?????????</span></a>
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
                            <!-- ?????????????????? : ????????? -->
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
                            <!-- ?????????????????? : ???????????? -->
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
            
            <hr>
<h1 align="center">????????? ??????</h1>


<!-- ?????? ?????? -->
<center>
<div>
   <h2>????????? ????????? ???????????????</h2>
   <input type="radio" name="item" value="storeName" checked> ????????? &nbsp; &nbsp; &nbsp;
   <input type="radio" name="item" value="date" > ?????? 
</div>
<div id="storeNameDiv">
   <form action="csearchStoreName.do" method="post">
       <label>????????? ???????????? ??????????????? : <input type="search" name="keyword"></label>
      <input type="submit" value="??????">
   </form>
</div>

<div id="dateDiv">
   <form action="csearchDate.do" method="post">
       <label>????????? ????????? ??????????????? : <input type="date" name="begin"> ~ <input type="date" name="end"></label>
      <input type="submit" value="??????">
   </form>
</div>
</center>
<!-- ?????? ?????? -->
<br>
<center>
   <button onclick="javascript:location.href='moveupload.do'">??? ????????? ??????</button>
</center>
<br>
<table align="center" width="500" border="1" cellspacing="0" cellpadding="1">
   <tr><th>?????????</th><th>????????????</th><th>??????</th><th>????????????</th></tr>
   <c:forEach items="${ requestScope.list }" var="c"> 
      <tr align="center">
         <td>
      <c:if test="${ !empty sessionScope.loginMember }">
         <c:url var="cdt" value="cdetail.do">
            <c:param name="camera_num" value="${ c.camera_num }"/>
            <c:param name="page" value="${ currentPage }"/>
         </c:url>
         <a href="${ cdt }">${ c.camera_storename }</a>
      </c:if>
      <c:if test="${ empty sessionScope.loginMember }">
         ${ b.board_title }
      </c:if>
         </td>
         <td>${ c.camera_total }</td>
         <td><fmt:formatDate value="${ c.camera_date}" pattern="yyyy-MM-dd"/></td>
         <td>${ sessionScope.loginMember.userid }</td>
      </tr>   
   </c:forEach>
</table>
<br>

<!-- ????????? ?????? -->
<!--  ??????????????? ?????? ????????? -->
<div style="text-align:center;">
<c:if test="${ currentPage eq 1 }"> 
   [?????????] &nbsp;
</c:if>
<c:if test="${ currentPage > 1 }">
   <c:url var = "clf" value= "/clist.do">
      <c:param name="page" value="1" />
   </c:url>
   <a href="${ clf }">[?????????]</a>
</c:if>
<!--  ???????????? ?????? ??? -->

<!--  ?????? ????????? ???????????? ?????? ?????? -->
<c:if test="${ (currentPage - 10) < startPage and (currentPage - 10) > 1 }">
   <c:url var = "clf2" value= "/clist.do">
      <c:param name="page" value="${ startPage-10 }" />
   </c:url>
   <a href="${ clf2 }">[????????????]</a>
</c:if>
<c:if test="${ !((currentPage - 10) < startPage and (currentPage - 10) > 1)}">
   [????????????] &nbsp;
</c:if>
<!--  ?????? ????????? ???????????? ?????? ?????? ??? -->

<!-- ?????? ???????????? ?????? ????????? ?????? ?????? -->
<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
   <c:if test="${ p eq currentPage }">
      <font size="4" color="red"><b>[${ p }]</b></font>
   </c:if>
   <c:if test="${ p ne currentPage }">
      <c:url var = "clf5" value= "/clist.do">
      <c:param name="page" value="${ p }" />
   </c:url>
   <a href="${ clf5 }">${ p }</a>
   </c:if>
</c:forEach>


<!-- ?????? ???????????? ?????? ????????? ?????? ??????  ???-->



<!--  ?????? ????????? ???????????? ?????? ?????? -->
<c:if test="${ (currentPage + 10) > endPage and (currentPage + 10) <maxPage }">
   <c:url var = "clf3" value= "/clist.do">
      <c:param name="page" value="${ endPage + 10 }" />
   </c:url>
   <a href="${ clf3 }">[????????????]</a>
</c:if>
<c:if test="${ !((currentPage + 10) > endPage and (currentPage + 10) <maxPage)}">
   [????????????] &nbsp;
</c:if>
<!--  ?????? ????????? ???????????? ?????? ?????? ??? -->

<!-- ??????????????? ?????? -->
<c:if test="${ currentPage eq maxPage }"> 
   [??????] &nbsp;
</c:if>
<c:if test="${ currentPage < maxPage }">
   <c:url var = "clf5" value= "/clist.do">
      <c:param name="page" value="${ maxPage }" />
   </c:url>
   <a href="${ clf5 }">[??????]</a>
</c:if>
<!-- ??????????????? ?????? ??? -->

</div>
<hr>

</div>

            
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
                        <span aria-hidden="true">??</span>
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