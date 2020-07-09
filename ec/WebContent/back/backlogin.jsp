<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>后台管理系统登录页</title>
	
   <!--  <link rel="shortcut icon" href="http://placehold.it/64.png/000/fff">
    <link rel="apple-touch-icon" sizes="144x144" href="http://placehold.it/144.png/000/fff">
    <link rel="apple-touch-icon" sizes="114x114" href="http://placehold.it/114.png/000/fff">
    <link rel="apple-touch-icon" sizes="72x72" href="http://placehold.it/72.png/000/fff">
    <link rel="apple-touch-icon" sizes="57x57" href="http://placehold.it/57.png/000/fff"> -->
	
    <link href="${pageContext.request.contextPath }/assets/fontAwesome/css/fontawesome-all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/assets/css/lib/themify-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/assets/css/lib/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/assets/css/lib/nixon.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/assets/css/style.css" rel="stylesheet">
</head>

<body class="bg-primary">

	<div class="Nixon-login">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-lg-offset-3">
					<div class="login-content">
						<div class="login-form">
							<h4>管理员登录</h4>
							<form action="${pageContext.request.contextPath }/admin/login.action" method="post">
								<div class="form-group">
									<label>用户名</label>
									<input type="text" class="form-control" placeholder="用户名" name="username">
								</div>
								<div class="form-group">
									<label>密码</label>
									<input type="password" class="form-control" placeholder="密码" name="password">
								</div>
								
								<button type="submit" class="btn btn-primary btn-flat m-b-30 m-t-30">登录</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>