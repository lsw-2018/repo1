<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul class="pagination" >
    <li>
      <a href="${pageContext.request.contextPath }${url }<c:if test="${fn:contains(url,'?')}">&</c:if><c:if test="${!fn:contains(url,'?')}">?</c:if>pageNo=${pageInfo.hasPreviousPage?pageInfo.pageNum-1:1}" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <c:forEach begin="1" end="${pageInfo.pages}" var="s">
    <li><a href="${pageContext.request.contextPath }${url }<c:if test="${fn:contains(url,'?')}">&</c:if><c:if test="${!fn:contains(url,'?')}">?</c:if>pageNo=${s}">${s}</a></li>
    </c:forEach> 
    <li>
      <a href="${pageContext.request.contextPath }${url }<c:if test="${fn:contains(url,'?')}">&</c:if><c:if test="${!fn:contains(url,'?')}">?</c:if>pageNo=${pageInfo.hasNextPage?pageInfo.pageNum + 1:pageInfo.pageNum}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul> 
</body>
</html>