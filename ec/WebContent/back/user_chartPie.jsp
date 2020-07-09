<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>后台管理系统主页</title>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/echarts.min.js"></script>
    <script type="text/javascript">
    $(function(){
		var levels=[]; //等级数组（实际用来盛放X轴坐标值）
		var nums =[]; //数量数组（实际用来盛放Y坐标值）
		
		
		var zhuchart = echarts.init(document.getElementById('zhu'));
		 zhuchart.setOption({
			 title:{
					text:'编程排行榜',
					subtext:'2019-03',
					left:100
				},
				toolbox:{
					show:true
				},
				legend:{
					orient:'vertical',
					left:'left',
					data:['Java','C','Python','C++','C#']
				},
				series:{
					name:'访问来',
					type:'pie',
					data:[
					{value:500,name:'Java'},
					{value:100,name:'C'},
					{value:400,name:'Python'},
					{value:200,name:'C++'},
					{value:260,name:'C#'}
					]
				}
  			
  		});
		
		
    		  });
 	  
    </script>
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>
    <div class="content-wrap">
 
     <div class="col-lg-12" >
                          
             <div class="row">
						<div class="col-lg-12" style="margin-top:-70px;">
							<div class="card alert" style="height:560px;">
								<div class="card-header">
									<h4>柱状图</h4>
								</div>
								<div class="flot-container" > 
									<div id="zhu" class="flot-pie-container" style="height:450px;"></div>
								</div>
							</div><!-- /# card -->
						</div><!-- /# column -->
		
 </div></div>
</body>


</html>