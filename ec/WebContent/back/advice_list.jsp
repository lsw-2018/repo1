<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <div class="content-wrap">
    <div class="col-lg-12" style="margin-top:-80px;margin-bottom:-15px;height:50px;">
   
                            <div class="card alert" >
                             <div class="button-list sweetalert">
									<a href="${pageContext.request.contextPath }/back/advice_insert.jsp" class="btn btn-primary btn-flat btn-addon m-b-10 m-l-5"><i class="ti-plus"></i>新增公告</a>
									<a id="batchdel" class="btn btn-danger btn-flat btn-addon sweet-confirm m-b-10 m-l-5 "><i class="ti-close"></i>多选删除</a>
									<!-- <a class="btn btn-warning btn-flat btn-addon m-b-10 m-l-5"><i class="ti-export"></i>导出Excel</a>
									<a class="btn btn-info btn-flat btn-addon m-b-10 m-l-5"><i class="ti-image"></i>生成图表</a> -->
								</div>
                                <div class="card-body" style="width:400px;margin-left:800px;margin-top:-30px;">
                                    <div class="basic-form">
                                        <form action="${pageContext.request.contextPath }/advice/findByName.action" method="post">
                                            <div class="form-group">
                                                <div class="input-group input-group-rounded">
                                                    <span class="input-group-btn"><button class="btn btn-primary input-group-close-icon btn-group-left" type="submit"><i class="ti-close"></i></button></span>
                                                    <input type="text" name="username" class="form-control" placeholder="按标题查询...">
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
                                    <h4>公告列表  </h4>
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
                                                <th width="400">标题</th>
                                                <th width="280">发布者</th>
                                                <th width="280">发布时间</th>
                                                <th><div class="icon-container" style="width:150px;">操作</div></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${pageInfo.list}" var="a">
                                           <tr>
                                                <td> <input type="checkbox" name="c"/></td>
                                                <td scope="row">${a.id }</td>
                                                <td>${a.title}</td>
                                                <td>${a.admin.username }</td>
                                                <td>${a.time}</td>
                                                <td > 
                                                 <div class="icon-container" style="width:60px;">
                                                  <a class="ti-pencil-alt" href="${pageContext.request.contextPath }/advice/findById.action?id=${a.id}"></a>
                                                  </div>
                                                   <div class="icon-container" style="width:60px;">
                                                  <a class="ti-trash" href="${pageContext.request.contextPath }/advice/delete.action?id=${a.id}"></a>
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
				url:"${pageContext.request.contextPath }/advice/deleteSome.action",
				type:"post",
				data:{"ids":str},
				success:function(d){
					if(d==0)
						alert("并未删除任何数据");
					else
					    alert("成功删除"+d+"条数据");
					location="${pageContext.request.contextPath }/advice/findAll.action";
				}
			});
			
	    });
   })
</script>

</html>