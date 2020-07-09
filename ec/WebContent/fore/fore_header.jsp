<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style.css">
<link href="${pageContext.request.contextPath }/assets/css/lib/themify-icons.css" rel="stylesheet">
</head>
<body>
<!-- start header -->
		<header>
			<div class="top center" >
				<div class="left fl">
					<ul>
						<li><a href="http://www.mi.com/" target="_blank">首页</a></li>
						<li>|</li>
						<li><a href="">华为官网</a></li>
						<li>|</li>
						<li><a href="">荣耀官网</a></li>
						<li>|</li>
						<li><a href="">花粉俱乐部</a></li>
						<li>|</li>
						<li><a href="">V码(优购网)</a></li>
						<li>|</li>
						<li><a href="">企业购</a></li>
						<li>|</li>
						<li><a href="">Select Region</a></li>
					</ul>
				</div>
				<div class="right fr">
					<div class="gouwuche fr"><a href="${pageContext.request.contextPath }/index/findcharts.action" id="charts_num">购物车(0)</a></div>
					<div class="fr">
						<ul>
						   <c:if test="${loginuser==null}">
							<li><a href="${pageContext.request.contextPath }/fore/login.jsp" target="_blank">登录</a></li>
							<li>|</li>
							<li><a href="${pageContext.request.contextPath }/fore/reg.jsp" target="_blank" >注册</a></li>
							
							</c:if>
							<c:if test="${loginuser!=null }">
							<li><a href="#" target="_blank" >${loginuser.username}</a></li>
							</c:if>
							<li>|</li>
							<li><a href="./register.html" target="_blank" >我的订单</a></li>
							<li>|</li>
							<li><a href="">消息通知</a></li>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
		</header>
	<!--end header -->
	<!-- start banner_x -->
		<div class="banner_x center">
			<a href="./index.html" target="_blank"><div class="logo fl"></div></a>
			<a href=""><div class="ad_top fl"></div></a>
			<div class="nav fl">
				<ul id="n">
					<li><a href="./liebiao.html" target="_blank">手机</a></li>
					<li><a href="">笔记本电脑</a></li>
					<li><a href="">平板&穿戴</a></li>
					<li><a href="">智能家居</a></li>
					<li><a href="">配件</a></li>
					<li><a href="">HUAWEI P30系列</a></li>
				</ul>
			</div>
			<div class="search fr">
				<form action="" method="post" style="position: relative;">
						<input type="text" id="shuru" name="shuru">
						<div id="sousuo"><i class="ti-search"></i></div>
						
					<div class="clear"></div>
				</form>
				<div class="clear"></div>
			</div>
		</div>
<!-- end banner_x -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
	<script type="text/javascript">
	   $(function(){
		   var imgs=[];
		   var i=0;
		   $.ajax({
			   url:"${pageContext.request.contextPath }/index/findLunbo.action",
					   type:"post",
					   dataType:'json',
					   success:function(d){
					  $.each(d,function(k,v){
						imgs.push(v.loc);
					  });
					 
					   }
		   });
		   
		   setInterval( function (){
			   $(".banner_y").css({'background-image':'url(/il/'+imgs[i]+')'});
			   i++;  
			   if(i>imgs.length-1){
				   i=0;
			   }
		   },1000);
		   $("#n>li").hover(function(){
			  $("#show_box").toggle();
		   });
		   $("#show_box").hover(function(){
			   $("#show_box").toggle();
		   });
		   
		   $.ajax({
			   url:'${pageContext.request.contextPath }/index/showchartnum.action',
			   type:'post',
			   success:function(d){ 
				   $("#charts_num").html("购物车("+d+")");
 		   }
		   }); 
	   })
	</script>
</body>

</html>