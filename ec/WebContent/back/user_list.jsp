<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>后台管理系统主页</title>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
    <script type="text/javascript">
    $(function(){
    	  $("#export").click(function(){
    			 $.ajax({
    					   url:'${pageContext.request.contextPath }/user/export.action',
    					   type:"post",
    					   dataType:'json',
    					   success:function(data){
    						   var str = "编号,用户名,密码,用户等级,真实姓名,性别,电话\n";
    						   $.each(data, function(i,value) {
    								 with(value){
    								str+=id+","+username+","+password+","+type+","+realname+","+sex+","+tel;
    							    }
    							    str+="\n";
    							});
    				  var  uri = 'data:text/csv;charset=utf-8,\ufeff' + encodeURIComponent(str);
    						      var link = document.createElement("a");
    						      link.href = uri;
    						      //var d =new Date();
    						     // var dt =(d.getYear()+1900)+""+(d.getMonth()+1)+(d.getDate()<10?"0"+d.getDate():d.getDate())+d.getHours()+d.getMinutes()+d.getSeconds();
    						      //link.download =  "用户表"+dt+".xls";
    						      link.download =  "用户表.xls";
    						      document.body.appendChild(link);
    						      link.click();
    						      document.body.removeChild(link); 
    					   }
    				      
    			  }); });
    });
    </script>
    
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>
    <div class="content-wrap">
    <div class="col-lg-12" style="margin-top:-80px;margin-bottom:-15px;height:50px;">
   
                            <div class="card alert" >
                             <div class="button-list sweetalert">
									<!-- <a href="user_insert.jsp" class="btn btn-primary btn-flat btn-addon m-b-10 m-l-5"><i class="ti-plus"></i>新增用户</a> -->
									<a id="batchdel" class="btn btn-danger btn-flat btn-addon sweet-confirm m-b-10 m-l-5 "><i class="ti-close"></i>多选删除</a>
									<a class="btn btn-warning btn-flat btn-addon m-b-10 m-l-5" id="export"><i class="ti-export"></i>导出Excel</a>
									<a class="btn btn-info btn-flat btn-addon m-b-10 m-l-5" href="${pageContext.request.contextPath }/back/user_chart.jsp"><i class="ti-image"></i>生成图表</a>
								<%-- 	<a class="btn btn-info btn-flat btn-addon m-b-10 m-l-5" href="${pageContext.request.contextPath }/back/user_chartPie.jsp"><i class="ti-image"></i>生成图表</a> --%>
								</div>
                                <div class="card-body" style="width:400px;margin-left:800px;margin-top:-30px;">
                                    <div class="basic-form">
                                        <form action="${pageContext.request.contextPath }/user/findByName.action" method="post">
                                            <div class="form-group">
                                                <div class="input-group input-group-rounded">
                                                    <span class="input-group-btn"><button class="btn btn-primary input-group-close-icon btn-group-left" type="submit"><i class="ti-close"></i></button></span>
                                                    <input type="text" name="username" class="form-control" placeholder="按用户名查询...">
                                                    <span class="input-group-btn"><button class="btn btn-primary btn-group-right" type="submit"><i class="ti-search"></i></button></span>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
     <div class="col-lg-12">
                            <div class="card alert">
                                <div class="card-header">
                                    <h4>用户列表  </h4>
									<div class="card-header-right-icon">
										<ul>
											<li class="card-close" data-dismiss="alert"><i class="ti-close"></i></li>
										<!-- 	<li class="card-option drop-menu"><i class="ti-settings" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" role="link"></i>
												<ul class="card-option-dropdown dropdown-menu">
													<li><a href="#"><i class="ti-loop"></i> Update data</a></li>
													<li><a href="#"><i class="ti-menu-alt"></i> Detail log</a></li>
													<li><a href="#"><i class="ti-pulse"></i> Statistics</a></li>
													<li><a href="#"><i class="ti-power-off"></i> Clear ist</a></li>
												</ul>
											</li> -->
											 
										</ul>
									</div>
                                </div>
                                <div class="card-body">
                                    <table class="table table-responsive table-hover ">
                                        <thead>
                                            <tr>
                                                <th width="50">
                                                 <input type="checkbox" name="c" id="c1"/>
                                                </th>
                                                <th width="100">编号</th>
                                                <th width="200">用户名</th>
                                                <th width="200">用户等级</th>
                                                <th width="200">真实姓名</th>
                                                <th width="100">性别</th>
                                                <th width="350">电话</th>
                                                <th><div class="icon-container" style="width:150px;">操作</div></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${pageInfo.list }" var="u">
                                           <tr>
                                                <td> <input type="checkbox" name="c"/></td>
                                                <td scope="row">${u.id }</td>
                                                <td>${u.username}</td>
                                                <td>
                                                <!--    info-->
                                                 <span class="badge 
                                                <c:choose>
                                                  <c:when test="${u.type eq '倔强青铜' }">badge-default</c:when>
                                                  <c:when test="${u.type eq '秩序白银' }">badge-primary</c:when>
                                                  <c:when test="${u.type eq '荣耀黄金' }">badge-success</c:when>
                                                  <c:when test="${u.type eq '永恒钻石' }">badge-info</c:when>
                                                  <c:when test="${u.type eq '尊贵铂金' }">badge-warning</c:when>
                                                  <c:when test="${u.type eq '至尊星耀' }">badge-pink</c:when>
                                                  <c:when test="${u.type eq '最强王者' }">badge-danger</c:when>
                                                </c:choose>
                                               ">${u.type}</span></td>
                                                <td>${u.realname }</td>
                                                <td>${u.sex }</td>
                                                <td class="color-warning">${u.tel }</td>
                                                <td > 
                                                 <div class="icon-container" style="width:60px;">
                                                  <a class="ti-pencil-alt" href="${pageContext.request.contextPath }/user/findById.action?id=${u.id}"></a>
                                                  </div>
                                                   <div class="icon-container" style="width:60px;">
                                                  <a class="ti-trash" href="${pageContext.request.contextPath }/user/delete.action?id=${u.id}"></a>
                                                  </div>
                                            </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
               </div>
               <nav aria-label="Page navigation" style="margin-top:-20px;margin-left:460px;">
 <jsp:include page="pager.jsp"></jsp:include>
</nav>
 </div></div>
</body>
<script type="text/javascript">
   $(function(){
	    $("#c1").click(function(){
	    	$("input[name=c]").prop("checked",this.checked);
	    });
	    $("#batchdel").click(function(){
	    	var checks = $("input[name=c]");
			var str="";
			
			 $.each(checks,function(index,value){
				 if(value.checked && index!=0){
					str+=$(this).parent().next().html()+',';
				 }
			});
			  //str=str.substring(0,str.length-1);
			 $.ajax({
				url:"${pageContext.request.contextPath }/user/deleteSome.action",
				type:"post",
				data:{"ids":str},
				success:function(d){
					if(d==0)
						alert("并未删除任何数据");
					else
					    alert("成功删除"+d+"条数据");
					location="${pageContext.request.contextPath }/user/findAll.action";
				}
			});
			
	    });
   })
</script>

</html>