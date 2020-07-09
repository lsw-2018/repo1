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
    					   url:'${pageContext.request.contextPath }/goods/export.action',
    					   type:"post",
    					   dataType:'json',
    					   success:function(data){
    						   var str = "编号,商品名称,描述,颜色,现价,原价,类型,是否热销,是否精品,是否推荐,库存,销量\n";
    						   $.each(data, function(i,value) {
    								 with(value){
    								str+=id+","+name+","+miaoshu+","+color+","+newprice+","+oldprice+","+type+","+ishot+","+isgood+","+istuijian+","+num+","+salenum;
    							    }
    							    str+="\n";
    							});
    						   alert(str);
    				  var  uri = 'data:text/csv;charset=utf-8,\ufeff' + encodeURIComponent(str);
    						      var link = document.createElement("a");
    						      link.href = uri;
    						      //var d =new Date();
    						     // var dt =(d.getYear()+1900)+""+(d.getMonth()+1)+(d.getDate()<10?"0"+d.getDate():d.getDate())+d.getHours()+d.getMinutes()+d.getSeconds();
    						      //link.download =  "用户表"+dt+".xls";
    						      link.download =  "商品表.xls";
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
									<a href="${pageContext.request.contextPath }/back/goods_insert.jsp" class="btn btn-primary btn-flat btn-addon m-b-10 m-l-5"><i class="ti-plus"></i>新增商品</a>
									<a id="batchdel" class="btn btn-danger btn-flat btn-addon sweet-confirm m-b-10 m-l-5 "><i class="ti-close"></i>多选删除</a>
									<a class="btn btn-warning btn-flat btn-addon m-b-10 m-l-5" id="export"><i class="ti-export"></i>导出Excel</a>
									<a class="btn btn-info btn-flat btn-addon m-b-10 m-l-5" href="${pageContext.request.contextPath }/back/goods_chart.jsp"><i class="ti-image"></i>生成图表</a>
								</div>
                                <div class="card-body" style="width:400px;margin-left:800px;margin-top:-30px;">
                                    <div class="basic-form">
                                        <form action="${pageContext.request.contextPath }/goods/findByName.action" method="post">
                                            <div class="form-group">
                                                <div class="input-group input-group-rounded">
                                                    <span class="input-group-btn"><button class="btn btn-primary input-group-close-icon btn-group-left" type="submit"><i class="ti-close"></i></button></span>
                                                    <input type="text" name="username" class="form-control" placeholder="按商品名查询...">
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
                                    <h4>商品列表  </h4>
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
                 <th width="60">编号</th>
                 <th width="320">商品名称</th>
                 <th width="100">颜色</th>
                 <th width="100">现价</th>
                 <th width="100">原价</th>
                 <th width="100">缩略图</th>
                 <th width="100">类型</th>
                 <th width="80">库存</th>
                 <th width="80">销量</th>
                                                <th><div class="icon-container" style="width:120px;margin-top:-10px;">操作</div></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${pageInfo.list}" var="g">
                                           <tr>
                                                <td> <input type="checkbox" name="c"/></td>
                                                <td>${g.id }</td>
                 <td>${fn:length(g.name)>20?fn:substring(g.name,0,20).concat("..."):g.name }</td>
                 <td>${g.color }</td>
                 <td class="color-warning">${g.newprice }</td>
                 <td class="color-danger">${g.oldprice }</td>
                 <td><img src="/i/${g.pic }" width="50" height="50"/></td>
                 <td>${g.type }</td>
                 <td class="color-info">${g.num }</td>
                 <td>${g.salenum }</td>
                                                <td > 
                                                 <div class="icon-container" style="width:60px;">
                                                  <a class="ti-pencil-alt" href="${pageContext.request.contextPath }/goods/findById.action?id=${g.id}"></a>
                                                  </div>
                                                   <div class="icon-container" style="width:60px;">
                                                  <a class="ti-trash" href="${pageContext.request.contextPath }/goods/delete.action?id=${g.id}"></a>
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
				url:"${pageContext.request.contextPath }/goods/deleteSome.action",
				type:"post",
				data:{"ids":str},
				success:function(d){
					if(d==0)
						alert("并未删除任何数据");
					else
					    alert("成功删除"+d+"条数据");
					location="${pageContext.request.contextPath }/goods/findAll.action";
				}
			});
			
	    });
   })
</script>

</html>