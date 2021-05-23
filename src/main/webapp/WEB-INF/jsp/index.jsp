<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/"; 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript">
window.contextPath = '<%=basePath%>';
window.result = 'wordcount/result';

</script>
<title>中文统计</title>
</head>

<body >
	${hello }
	<table>
	    <thead>
	      <tr>
	       <th>文字</th>
	       <th>个数</th>
	      </tr>
	    </thead>
		<c:forEach var="wm" items="wordMap">
		<tr>
		  <td><c:out value="${wm.key }" /> </td>
		  <td><c:out value="${wm.value }" /></td>
		</tr>
		</c:forEach>
	</table>
	
</body>
</html>