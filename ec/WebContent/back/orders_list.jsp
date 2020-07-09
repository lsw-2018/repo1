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
    					   url:'${pageContext.request.contextPath }/orders/export.action',
    					   type:"post",
    					   dataType:'json',
    					   success:function(data){
    						   var str = "编号,订单编号,商品名称,商品数量,下单时间,订单状态,配送地址,支付方式,下单用户\n";
    						   
    						   for (var i=0;i<data.length;i++){
    							   str+=data[i].id+","+data[i].no+","+data[i].oims[0].goods.name+","+data[i].oims[0].num+","+data[i].time+","+data[i].status+","+data[i].address.loc+","+data[i].paytype+","+data[i].user.username+"\n";
    							  
    							   for (var j=1;j<data[i].oims.length;j++){
    								   str+=",,"+data[i].oims[j].goods.name+","+data[i].oims[j].num+",,,,,\n";
    							   }
    						   }
    						

    				var  uri = 'data:text/csv;charset=utf-8,\ufeff' + encodeURIComponent(str);
    						      var link = document.createElement("a");
    						      link.href = uri;
    						      link.download =  "订单表.csv";
    						      document.body.appendChild(link);
    						      link.click();
    						      document.body.removeChild(link);
    					    }
    				      
    			  });  });
    });
    </script>
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>
    <div class="content-wrap">
    <div class="col-lg-12" style="margin-top:-80px;margin-bottom:-15px;height:50px;">
   
                            <div class="card alert" >
                             <div class="button-list sweetalert">
									<%-- <a href="${pageContext.request.contextPath }/goods_insert.jsp" class="btn btn-primary btn-flat btn-addon m-b-10 m-l-5"><i class="ti-plus"></i>新增商品</a> --%>
									<a id="batchdel" class="btn btn-danger btn-flat btn-addon sweet-confirm m-b-10 m-l-5 "><i class="ti-close"></i>多选删除</a>
									<a class="btn btn-warning btn-flat btn-addon m-b-10 m-l-5" id="export"><i class="ti-export"></i>导出Excel</a>
									<!-- <a class="btn btn-info btn-flat btn-addon m-b-10 m-l-5"><i class="ti-image"></i>生成图表</a> -->
								</div>
                                <div class="card-body" style="width:400px;margin-left:800px;margin-top:-30px;">
                                    <div class="basic-form">
                                        <form action="${pageContext.request.contextPath }/orders/findByName.action" method="post">
                                            <div class="form-group">
                                                <div class="input-group input-group-rounded">
                                                    <span class="input-group-btn"><button class="btn btn-primary input-group-close-icon btn-group-left" type="submit"><i class="ti-close"></i></button></span>
                                                    <input type="text" name="name" class="form-control" placeholder="按订单号码查询...">
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
                                    <h4>订单列表  </h4>
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
                 <th width="70">编号</th>
                 <td width="150">订单编号</td>
                 <td width="300">商品名称</td>
                 <td width="200">总价</td>
                 <td width="150">状态</td>
                 <td width="200">地址</td>
                 <td width="150"> 用户</td>
                                                <th><div class="icon-container" style="width:120px;margin-top:-10px;">操作</div></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        
                                        <c:forEach items="${pageInfo.list}" var="g">
                                           <tr>
                                       
                                                <td> <input type="checkbox" name="c"/></td>
                                                <td>${g.id }</td>
                 <td>${g.no }</td>
                 <td>
                    <c:forEach items="${g.oims }" var="o">
                       ${fn:length(o.goods.name)>15?fn:substring(o.goods.name,0,15).concat("..."):o.goods.name}×${o.num }<br>
                     <c:set value="${o.goods.newprice*o.num }" var="sum"></c:set>
                    </c:forEach>
                 </td>
                 <td>${sum }</td>
                 <td class="color-danger">
                  <form class="updateform" action="${pageContext.request.contextPath }/orders/update.action?id=${g.id}" method="post">
                   <select name="status">
                     <option value="已下单"  ${g.status eq '已下单' ?'selected':''}>已下单</option>
                     <option value="已付款"  ${g.status eq '已付款' ?'selected':''}>已付款</option>
                     <option value="已发货"  ${g.status eq '已发货' ?'selected':''}>已发货</option>
                     <option value="已签收"  ${g.status eq '已签收' ?'selected':''}>已签收</option>
                     <option value="发起退货" ${g.status eq '发起退货' ?'selected':''}>发起退货</option>
                     <option value="已删除"  ${g.status eq '已删除' ?'selected':''}>已删除</option>
                   </select>
                    </form>
                 </td>
                 <td>${g.address.loc }</td>
                 <td class="color-info">${g.user.username }</td>
                                                <td > 
                                                 <div class="icon-container" style="width:60px;">
                                                  <a class="ti-pencil-alt" id="updateorder"></a>
                                                  </div>
                                                 
                                                   <div class="icon-container" style="width:60px;">
                                                  <a class="ti-trash" href="${pageContext.request.contextPath }/orders/delete.action?id=${g.id}"></a>
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
	   $("#updateorder").click(function(){
		  $(".updateform").submit();
	   });
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
				url:"${pageContext.request.contextPath }/orders/deleteSome.action",
				type:"post",
				data:{"ids":str},
				success:function(d){
					if(d==0)
						alert("并未删除任何数据");
					else
					    alert("成功删除"+d+"条数据");
					location="${pageContext.request.contextPath }/orders/findAll.action";
				}
			});
			
	    });
   })
</script>

</html>