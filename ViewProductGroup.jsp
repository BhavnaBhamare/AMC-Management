<%@page import="com.pojo.Productgroup"%>
<%@page import="com.model.BLManager"%>
<%@ include file="StockHeader.jsp"%>
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
	
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<b>Add Product Group</b>
				</div>
				
				<div style="color: #00b300; text-align: center; font-size: 15px;">${empadd}</div>
			   <%
				session.removeAttribute("empadd");
			   %>
				
				<div class="panel-body">
					<form class="form-horizontal" action="AddProductGroupServlet"
						method="post">
						<fieldset>

							
							<div class="form-group">
								<label class="col-md-3 control-label" for="productGroupName">Product Group Name
									</label>
								<div class="col-md-4">
									<input type="text" name="productGroupName" placeholder="water purifier"  class="form-control">
								</div>
							</div>
						
							
							<!-- Form actions -->
							<div class="col-sm-04"></div>
							<div class="col-sm-04">
								<!-- <div class="form-group">
									<div class="col-md-6 widget-right">
											<input type="submit" value="Add Product Group" class="btn btn-default btn-md pull-right">
									</div>
								</div> -->
								
								<div class="form-group">
									<div class="col-md-5 widget-right">
										<input type="submit" value="Add Product Group" name="flag"
											style="background-color: aqua"
											class="btn btn-default btn-md pull-right">
									</div>

									<div class="col-md-2 widget-right">
										<input type="submit" value="View Product Group" name="flag"
											style="background-color: aqua"
											class="btn btn-default btn-md pull-right">
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
<%
	BLManager bl = new BLManager();
	List<Productgroup> l = bl.searchProductGroupList();
	session.setAttribute("list", l);
%>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">View Product Group</div>
				<div class="panel-body">
					<table data-toggle="table" data-url="tables/data1.json"
						data-show-refresh="true" data-show-toggle="true"
						data-show-columns="true" data-search="true"
						data-select-item-name="toolbar1" data-pagination="true"
						data-sort-name="name" data-sort-order="desc">
						<thead>
							<tr>
							
							
								<th data-field="id" data-sortable="true">Product Group Id</th>
								<th data-field="id2" data-sortable="true">Product Group Name</th>
								<th data-field="id3" data-sortable="true">Update Product Group</th>
								
							
								
							</tr>
							
						</thead>
						<c:forEach items="${sessionScope.list}" var="i">
						<tr>
						<td data-field="id" data-sortable="true"><c:out value="${i.productGroupId} " /></td>
					
						<td data-field="id2" data-sortable="true"><c:out value="${i.productGroupName} " /></td>
						<td data-field="id3" data-sortable="true"><a href="UpdateProductGroup?productGroupId=${i.productGroupId}" style="color: blue;">Update Group</a></td>	
					<%-- 	<td data-field="id4" data-sortable="true"><a href="DeleteProductGroup?productGroupId=${i.productGroupId}" style="color: blue;">Delete Group</a></td> --%>
						
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
