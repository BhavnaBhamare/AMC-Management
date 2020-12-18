
<%@page import="com.model.BLManager"%>
<%@page import="com.pojo.Employee"%>
<%@page import="java.util.List"%>
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
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<b>Search Salary</b>
				</div>
				
				<div style="color: #00b300; text-align: center; font-size: 15px;">${empadd}</div>
			   <%
			   BLManager bl=new BLManager();
				session.removeAttribute("empadd");
			   List<Employee> l=bl.serachemployeelist();
			   
			   session.setAttribute("elist", l);
			   %>
				
				<div class="panel-body">
					<form class="form-horizontal" action="SearchAttendenceController"
						method="post">
						<fieldset>

							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Select Email
									</label>
								<div class="col-md-4">
									<select name="email" class="form-control">
										<c:forEach items="${elist}" var="l">
										
										
										<option>${l.email }</option>
										</c:forEach>
									</select>
								</div>
							</div>
							
							<

							<!-- Form actions -->
							<div class="col-sm-04"></div>
							<div class="col-sm-04">
								<div class="form-group">
									<div class="col-md-6 widget-right">
											<input type="submit" value="Search" class="btn btn-default btn-md pull-right">
									</div>
								</div>
							</div>

						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%
	session.getAttribute("alist");
	%>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">View Attendence Details</div>
				<div class="panel-body">
					<table data-toggle="table" data-url="tables/data1.json"
						data-show-refresh="true" data-show-toggle="true"
						data-show-columns="true" data-search="true"
						data-select-item-name="toolbar1" data-pagination="true"
						data-sort-name="name" data-sort-order="desc">
						<thead>
							<tr>
							<%int i=0; %>
								
							
							
								<th data-field="id2" data-sortable="true">Sr No.</th>
									<th data-field="id3" data-sortable="true">Email</th>
								<th data-field="id4" data-sortable="true">First Name</th>
									<th data-field="id5" data-sortable="true">Date</th>
								<th data-field="id6" data-sortable="true">Status</th>
					
									
							
								
							</tr>
							
						</thead>
						<c:forEach items="${sessionScope.alist}" var="l">
						<tr>
					
						
						<td data-field="id2" data-sortable="true"><c:out value="<%=i++ %>" /></td>
						<td data-field="id3" data-sortable="true"><c:out value="${l.employee.email} " /></td>
						<td data-field="id4" data-sortable="true"><c:out value="${l.employee.fname} " /></td>	
						<td data-field="id5" data-sortable="true"><c:out value="${l.adate} " /></td>
						<td data-field="id6" data-sortable="true"><c:out value="${l.status} " /></td>
						
						
						
						</tr>
						
					</c:forEach>
						
						
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<!--/.row-->
</div>
<!--/.main-->