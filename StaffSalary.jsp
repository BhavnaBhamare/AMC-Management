<%@page import="com.pojo.Employee"%>
<%@page import="java.util.List"%>
<%@page import="com.model.BLManager"%>
<%@ include file="PayRollHeader.jsp"%>
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
   List<Employee> emp=bl.serachemployeelist();
   session.setAttribute("emp",emp);
   
%>

	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<b>Add Employee Salary</b>
				</div>
				
				<div style="color: #00b300; text-align: center; font-size: 15px;">${empadd}</div>
			   <%
				session.removeAttribute("empadd");
			   %>
				
				<div class="panel-body">
					<form class="form-horizontal" action="AddSalaryController"
						method="post">
						<fieldset>

							
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Select Employee Id
									</label>
								<div class="col-md-4">
									<select name="email" class="form-control">
									<c:forEach items="${sessionScope.emp}" var="l">
										<option>${l.email}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Select Month
									</label>
								<div class="col-md-4">
									<select name="month" class="form-control">
									<option>January</option>
									<option>February</option>
									<option>March</option>
									<option>April</option>
									<option>May</option>
									<option>June</option>
									<option>July</option>
									<option>August</option>
									<option>September</option>
									<option>October</option>
									<option>November</option>
									<option>December</option>
									
									</select>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Salary 
									</label>
								<div class="col-md-2">
									<input id="name" name="salary" type="text" placeholder="10000/- Rs" class="form-control">
								</div>
							</div>
							
							
							
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Bonus
									</label>
								<div class="col-md-2">
									<input id="name" name="bonus" placeholder="5000/- Rs" type="text" class="form-control">
								</div>
							</div>
							
							<!-- Form actions -->
							<div class="col-sm-04"></div>
							<div class="col-sm-04">
								<div class="form-group">
									<div class="col-md-6 widget-right">
											<input type="submit" value="Add Salary" class="btn btn-default btn-md pull-right">
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