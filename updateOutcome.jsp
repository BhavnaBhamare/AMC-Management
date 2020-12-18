<%@page import="com.pojo.Productgroup"%>
<%@page import="java.util.List"%>
<%@page import="com.model.BLManager"%>
<%@ include file="StockHeader.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html>
<body>

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><svg class="glyph stroked home">
						<use xlink:href="#stroked-home"></use></svg></a></li>
				<li class="active">Home</li>
			</ol>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<b>Update Product</b>
					</div>

					<div style="color: #00b300; text-align: center; font-size: 15px;">${empadd}</div>

					<div class="panel-body">
						<form action="UpdateOutcome" method="post"
						>
							<fieldset>



								<div class="form-group">
									<label class="col-md-4 control-label" for="name">Select
										Product Group Name </label>
									<div class="col-md-8">
										<input type="text" name="productGroupName"
											value="${list.productgroup.productGroupName}"
											readonly="readonly">
									</div>
								</div><br>
								

								<div class="form-group">
									<label class="col-md-4 control-label" for="name">Product
										Outstock</label>
									<div class="col-md-8">

										<input type="text" name="instock"
											value="${list.outstock}" >
									</div>
								</div><br>
								<div class="form-group">
									<label class="col-md-4 control-label" for="name">Product
										Date </label>
									<div class="col-md-8">
										<input type="date" name="outstockdate"
											value="${list.outstockdate}">
									</div>
								</div><br>

								
								<div class="form-group">
									<div class="col-md-6 widget-right">
										<input type="submit" value="Update Product"
											class="btn btn-default btn-md pull-right">
									</div>
								</div>
							</fieldset>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>



</html>