<%@page import="com.pojo.Complaint"%>
<%@page import="com.pojo.Customer"%>
<%@page import="com.pojo.Employee"%>
<%@include file="CallHeader.jsp"%>
<%@page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.model.BLManager" %>



<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row">
		<ol class="breadcrumb">
			<li><a href="#"><svg class="glyph stroked home">
							<use xlink:href="#stroked-home"></use></svg></a></li>
			<li class="active">Home</li>
		</ol>
	</div>
	<!--/.row-->
	<br>
	<div class="row"></div>
	<!--/.row-->
<%
   BLManager bl=new BLManager();
   List<Complaint> ae=bl.serachcomplaintlist();
   session.setAttribute("list1",ae);
%>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">View Customer Complaint</div>
				
				<div style="color: #00b300; text-align: center; font-size: 15px;">${empadd}</div>
			   <%
				session.removeAttribute("empadd");
			   %>
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
						<c:forEach items="${sessionScope.list1}" var="l">
						<tr>
						<td data-field="id" data-sortable="true"><c:out value="${l.comid} " /></td>
						<td data-field="id8" data-sortable="true"><c:out value="${l.customer.cname} " />  </td>
						<td data-field="id2" data-sortable="true"><c:out value="${l.employee.fname} " /></td>
						<td data-field="id3" data-sortable="true"><c:out value="${l.problem} " /></td>	
						<td data-field="id4" data-sortable="true"><c:out value="${l.status} " /></td>
						<td data-field="id5" data-sortable="true"><c:out value="${l.statusdate} " /></td>
						<td data-field="id6" data-sortable="true"><c:out value="${l.expense} " /></td>
						<td data-field="id7" data-sortable="true"><a href="ComplaintUpdate?comid=${l.comid}" style="color: #30a5ff;" >Update</a></td>
						
						
						</tr>
						
					</c:forEach>
						
						
					</table>
				</div>
			</div>
		</div>
	</div>
	<!--/.row-->
	<div class="row">
		<div class="col-md-6">
			<div class="panel panel-default"></div>
		</div>
		<div class="col-md-6">
			<div class="panel panel-default">



				<script>
					$(function() {
						$('#hover, #striped, #condensed')
								.click(
										function() {
											var classes = 'table';

											if ($('#hover').prop('checked')) {
												classes += ' table-hover';
											}
											if ($('#condensed').prop('checked')) {
												classes += ' table-condensed';
											}
											$('#table-style')
													.bootstrapTable('destroy')
													.bootstrapTable(
															{
																classes : classes,
																striped : $(
																		'#striped')
																		.prop(
																				'checked')
															});
										});
					});

					function rowStyle(row, index) {
						var classes = [ 'active', 'success', 'info', 'warning',
								'danger' ];

						if (index % 2 === 0 && index / 2 < classes.length) {
							return {
								classes : classes[index / 2]
							};
						}
						return {};
					}
				</script>
			</div>
		</div>
	</div>
	<!--/.row-->


</div>
<!--/.main-->
</body>
</html>
