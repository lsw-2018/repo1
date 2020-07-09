<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>后台管理系统主页</title>
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>
    <div class="content-wrap">
                <div class="main-content">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card alert" style="margin-top:-50px;">
                                <div class="card-header">
                                    <h4>管理员修改密码</h4>
                                    <div class="booking-system-item" >
                                        <form action="${pageContext.request.contextPath }/admin/update.action" method="post">
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    <div class="form-group">
                                                        <input type="text" name="username" class="form-control" value="${manager.username }" readonly="readonly">
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <div class="form-group">
                                                        <input type="password" name="password" class="form-control" placeholder="密码" value="${manager.password }">
                                                    </div>
                                                </div>
                                            </div>
                                      


                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="form-group">
                                                        <button type="submit" class="btn btn-primary btn-rounded  m-l-5">提交</button>
                                                    </div>
                                                </div>
                                            </div>

                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- /# card -->
                        </div>
                        <!-- /# column -->
                        </div></div></div>
</body>

</html>