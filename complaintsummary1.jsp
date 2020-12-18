
<%@ include file="CallHeader.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
					<b>Complaint Summary</b>
				</div>

				<div style="color: #00b300; text-align: center; font-size: 15px;">${empadd}</div>
				<%
					session.removeAttribute("empadd");
				%>

				<div class="panel-body">
					<form class="form-horizontal" action="ComplaintSearch"
						method="post">
						<fieldset>
	

							<div class="form-group">
								<label class="col-md-2 control-label" for="name">From
									Date </label>
								<div class="col-md-3">
									<input id="name" name="fdate" type="date" class="form-control">
								</div>


								<label class="col-md-3 control-label" for="name">To Date</label>
								<div class="col-md-3">
									<input id="name" name="tdate" type="date" placeholder="Date"
										class="form-control">

								</div>

							</div>

							<div class="col-sm-04"></div>
							<div class="col-sm-04">

								<div class="form-group">
									<div class="col-md-6 widget-right">
										<button type="submit"
											class="btn btn-default btn-md pull-right">Search
											Summary</button>
									</div>
								</div>
							</div>

						</fieldset>
					</form>
				</div>
			</div>
		</div>



	</div>
	
		<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">View Customer Complaint</div>
			
				<div class="panel-body">
					<table data-toggle="table" data-url="tables/data1.json"
						data-show-refresh="true" data-show-toggle="true"
						data-show-columns="true" data-search="true"
						data-select-item-name="toolbar1" data-pagination="true"
						data-sort-name="name" data-sort-order="desc">
						<thead>
							<tr>
								<th data-field="state" data-checkbox="true">Sr.No</th>
							
								<th data-field="id8" data-sortable="true">Customer name</th>
								<th data-field="id2" data-sortable="true">Assign To</th>
								<th data-field="id3" data-sortable="true">Problem</th>
								<th data-field="id4" data-sortable="true">Status</th>
								<th data-field="id5" data-sortable="true">Complaint Date</th>
								<th data-field="id6" data-sortable="true">Expense</th>
								<th data-field="id7" data-sortable="true">Update</th>
								
							</tr>
							
						</thead>
						<c:forEach items="${sessionScope.comp}" var="l">
						<tr>
						<td data-field="id" data-sortable="true"><c:out value="${l.comid} " /></td>
						<td data-field="id8" data-sortable="true"><c:out value="${l.customer.cname} " />  </td>
						<td data-field="id2" data-sortable="true"><c:out value="${l.employee.fname} " /></td>
						<td data-field="id3" data-sortable="true"><c:out value="${l.problem} " /></td>	
						<td data-field="id4" data-sortable="true"><c:out value="${l.status} " /></td>
						<td data-field="id5" data-sortable="true"><c:out value="${l.statusdate} " /></td>
						<td data-field="id6" data-sortable="true"><c:out value="${l.expense} " /></td>
						<td data-field="id7" data-sortable="true"><a href="ComplaintDelete?comid=${l.comid}" style="color: #30a5ff;" >Delete</a></td>
						
						
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