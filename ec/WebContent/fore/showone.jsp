<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<div class="on-box">
    <div class="in-box">
       <img alt="" src="${pageContext.request.contextPath }/image/close.png" id="chart_close">
       <img alt="" src="${pageContext.request.contextPath }/image/duihao.png" id="duihao">
       <div class="in-box-txt">${one.name}成功加入购物车!</div>
       <div class="in-box-btns">
           <button  id="doagin" style="background-color: white;border:1px solid #D4D4D4;">再逛逛</button>&nbsp;&nbsp;&nbsp;&nbsp;
           <button  id="gopay" style="background-color: #CD2626;color:white;">去结算</button>
       </div>
    </div>
</div>
<jsp:include page="fore_header.jsp"></jsp:include>
<input type="hidden" id="goodsid" value="${one.id }"/>
<div style="clear:both;"></div>
<div class="banner_z center" >
	 <nav class="banner_z_left">
	    <div class="pic"><img alt="" src="/i/${one.pic }"></div>
	    <ul>
	       <li><</li>
	       <li><img alt="" src="${pageContext.request.contextPath }/image/Q0.jpg">    </li>
	       <li><img alt="" src="${pageContext.request.contextPath }/image/Q1.jpg">    </li>
	       <li><img alt="" src="${pageContext.request.contextPath }/image/Q2.jpg">    </li>
	       <li><img alt="" src="${pageContext.request.contextPath }/image/Q3.jpg">    </li>
	       <li><img alt="" src="${pageContext.request.contextPath }/image/Q4.jpg">    </li>
	       <li>></li>
	    </ul>
	 </nav>
	 <nav class="banner_z_right">
	     <div class="title">${one.name}</div>
	     <ul>
	       <li><div class="name">价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格</div><div class="desc">¥&nbsp;${one.newprice}</div></li>
	       <li><div class="name">促&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;销</div><div class="desc"><i>赠送积分</i>购买即赠商城积分，积分可抵现~</div></li>
	       <li><div class="name">服务说明</div><div class="desc">✓&nbsp;&nbsp;由华为商城负责发货，并提供售后服务</div></li>
	       <li><div class="name">商品编码</div><div class="desc">2601010138313</div></li>
	       <li><div class="name">选择颜色</div><div class="desc">
	              
	          <c:forEach items="${colors }" var="c">
	              <div class="desc_colors"><img alt="" src="${pageContext.request.contextPath }/image/Q1.jpg">${c}</div>
	          </c:forEach>
	               
	       </div></li>
	       <li><div class="name">选择数量</div><div class="desc">
	       <div class="num">
	             <input type="text" id="num" value="1">
	             <div id="num-jia">+</div>
	             <div id="num-jian" style="top:26px;color:#BEBEBE;">-</div>
	       </div>
	       
	       </div></li>
	       <li>
	       <div class="name"></div>
	       <div class="desc">
	       <div class="btnchart">加入购物车</div>
	       <div class="btnbuy">立即购买</div>
	       </div>
	       </li>
	     </ul>
	     
	   
	 </nav>
</div>
<div style="clear:both;"></div>
<div class="infomation center" style="text-align: center;">${one.parm}
</div>
<div style="clear:both;"></div>
		 <footer>
		 <div class="f center"><img src="${pageContext.request.contextPath }/image/footer.jpg"/></div>
		</footer> 
		
		
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script type="text/javascript">
   $(function(){
	   /* 选择颜色 */
	   $(".desc>.desc_colors").click(function(){
		   $(".desc>.desc_colors").css("border","1px solid #EBEBEB");
		   $(this).css("border","1px solid #ba0019");
	   });
	   /*单机加减按钮 */
	   $("#num-jia").click(function(){
		   var num=parseInt($("#num").val());
		   $("#num").val(num+1);
		   if(num+1>1){
			   $("#num-jian").css("color","#778899");
		   }else{
			   $("#num-jian").css("color","#BEBEBE"); 
		   }
	   });
	   $("#num-jian").click(function(){
		   var num=parseInt($("#num").val());
		  if(num>1){
			  $("#num").val(num-1);
			  if(num-1>1)
			  $("#num-jian").css("color","#778899");
			  else
				$("#num-jian").css("color","#BEBEBE"); 
		  } else
			  $("#num").val(1);
	   });
	   /* 点击加入购物车 */
	   $(".btnchart").click(function(){
		
	   var colors=$(".desc_colors");
		  var color="";
		   for(var i=0;i<colors.length;i++){
			if(colors.eq(i).css("border")=='1px solid rgb(186, 0, 25)'){
				color=colors.eq(i).html();
			}
		   }
		   color=color.substring(color.length-1); 
		   $.ajax({
			   url:'${pageContext.request.contextPath }/index/addchart.action',
			   type:'post',
			   data:{"goodsid":$("#goodsid").val(),"color":color,"num":$("#num").val()},
			   success:function(d){ 
				  if(d.endsWith(".jsp"))
					  location="${pageContext.request.contextPath }/"+d;
				  else{
				     $("#charts_num").html("购物车("+d+")");
				     $(".on-box").css("display","block");
				  }
 		   }
		   }); 
	   }); 
	   $("#chart_close").click(function(){
		   $(".on-box").css("display","none");
	   });
	   /*由于css失效，所以在js写鼠标移入改变颜色  */
	   $("#doagin").mouseover(function(){
		   $(this).css("border","1px solid #969696");
	   }).mouseout(function(){
		   $(this).css("border","1px solid #D4D4D4");
	   }).click(function(){/* 点击再逛逛 */
		   $(".on-box").css("display","none");  
	   });
	   
	   $("#gopay").mouseover(function(){
		   $(this).css("background-color","#ba0019");
	   }).mouseout(function(){
		   $(this).css("background-color","#CD2626");
	   }).click(function(){/*点击结算  */
		  // location="${pageContext.request.contextPath }/fore/charts.jsp";
		   location="${pageContext.request.contextPath }/index/findcharts.action";
	   });
	   
   });
</script>
</body>
</html>