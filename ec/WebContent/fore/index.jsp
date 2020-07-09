<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="author" content="order by dede58.com"/>
		<title>华为商城</title>
		
	</head>
	<body>
	<jsp:include page="fore_header.jsp"></jsp:include>



	<!-- start banner_y -->
		<div class="banner_y center"><!-- 轮播图div -->
		<nav id="show_box">
		</nav>
		</div>	

		<!-- <div class="sub_banner center" style="background-color: #BB0119;">
			
		</div> -->
		<div class="sub_banner center">
		<div class="channel_title center"></div>
		<div class="channel_title_text center">新品上市</div>
		
			<ul class="new center">
			<c:forEach items="${isnews }" var="n" begin="0" end="9">
			   <li><a href="${pageContext.request.contextPath }/index/showone.action?id=${n.id }"><img alt="" src="/i/${n.pic}"/></a></li>
			</c:forEach> 
			</ul>
	
   <div style="clear:both;"></div>
		<div class="channel_title center" ></div> 
		<div class="channel_title_text center">精品推荐</div>
			<ul class="jp center">
			<c:forEach items="${isgoods }" var="n" begin="0" end="5">
			   <li><img alt="" src="/i/${n.pic}"/></li>
			</c:forEach> 
			</ul>
			
			<div style="clear:both;"></div>
			<div class="guanggao center"><a>
			  <img alt="" src="${pageContext.request.contextPath }/image/广告.png">
			</a></div>
			<div style="clear:both;"></div>
		<div class="channel_title center" ></div> 
		<div class="channel_title_text center">手机专区</div>
			<ul class="phone center">
			   <li><img alt="" src="${pageContext.request.contextPath }/image/phone01.jpg"/></li>
			   <li><img alt="" src="${pageContext.request.contextPath }/image/phone02.jpg"/></li>
			   <li><img alt="" src="${pageContext.request.contextPath }/image/phone03.jpg"/></li>
			   <li><img alt="" src="${pageContext.request.contextPath }/image/phone04.jpg"/></li>
			   <li><img alt="" src="${pageContext.request.contextPath }/image/phone05.jpg"/></li>
			   <li><img alt="" src="${pageContext.request.contextPath }/image/phone06.jpg"/></li>
			</ul>
			<ul class="phone_lunbo center">
			   <li> <i></i><img alt="" src="${pageContext.request.contextPath }/image/phone_lb01.jpg"/></li>
			   <li><img alt="" src="${pageContext.request.contextPath }/image/phone_lb02.jpg"/></li>
			   <li><img alt="" src="${pageContext.request.contextPath }/image/phone_lb03.jpg"/></li>
			   <li><img alt="" src="${pageContext.request.contextPath }/image/phone_lb04.jpg"/></li>
			   <li> <i style="right:0px;"></i><img alt="" src="${pageContext.request.contextPath }/phone_lb05.jpg"/></li>
			</ul>
			<div style="clear:both;"></div>
			 
		</div>
		<div style="clear:both;"></div>
		 <footer>
		 <div class="f center"><img src="${pageContext.request.contextPath }/image/footer.jpg"/></div>
		</footer> 
	</body>
	
</html>