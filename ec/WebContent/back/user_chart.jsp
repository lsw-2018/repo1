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
    			 color: ['#3398DB'],
      		   title: {
      		        text: '用户等级数量图',
      		        subtext: 'User Level'
      		    },
      			tooltip : {
      				trigger: 'axis',
      		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
      		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
      		        }
      			},
      			toolbox:{
      			  show:true,
      			  feature:{
      			  dataView:{show:true},
      			  restore:{show:true},
      			  dataZoom:{show:true},
      			  saveAsImage:{show:true},
      			  magicType:{type:['line','bar']}
      			}},

      			legend : {
      				data : [ '等级' ]
      			},
      			xAxis : {
      				z:10,
      				data : []
      			},
      			yAxis : {},
      			series : [ {
      				type : 'bar',
      				barWidth: '30%',
      				data : []
      			} ]
      		});
    		
    	   $.ajax({/* 查询用户等级 */
    		  url:'${pageContext.request.contextPath }/user/getLevels.action',
     		  type:'post',
     		  dataType:'json',
     		  success:function(d){
     			 for (var i = 0; i < d.length; i++) {
						levels.push(d[i]); 
				}
    			zhuchart.setOption({ 
    				xAxis : {
    					data : levels
    				}
    			});
     		  }
    	   });
    	   $.ajax({/* 查询用户等级的数量 */
     		  url:'${pageContext.request.contextPath }/user/getNums.action',
      		  type:'post',
      		  dataType:'json',
      		  success:function(d){
      			for (var i = 0; i < d.length; i++) {
					nums.push(d[i]);
				}
    			zhuchart.setOption({ //加载数据图表
    				series:{
           				data:nums
           				}
    			});
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