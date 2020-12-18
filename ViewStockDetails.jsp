<%@page import="com.pojo.*"%>
<%@include file="StockHeader.jsp"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.model.BLManager"%>



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



	
	<%
	    BLManager bl=new BLManager();
		List<Stockdetails> ms=bl.searchstockdetailsList();
		session.setAttribute("list1",ms);
	%>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">Income Details</div>
				<div class="panel-body">
					<table data-toggle="table" data-url="tables/data1.json"
						data-show-refresh="true" data-show-toggle="true"
						data-show-columns="true" data-search="true"
						data-select-item-name="toolbar1" data-pagination="true"
						data-sort-name="name" data-sort-order="desc">
						<thead>
							<tr>


								<th data-field="id1" data-sortable="true">ID</th>
								<th data-field="id2" data-sortable="true">Product Group</th>
								<th data-field="id3" data-sortable="true">In Stock</th>
								<th data-field="id4" data-sortable="true">Out Stock</th>
								<th data-field="id5" data-sortable="true">Remaing</th>



							</tr>

						</thead>
						<c:forEach items="${sessionScope.list1}" var="l">
							<tr>
								<td data-field="id1" data-sortable="true"><c:out
										value="${l.sdid} " /></td>
								<td data-field="id2" data-sortable="true"><c:out
										value="${l.productgroup.productGroupName} " /></td>
								<td data-field="id3" data-sortable="true"><c:out
										value="${l.manageincoming.instock}  " /></td>
								<td data-field="id4" data-sortable="true"><c:out
										value="${l.manageoutgoing.outstock} " /></td>
								<td data-field="id4" data-sortable="true"><c:out
										value="${l.remainingstock} " /></td>

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
