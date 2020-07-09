<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>确认订单华为商城</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/style.css">
</head>
<body style="background-color: #F5F5F5">
	<jsp:include page="fore_header.jsp"></jsp:include>
	<div style="clear: both;"></div>
	<div class="bodybox center">
	<c:if test="${loginuser==null }">
		<div class="loginwarn center">
			<img alt=""
				src="${pageContext.request.contextPath }/image/tanhao.png"> <span>您还没有登录！登录后可查看之前加入的商品</span>
			<button class="nologinbtn">登录</button>
		</div>
		</c:if>
		
		<c:choose>
		  <c:when test="${empty charts}">
		    <div class="emptycharts center">
		     <div class="txt"></div>
		     <div class="img"><img alt="" src="${pageContext.request.contextPath }/image/chart1.png"/></div>
		     <div class="txt">您的购物车里什么也没有哦~</div>
		     <div class="btn"><a href="${pageContext.request.contextPath }/fore/index.html">去逛逛</a></div>
		    </div>
		  </c:when>
		  <c:otherwise>
		      <ul class="chartslist center">
			<li >
				<ul>
					<li><input type="checkbox" name="c" checked id="allc"/>&nbsp;&nbsp;&nbsp;全选</li>
					<li>商品</li>
					<li>单价</li>
					<li>数量</li>
					<li>小计</li>
					<li>操作</li>
				</ul>
			</li>
			<c:forEach items="${charts }" var="c">
			<li>
				<ul>
					<li><input type="checkbox" name="c" checked class="chs" />
					   <input type="hidden" name="id" value="${c.id }"/>
					 <img
						alt="" src="/i/${c.goods.pic }"></li>
					<li><span>${c.goods.name}</span></li>
					<li><span class="newprice">${c.goods.newprice}</span></li>
					<li>
					<div class="numbox">
					  <div class="numjian" >-</div>
						<input type="text"   value="${c.num}" class="numtxt"/>
					   <div class="numjia"  style="float:right;">+</div>
					</div>
					</li>
					<li><span class="xiaoji"></span></li>
					<li><a href="${pageContext.request.contextPath }/index/deletechart.action?id=${c.id}" class="chartsdelete">删除</a></li>
				</ul>
			</li>
			
			</c:forEach>
			<li>
				<ul style="height:80px;">
					<li><input type="checkbox" name="c" checked id="allc1"/>&nbsp;&nbsp;&nbsp;全选&nbsp;&nbsp;&nbsp;
					   <a id="batch_delete">删除</a>
					</li>
					
					<li></li>
					<li></li>
					<li id="account">立即结算</li>
					<li><div class="top">总计： <span id="sumprice">¥  4299.00</span></div><div class="bot">已选择<span id="sumnum">1</span> 件商品，已优惠9.0元</div></li>
				</ul>
			</li>
		</ul>
		
		  </c:otherwise>
		</c:choose>
	</div>
	 <footer>
		 <div class="f center"><img src="${pageContext.request.contextPath }/image/footer.jpg"/></div>
		</footer>
</body>
<script type="text/javascript">
$(function(){
	/* 初始时 数量框 及加减得颜色 */
	var nums = $(".numtxt");
   $.each(nums,function(k,v){
	  var n=nums.eq(k).val();
	  if(n<=1){
		  nums.eq(k).prev().css("color","#C7C7C7");
	  }else{
		  nums.eq(k).prev().css("color","gray");
	  }
	  
   });
	/* 单击- */
   $(".numjian").click(function(){
	   var t = parseInt($(this).next().val());
	   if(t<=1){
		   $(this).next().val(1);
	       $(".numjian").css("color","#C7C7C7"); 
	   }else{
		   if(t-1==1){
			   $(".numjian").css("color","#C7C7C7");
		   }else{
		   $(".numjian").css("color","gray"); 
		   }
		    $(this).next().val(t-1);
	   }
	   setXioaji();
	   getSumnum();
	   getSumprice();
   });
	/* 单击+ */
   $(".numjia").click(function(){
	   var t = parseInt($(this).prev().val());
	    if(t+1>1)
		   $(".numjian").css("color","gray"); 
	    $(this).prev().val(t+1);
	    setXioaji();
	    getSumnum();
	    getSumprice();
   });
	/* 计算小计中的总价 */
	function setXioaji(){
		var xs = $(".xiaoji");
		$.each(xs,function(k,v){
			//取数量框
			var num=parseInt(xs.eq(k).parent().prev().children().children(".numtxt").val());
			//取单价
			var price=parseFloat(xs.eq(k).parent().prev().prev().children().html());
			xs.eq(k).html("￥  "+(num*price));
		})
	}
	
	setXioaji();
	/* 购物车若没有商品 点击去逛逛 */
	$("#emptycharts>btn").click(function(){
		location="${pageContext.request.contextPath }/fore/index.html";
	});
	
	/* 上方全选  取消全选 */
	$("#allc").click(function(){
		var chs = $("input[name=c]");
		if($(this).prop("checked")==true){
            $(":checkbox[name='c']").prop("checked", true);
		}else{
			$(":checkbox[name='c']").prop("checked", false);
		}
	});
	/* 下方全选  取消全选 */
	$("#allc1").click(function(){
		var chs = $("input[name=c]");
		if($(this).prop("checked")==true){
            $(":checkbox[name='c']").prop("checked", true);
		}else{
			$(":checkbox[name='c']").prop("checked", false);
		}
	});
	/*  下方多选删除*/
	$("#batch_delete").click(function(){
		var chs = $("input[name='c']:checked");
		var ids="";
		if(chs.length==0){
			alert("您未选择任何项！")
		}else{
			for(var i=1;i<chs.length-1;i++){
				ids+=chs.eq(i).next().val()+","
			}
			$.ajax({
				url:'${pageContext.request.contextPath }/index/batchDel.action',
				type:'post',
				data:{"ids":ids},
				success:function(d){
					alert("删除成功！");
					location="${pageContext.request.contextPath }/index/findcharts.action";
				}
			})
		}
	});
	/* 计算 总数量 */
  function getSumnum(){
		var  num =$(".numtxt");
		var sum=0;
		$.each(num,function(k,v){
			sum+=parseInt(num.eq(k).val());
		});
		$("#sumnum").html(sum);
	}
  getSumnum();
  
  /* 计算 总价格 */
  function getSumprice(){
	  var price=$(".xiaoji");
	  var sumprice=0;
	  $.each(price,function(k,v){
		  var sp = price.eq(k).html();
		  sumprice+=parseFloat(sp.substring(2));   
	  });
	  $("#sumprice").html("￥  "+sumprice);
  }
  getSumprice();
  
  /*点击立即结算  */
   $("#account").click(function(){
	   var ids=$("input[type=hidden]");
	   var nums=$(".numtxt");
	   var charts=[];
	   $.each(ids,function(k,v){
		   var cha=new Object();
		   cha.id=ids.eq(k).val();
		   cha.num=nums.eq(k).val();
		   charts.push(cha);
	   });
	   var jsonv=JSON.stringify(charts);
	  // location="${pageContext.request.contextPath }/index/confirmOrder.action?charts="+jsonv;
	    $.ajax({
		   url:"${pageContext.request.contextPath }/index/confirmOrder.action",
		   type:'post',
		   dataType: "json",
		   data:{"charts":jsonv},
		   success:function(d){
		   }
	   }) ;
	    location="${pageContext.request.contextPath }/fore/confirmOrder.jsp";
   });
  /* 点击登录按钮 */
     $(".nologinbtn").click(function(){
    	 location="${pageContext.request.contextPath }/fore/login.jsp";
     });
})
</script>
</html>