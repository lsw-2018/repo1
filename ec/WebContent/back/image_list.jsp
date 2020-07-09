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
									<a href="${pageContext.request.contextPath }/back/image_insert.jsp" class="btn btn-primary btn-flat btn-addon m-b-10 m-l-5"><i class="ti-plus"></i>新增图片</a>
									<a id="batchdel" class="btn btn-danger btn-flat btn-addon sweet-confirm m-b-10 m-l-5 "><i class="ti-close"></i>多选删除</a>
									<!-- <a class="btn btn-warning btn-flat btn-addon m-b-10 m-l-5"><i class="ti-export"></i>导出Excel</a>
									<a class="btn btn-info btn-flat btn-addon m-b-10 m-l-5"><i class="ti-image"></i>生成图表</a> -->
								</div>
                                <div class="card-body" style="width:400px;margin-left:800px;margin-top:-30px;">
                                    <div class="basic-form">
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
     <div class="col-lg-12">
                            <div class="card alert" style="margin-top:-10px;">
                                <div class="card-header">
                                    <h4>图片列表  </h4>
									<div class="card-header-right-icon">
										<ul>
											<li class="card-close" data-dismiss="alert"><i class="ti-close"></i></li>
											 
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
                 <th width="500">缩略图</th>
                 <th width="300">类型</th>
                                                <th><div class="icon-container" style="width:120px;margin-top:-10px;">操作</div></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${pageInfo.list }" var="g">
                                           <tr>
                                                <td> <input type="checkbox" name="c"/></td>
                                                <td>${g.id }</td>
                 <td><img src="/il/${g.loc }" width="100" height="50"/></td>
                 <td>${g.type }</td>
                                                <td > 
                                                 <div class="icon-container" style="width:60px;">
                                                  <a class="ti-pencil-alt" href="${pageContext.request.contextPath }/image/findById.action?id=${g.id}"></a>
                                                  </div>
                                                   <div class="icon-container" style="width:60px;">
                                                  <a class="ti-trash" href="${pageContext.request.contextPath }/image/delete.action?id=${g.id}"></a>
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
				url:"${pageContext.request.contextPath }/image/deleteSome.action",
				type:"post",
				data:{"ids":str},
				success:function(d){
					if(d==0)
						alert("并未删除任何数据");
					else
					    alert("成功删除"+d+"条数据");
					location="${pageContext.request.contextPath }/image/findAll.action";
				}
			});
			
	    });
   })
</script>

</html>