<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/style.css">
</head>
<body style="background-color: #F5F5F5">
	<jsp:include page="fore_header.jsp"></jsp:include>
	<div style="clear: both;"></div>
	<div class="bodybox center">
	    <div class="loginwarn center">
			<img alt=""
				src="${pageContext.request.contextPath }/image/tanhao.png"> <span>订单含付款减库存商品，支付完成才会为您预留库存，库存不足时系统将自动取消未支付的订单。</span>
		</div>
	   <div class="addresses center" >
	     <div class="title">收货地址</div>
	     <ul>
	        <li>
	           <div class="isdefault">默认地址</div>
	           <div class="name">张三</div>
	           <div class="tel">13800009999</div>
	           <div class="addr">吉林省长春市绿园区cxxxxx街道xxx小区x栋2单元sss楼</div>
	        </li>
	         <li>
	          <!--  <div class="isdefault">默认地址</div> -->
	           <div class="name">张三</div>
	           <div class="tel">13800009999</div>
	           <div class="addr">吉林省长春市绿园区cxxxxx街道xxx小区x栋2单元sss楼</div>
	        </li>
	         <li>
	          <!--  <div class="isdefault">默认地址</div> -->
	           <div class="name">张三</div>
	           <div class="tel">13800009999</div>
	           <div class="addr">吉林省长春市绿园区cxxxxx街道xxx小区x栋2单元sss楼</div>
	        </li>
	        <li>+新增收货地址</li>
	     </ul>
	   </div>
	  
	    <div class="orderlist center" >
	    <div class="listbox">
	      <div class="left">
	  <ul>

	     <%--   <li>
	          <img alt="" src="${pageContext.request.contextPath }/image/phone04.jpg">
	          <div class="name">荣耀20 4800万超广角AI四摄 3200W美颜自拍 麒麟980全网通版8GB+128GB 幻影蓝</div>
	          <div class="num">×3</div>
	          <div class="price">￥1999.00</div>
	       </li>
	        <li>
	          <img alt="" src="${pageContext.request.contextPath }/image/phone05.jpg">
	          <div class="name">荣耀20 4800万超广角AI四摄 3200W美颜自拍 麒麟980全网通版8GB+128GB 幻影蓝</div>
	          <div class="num">×3</div>
	          <div class="price">￥1999.00</div>
	       </li> <li>
	          <img alt="" src="${pageContext.request.contextPath }/image/phone06.jpg">
	          <div class="name">荣耀20 4800万超广角AI四摄 3200W美颜自拍 麒麟980全网通版8GB+128GB 幻影蓝</div>
	          <div class="num">×3</div>
	          <div class="price">￥1999.00</div>
	       </li> --%>
	    </ul>
	    
	 <!--   <div class="mess">
	       <ul>
	         <li>
	            <div class="title">发票信息</div>
	             <div></div>
	         </li>
	         <li>
	           <div class="title">优惠与抵用</div>
	         </li>
	       </ul>
	     </div> -->
	     
	    </div>
	    <div class="right"></div>
	       
	      </div>
	     
	    </div>
	</div>
	<script type="text/javascript">
	
	</script>
</body>
</html>