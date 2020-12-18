
<%@page import="com.pojo.Manageproduct"%>
<%@page import="com.model.BLManager"%>
<%@ include file="StockHeader.jsp"%>
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
	<!--/.row-->
	<%
		BLManager bl = new BLManager();
		List<Manageproduct> l = bl.searchManageProductList();
		session.setAttribute("list", l);
	%>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">View Product</div>
				<div class="panel-body">
					<table data-toggle="table" data-url="tables/data1.json"
						data-show-refresh="true" data-show-toggle="true"
						data-show-columns="true" data-search="true"
						data-select-item-name="toolbar1" data-pagination="true"
						data-sort-name="name" data-sort-order="desc">
						<thead>
							<tr>


								<th data-field="id1" data-sortable="true">Product Id</th>
								<th data-field="id2" data-sortable="true">Product Name</th>
								<th data-field="id3" data-sortable="true">Product Group</th>
								<th data-field="id4" data-sortable="true">Suplier Name</th>
								<th data-field="id5" data-sortable="true">Product Code</th>
								<th data-field="id6" data-sortable="true">Product Image</th>
								<th data-field="id7" data-sortable="true">Product Stock</th>
								<th data-field="id8" data-sortable="true">Product Price</th>
								<th data-field="id9" data-sortable="true">Product Warranty</th>
								<th data-field="id10" data-sortable="true">Product Description</th>
								<th data-field="id11" data-sortable="true">Product Update</th>
								<!-- <th data-field="id12" data-sortable="true">Product Delete</th> -->


							</tr>

						</thead>
						<c:forEach items="${sessionScope.list}" var="i">
							<tr>
								<td data-field="id1" data-sortable="true"><c:out
										value="${i.productId} " /></td>

								<td data-field="id2" data-sortable="true"><c:out
										value="${i.productName} " /></td>
								<td data-field="id3" data-sortable="true"><c:out
										value="${i.productgroup.productGroupName} " /></td>
								<td data-field="id4" data-sortable="true"><c:out
										value="${i.managesupplier.suplierName} " /></td>
								<td data-field="id5" data-sortable="true"><c:out
										value="${i.productCode} " /></td>
								<td data-field="id6" data-sortable="true"><img alt="abc" src="mehtaimages/${i.productImage}"
													style="width: 50px; height: 50px;"></td>
								<td data-field="id7" data-sortable="true"><c:out
										value="${i.quantity} " /></td>
										
										<td data-field="id8" data-sortable="true"><c:out
										value="${i.productPrice} " /></td>
										<td data-field="id9" data-sortable="true"><c:out
										value="${i.productWarranty} " /></td>
										<td data-field="id10" data-sortable="true"><c:out
										value="${i.productDescription} " /></td>
										
								<td data-field="id11" data-sortable="true"><a
									href="UpdateProduct?productId=${i.productId}"
									style="color: blue;">Update Product</a></td>
								<%-- <td data-field="id12" data-sortable="true"><a
									href="DeleteProduct?productId=${i.productId}"
									style="color: blue;">Delete Product</a></td> --%>

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
