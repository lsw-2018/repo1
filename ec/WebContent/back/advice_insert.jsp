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
							<h4>新增公告</h4>
							<div class="booking-system-item">
								<form id="ff"
									action="${pageContext.request.contextPath }/advice/insert.action"
									method="post" enctype="multipart/form-data">
									<%-- <input type="hidden" value="${updateuser.id }" name="id"/> --%>
									<div class="row">
										<div class="col-lg-4" >
											<div class="form-group">
												<input class="form-control input-lg " placeholder="标题"
													id="name" name="title" style="margin-left:30px;"/>
													</div>
													<div class="form-group">
												
												
												<div class="col-lg-10">
											内容：
												<textarea class="form-control" rows="3" name="content"></textarea>
												</div>
										</div>
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
<script charset="utf-8" src="${pageContext.request.contextPath }/kindeditor/kindeditor-all-min.js"></script>
		<script charset="utf-8" src="${pageContext.request.contextPath }/kindeditor/lang/zh-CN.js"></script>
		<script charset="utf-8" src="${pageContext.request.contextPath }/kindeditor/plugins/code/prettify.js"></script>
		<script>
			KindEditor.ready(function(K) {
				var editor1 = K.create('textarea[name="param"]', {
					cssPath : '${pageContext.request.contextPath }/kindeditor/plugins/code/prettify.css',
					uploadJson : '${pageContext.request.contextPath }/kindeditor/jsp/upload_json.jsp',
					fileManagerJson : '${pageContext.request.contextPath }/kindeditor/jsp/file_manager_json.jsp',
					allowFileManager : true,
					afterCreate : function() {
						var self = this;
						K.ctrl(document, 13, function() {
							self.sync();
							document.forms['ff'].submit();
						});
						K.ctrl(self.edit.doc, 13, function() {
							self.sync();
							document.forms['ff'].submit();
						});
					}
				});
				prettyPrint();
			});
		</script> 

</html>