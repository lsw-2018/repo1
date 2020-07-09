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
	<div class="content-wrap" style="margin-top:-40px;">
		<div class="main-content">
			<div class="row">
				<div class="col-lg-12">
					<div class="card alert" style="margin-top: -50px;">
						<div class="card-header">
							<h4>新增图片</h4>
							<div class="booking-system-item">
								<form
									action="${pageContext.request.contextPath }/image/update.action"
									method="post" enctype="multipart/form-data">
									<%-- <input type="hidden" value="${updateuser.id }" name="id"/> --%>
									<div class="row">
										<div class="col-lg-4" >
										<div class="form-group">
												<input class="form-control input-lg " placeholder="类型"
													id="type" name="type" value="${updateimage.type }"/>
											    </div><br><br>
											    <input type="hidden" value="${updateimage.loc }" name="updatefile"/>
											    <input type="hidden" value="${updateimage.id }" name="id"/>
										<input type="file" name="upimg"/>
											
											</div>
										</div>
										
										
										
								
									<div class="row">
										<div class="col-lg-12">
											<div class="form-group">
												<button type="submit"  style="margin-top:20px;width:100px;"
													class="btn btn-primary btn-rounded  m-l-5">提交</button>
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
			</div>
		</div>
	</div>
</body>


</html>