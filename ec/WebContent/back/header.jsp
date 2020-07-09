<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>后台管理系统主页</title>
    <link rel="shortcut icon" href="http://placehold.it/64.png/000/fff">
    <link rel="apple-touch-icon" sizes="144x144" href="http://placehold.it/144.png/000/fff">
    <link rel="apple-touch-icon" sizes="114x114" href="http://placehold.it/114.png/000/fff">
    <link rel="apple-touch-icon" sizes="72x72" href="http://placehold.it/72.png/000/fff">
    <link rel="apple-touch-icon" sizes="57x57" href="http://placehold.it/57.png/000/fff">
    <link href="${pageContext.request.contextPath }/assets/fontAwesome/css/fontawesome-all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/assets/css/lib/themify-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/assets/css/lib/mmc-chat.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath }/assets/css/lib/sidebar.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/assets/css/lib/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/assets/css/lib/nixon.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/assets/lib/lobipanel/css/lobipanel.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/assets/css/style.css" rel="stylesheet">
</head>

<body>
    <div class="sidebar sidebar-hide-to-small sidebar-shrink sidebar-gestures">
        <div class="nano">
            <div class="nano-content">
                <ul>
                    <li><a href="${pageContext.request.contextPath }/user/findAll.action"><i class="ti-user"></i> 用户管理</a></li>
                    <li><a href="${pageContext.request.contextPath }/goods/findAll.action"><i class="ti-layout-grid2-alt"></i> 商品管理</a></li>
                    <li><a href="${pageContext.request.contextPath }/image/findAll.action"><i class="ti-heart"></i> 图片管理</a></li>
                    <li><a href="${pageContext.request.contextPath }/orders/findAll.action"><i class="ti-view-list-alt"></i> 订单管理 </a></li>
                    <li><a href="${pageContext.request.contextPath }/advice/findAll.action"><i class="ti-file"></i> 公告管理</a></li>
                   <%--  <li><a href="${pageContext.request.contextPath }/admin/findAll.action"><i class="ti-github"></i> 管理员管理</a></li>
                    <li><a href="${pageContext.request.contextPath }/role/findAll.action"><i class="ti-reddit"></i> 角色管理</a></li>
                    <li><a href="${pageContext.request.contextPath }/permission/findAll.action"><i class="ti-stamp"></i> 权限管理</a></li> --%>
                </ul>
            </div>
        </div>
    </div>
    <!-- /# sidebar -->
    <div class="header">
        <div class="pull-left">
            <div class="logo">
                <a href="index.html">
                    <img id="logoImg" src="${pageContext.request.contextPath }/logo/logo.png" data-logo_big="${pageContext.request.contextPath }/logo/logo.png" data-logo_small="${pageContext.request.contextPath }/logo/logoSmall.png" alt="Nixon" />
                </a>
            </div>
            <div class="hamburger sidebar-toggle">
                <span class="ti-menu"></span>
            </div>
        </div>
        <div class="pull-right p-r-15">
            <ul>
               
                <li class="header-icon dib">
                    <img class="avatar-img" src="${pageContext.request.contextPath }/assets/images/avatar/1.jpg" alt="" /> <span class="user-avatar">${manager.username}<i class="ti-angle-down f-s-10"></i></span>
                    <div class="drop-down dropdown-profile">
                   
                        <div class="dropdown-content-body">
                            <ul>
                                <li><a href="${pageContext.request.contextPath }/back/admin_update.jsp"><i class="ti-user"></i> <span>修改个人信息</span></a></li>
                                <li><a href="${pageContext.request.contextPath }/admin/signout.action"><i class="ti-power-off"></i> <span>退出系统</span></a></li>
                            </ul>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div class="chat-sidebar">
       
    </div>
    <!-- END chat Sidebar-->
    <div class="content-wrap">
        <div class="main">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 p-0">
                        <div class="page-header">
                            <div class="page-title">
                                <h1></h1>
                            </div>
                        </div>
                    </div>
                  
                </div>
                <!-- /# row -->
                <div class="main-content">
                    
                      
                       
                    </div>
                  
                       
 </div>
</div>
</div>
<script src="${pageContext.request.contextPath }/assets/js/lib/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/lib/jquery.nanoscroller.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/lib/sidebar.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/lib/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/lib/mmc-common.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/lib/mmc-chat.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/lib/chart-js/Chart.bundle.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/lib/chart-js/chartjs-init.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/lib/datamap/d3.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/lib/datamap/topojson.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/lib/datamap/datamaps.world.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/lib/datamap/datamap-init.js"></script>
<script src="${pageContext.request.contextPath }/assets/lib/lobipanel/js/lobipanel.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/scripts.js"></script>

<script>
    $(document).ready(function() {
        $('#lobipanel-custom-control').lobiPanel({
            reload: false,
            close: false,
            editTitle: false
        });
    });
</script>
</body>

</html>