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
		List<Productgroup> l=bl.searchProductGroupList();
		List<Managesupplier> l1=bl.searchSuplierList();
		session.setAttribute("list", l);

		session.setAttribute("list1", l1);
	%>


	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<b>Stock Incoming Manage</b>
				</div>

				<div style="color: #00b300; text-align: center; font-size: 15px;">${empadd}</div>
				<%
					session.removeAttribute("empadd");
				%>

				<div class="panel-body">
					<form action="StockManageIncoming" method="post"
						class="form-horizontal">
						<fieldset>
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Select
									Product Group Name </label>
								<div class="col-md-6">
									<select name="productGroupName">
										<c:forEach items="${list}" var="l">

											<option>${l.productGroupName}</option>

										</c:forEach>


									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Select
									Suplier Name </label>
								<div class="col-md-6">
									<select name="suplierName">
										<c:forEach items="${list1}" var="l">

											<option>${l.suplierName}</option>

										</c:forEach>


									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Product
									Instock </label>
								<div class="col-md-6">
									<input type="text" name="instock">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">
									Instock Date :-</label>
								<div class="col-md-6">
									<input type="date" name="instockdate">
								</div>
							</div>

							<div class="form-group">
								<!-- <div class="col-md-6 widget-right">
										<input type="submit" value="Procced"
											class="btn btn-default btn-md pull-right">
									</div> -->


								<div class="col-md-5 widget-right">
									<input type="submit" value="Add Income" name="flag"
										style="background-color: aqua"
										class="btn btn-default btn-md pull-right">
								</div>

								<div class="col-md-2 widget-right">
									<input type="submit" value="View Income " name="flag"
										style="background-color: aqua"
										class="btn btn-default btn-md pull-right">
								</div>



							</div>
						</fieldset>

					</form>
				</div>
			</div>
		</div>
	</div>
	<%
		List<Manageincoming> ms=bl.searchManageIncomingList();
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
								<th data-field="id3" data-sortable="true">Supplier Name</th>
								<th data-field="id4" data-sortable="true">In Stock</th>
								<th data-field="id5" data-sortable="true">Date Incoming</th>



							</tr>

						</thead>
						<c:forEach items="${sessionScope.list1}" var="l">
							<tr>
								<td data-field="id1" data-sortable="true"><c:out
										value="${l.mid} " /></td>
								<td data-field="id2" data-sortable="true"><c:out
										value="${l.productgroup.productGroupName} " /></td>
								<td data-field="id3" data-sortable="true"><c:out
										value="${l.managesupplier.suplierName}  " /></td>
								<td data-field="id4" data-sortable="true"><c:out
										value="${l.instock} " /></td>
								<td data-field="id4" data-sortable="true"><c:out
										value="${l.instockdate} " /></td>

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
