<%@page import="com.pojo.Manageoutgoing"%>
<%@page import="com.pojo.Productgroup"%>
<%@page import="com.pojo.Manageincoming"%>
<%@page import="java.util.List"%>
<%@page import="com.model.BLManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!--  <script> 
function get(){ 
var m=$_GET['productGroupName'];
window.location.replace("findInStock.jsp?productGroupName="+m); 
} 
</script>  -->
</head>
<%
	String productGroupName = request.getParameter("productGroupName");
System.out.print("aaa"+productGroupName);
	BLManager bl = new BLManager();
	Productgroup pg = new Productgroup();
	pg = bl.searchbyproductGroupName(productGroupName);
	int pid = pg.getProductGroupId();
	System.out.print(pid);
	List<Manageincoming> l = bl.searchInStock(pid);
	session.setAttribute("list", l);
	//List<Manageoutgoing> l1 = bl.searchOutStock(pid);
//	session.setAttribute("list1", l1);
	System.out.print("listttt"+l);
%>

<body>
	<div id="state_div" >
		<select name="instock" >
			<option value="0">Select stock</option>
			<c:forEach items="${sessionScope.list}" var="i">
				<option>${i.instock}</option>
			</c:forEach>
     
		</select>
		
		
	
	</div>
	
	<%-- <div id="state_div1">
		<select name="instock">
			<option value="0">Select stock</option>
			<c:forEach items="${sessionScope.list1}" var="i">
				<option>${i.outstock}</option>
			</c:forEach>
     
		</select>
		 --%>
		
	
	
	
	
</body>
</html>

</body>
</html>