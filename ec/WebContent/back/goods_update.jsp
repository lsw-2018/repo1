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
							<h4>新增商品</h4>
							<div class="booking-system-item">
								<form id="ff"
									action="${pageContext.request.contextPath }/goods/update.action"
									method="post" enctype="multipart/form-data">
								 <input type="hidden" value="${updategoods.id }" name="id"/>
									<div class="row">
										<div class="col-lg-4" >
											<div class="form-group">
												<input class="form-control input-lg " placeholder="商品名称"
													id="name" name="name"  value="${updategoods.name}" />
													</div>
													<div class="form-group">
												描述：
												<textarea name="miaoshu" class="form-control" rows="3"> ${updategoods.miaoshu }</textarea>
											</div>
													<div class="checkbox">
												颜色：<label class="checkbox-inline"> 
												<input type="checkbox" name="color" value="白"  ${updategoods.color.contains('白')?'checked':'' }> 白
												   </label> 
												   <label class="checkbox-inline"> 
												   <input type="checkbox" name="color" value="蓝" ${updategoods.color.contains('蓝')?'checked':'' }> 蓝
												  </label> 
												  <label class="checkbox-inline"> 
												  <input type="checkbox" name="color" value="黑" ${updategoods.color.contains('黑')?'checked':'' }> 黑
												  </label> 
												  <label class="checkbox-inline"> 
												  <input type="checkbox" name="color" value="粉" ${updategoods.color.contains('粉')?'checked':'' }> 粉
												</label>
												<br /> <br />
											</div>
												

											
                                                <label for="num" class="sr-only"></label> 
												<input class="form-control input-lg " placeholder="库存" id="num" name="num" value="${updategoods.num}"/> 
												<br/>
												<%-- <img src="${pageContext.request.contextPath }/img/imgbg.png" alt="..." class="img-thumbnail"> --%>
												
												
										</div>
										
										<div class="col-lg-1" ></div>
										<div class="col-lg-4">
											<div class="form-group">
													<div class="input-group">
													<div class="input-group-addon">$</div>
													<input type="number" class="form-control" id="exampleInputAmount" value="${updategoods.oldprice}" placeholder="原价" name="oldprice">
													<div class="input-group-addon">.00</div>
													</div><br>
													<div class="input-group">
													<div class="input-group-addon">$</div>
													<input type="number" class="form-control"
														id="exampleInputAmount" placeholder="现价" name="newprice" value="${updategoods.newprice}">
													<div class="input-group-addon">.00</div>
												    </div>
												    </div>
												    <div class="form-group">
												<input type="text"  name="type" class="form-control" placeholder="商品类型" value="${updategoods.type}"/>
											</div>
											 <label class="checkbox-inline"> 
												 <input type="checkbox" name="ishot" value="是"    ${updategoods.ishot eq '是'?'checked':''}>热销商品
												</label> 
												<label class="checkbox-inline"> 
												 <input type="checkbox" name="isgood" value="是" ${updategoods.isgood eq '是'?'checked':''}>精选商品
												</label> 
												<label class="checkbox-inline"> 
												<input type="checkbox" name="istuijian" value="是" ${updategoods.istuijian eq '是'?'checked':''}>推荐商品
												</label> <br/><br/>
												  <input type="hidden" name="updatefile" value="${updategoods.pic }"/>  
												<input type="file" name="upimg"/>
												</div>
												<div class="col-lg-10">
											参数与配图：
												<textarea class="form-control" rows="3" name="parm">${updategoods.parm }</textarea>
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
				var editor1 = K.create('textarea[name="parm"]', {
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