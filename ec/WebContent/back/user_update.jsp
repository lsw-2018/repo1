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
                                    <h4>编辑用户信息</h4>
                                    <div class="booking-system-item" >
                                        <form action="${pageContext.request.contextPath }/user/update.action" method="post">
                                        <input type="hidden" value="${updateuser.id }" name="id"/>
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    <div class="form-group">
                                                        <input type="text" name="username" class="form-control" value="${updateuser.username }" readonly="readonly">
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="password" name="password" class="form-control" placeholder="密码" value="${updateuser.password }">
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="text" name="realname" class="form-control" placeholder="真实姓名" value="${updateuser.realname }">
                                                    </div>
                                                    
                                                   <div class="radio">
  <label><input type="radio" name="sex"  value="男"  ${updateuser.sex eq '男' ?'checked':''}>男 </label>&nbsp;&nbsp;&nbsp;&nbsp;
  <label><input type="radio" name="sex"  value="女"  ${updateuser.sex eq '女' ?'checked':''}>女 </label>
</div>
<select class="form-control" name="type">
  <option ${updateuser.type eq '倔强青铜' ?'selected':''} value="倔强青铜">倔强青铜</option>
  <option ${updateuser.type eq '秩序白银' ?'selected':''} value="秩序白银">秩序白银</option>
  <option ${updateuser.type eq '荣耀黄金' ?'selected':''} value="荣耀黄金">荣耀黄金</option>
  <option ${updateuser.type eq '尊贵铂金' ?'selected':''} value="尊贵铂金"> 尊贵铂金</option>
  <option ${updateuser.type eq '永恒钻石' ?'selected':''} value="永恒钻石">永恒钻石</option>
  <option ${updateuser.type eq '至尊星耀' ?'selected':''} value="至尊星耀">至尊星耀</option>
  <option ${updateuser.type eq '最强王者' ?'selected':''} value="最强王者">最强王者</option>
</select><br/>
 <div class="form-group">
                                                        <input type="tel" value="${updateuser.tel }" name="tel" class="form-control" placeholder="电话号码" value="${user.tel }">
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