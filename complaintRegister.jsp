<%@page import="com.pojo.Employee"%>
<%@page import="com.pojo.Customer"%>
<%@page import="java.util.List"%>
<%@page import="com.model.BLManager"%>
<%@ include file="CallHeader.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row">
		<ol class="breadcrumb">
			<li><a href="#"><svg class="glyph stroked home">
						<use xlink:href="#stroked-home"></use></svg></a></li>
			<li class="active">Home</li>
		</ol>
	</div>
	<!--/.row-->

	<div class="row" style="padding-top: 20px;">
		<div class="col-lg-12">
			<!-- <h1 class="page-header">Widgets</h1> -->
		</div>
	</div>
	<!--/.row-->

<%
  BLManager bl=new BLManager();
  List<Customer> c=bl.serachcustlist();
  session.setAttribute("clist",c);
  
  List<Employee> e=bl.serachemployeelist();
  session.setAttribute("elist",e);
  
%>

	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<b>Complaint Registration</b>
				</div>
				
				<div style="color: #00b300; text-align: center; font-size: 15px;">${empadd}</div>
			   <%
				session.removeAttribute("empadd");
			   %>
				
				<div class="panel-body">
					<form class="form-horizontal" action="ComplaintRegistration" method="post">
						<fieldset>
							<!-- Name input-->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Customer Name</label>
								<div class="col-md-4">
									<select name="cname" class="form-control">
									<c:forEach items="${sessionScope.clist}" var="l">
									    <option>${l.cname}</option>
									</c:forEach>
									</select>
								</div>
							</div>
							
						
							
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Assign To</label>
								<div class="col-md-4">
									<select name="ename" class="form-control">
									  <c:forEach items="${sessionScope.elist}" var="l">
									    <option>${l.fname}</option>
									</c:forEach>
									</select>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Status</label>
								<div class="col-md-4">
									<select name="status" class="form-control">
									 
									    <option>Registered</option>
									    <option>Processing</option>
									    <option>Resolved</option>
									    <option>Can't Resolved</option>
									
									</select>
								</div>
							</div>
								<div class="form-group">
								<label class="col-md-3 control-label" for="name">Problem </label>
								<div class="col-md-4">
									<input id="name" name="problem" type="text"
										placeholder="Not working" class="form-control">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Complaint Date</label>
								<div class="col-md-4">
									<input id="name" name="sdate" type="date"
										placeholder="Date" class="form-control">
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Extra Cost</label>
								<div class="col-md-4">
									<input id="name" name="expense" type="text"
										placeholder="Extra Charges" class="form-control">
								</div>
							</div>
							
							<!-- Form actions -->
							<div class="col-sm-04"></div>
							<div class="col-sm-04">
							
								<div class="form-group">
									<div class="col-md-6 widget-right">
										<button type="submit"
											class="btn btn-default btn-md pull-right">Add Complaint</button>
									</div>
								</div>
							</div>

						</fieldset>
					</form>
				</div>
			</div>
		</div>
	


	</div>
	<!--/.row-->
</div>
<!--/.main-->