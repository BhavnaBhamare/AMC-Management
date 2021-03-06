

<%@include file="StockHeader.jsp"%>
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
					<b>update Product Group</b>
				</div>

				<div style="color: #00b300; text-align: center; font-size: 15px;">${empadd}</div>
				<%
					session.removeAttribute("empadd");
				%>

				<div class="panel-body">
					<form action="UpdateProductGroup" method="post">
						<fieldset>


							<input type="hidden" name="productGroupId"
								value="${pgid.productGroupId}">

							<div class="form-group">
								<label class="col-md-3 control-label" for="productGroupName">Product
									Group Name </label>
								<div class="col-md-4">

									<input type="text" name="productGroupName"
										value="${pgid.productGroupName}">
								</div>
							</div>

							<div class="col-sm-04"></div>
							<div class="col-sm-04">
								<div class="form-group">
									<div class="col-md-6 widget-right">
										<input type="submit" value="Update Product Group"
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
</div>
<!--/.main-->