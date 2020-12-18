
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
						<form action="UpdateProduct" method="post"
							enctype="multipart/form-data">
							<fieldset>
							<input type="hidden" name="productId" value="${list.productId}">

								<div class="form-group">
									<label class="col-md-4 control-label" for="name">
										Product Name </label>
									<div class="col-md-8">

										<input type="text" name="productName"
											value="${list.productName}">
									</div>
								</div><br>

								<div class="form-group">
									<label class="col-md-4 control-label" for="name">Select
										Product Group Name </label>
									<div class="col-md-8">
										<input type="text" name="productName"
											value="${list.productgroup.productGroupName}"
											readonly="readonly">
									</div>
								</div><br>
								<div class="form-group">
									<label class="col-md-4 control-label" for="name">Product
										Suplier Name</label>
									<div class="col-md-8">

										<input type="text" name="suplierName"
											value="${list.managesupplier.suplierName}"
											readonly="readonly">
									</div>
								</div><br>
								<div class="form-group">
									<label class="col-md-4 control-label" for="name">Product
										code </label>
									<div class="col-md-8">
										<input type="text" name="productCode"
										value="${list.productCode}">
									</div>
								</div><br>
								
								<div class="form-group">
									<label class="col-md-4 control-label" for="name">Product
										Image </label>
									<div class="col-md-8">
											<input type="file" name="productImage"
										value="${list.productImage}">
									</div>
								</div><br>
								
								<div class="form-group">
									<label class="col-md-4 control-label" for="name">Product
										Quantity </label>
									<div class="col-md-8">
											<input type="text" name="quantity"
										value="${list.quantity}">
									</div>
								</div><br>
								<div class="form-group">
									<label class="col-md-4 control-label" for="name">Product
										Price </label>
									<div class="col-md-8">
											<input type="text" name="productPrice"
										value="${list.productPrice}">
									</div>
								</div><br>
								<div class="form-group">
									<label class="col-md-4 control-label" for="name">Product
										Warranty </label>
									<div class="col-md-8">
											<input type="text" name="productWarranty"
										value="${list.productWarranty}">
									</div>
								</div><br>
								<div class="form-group">
									<label class="col-md-4 control-label" for="name">Product
										Description </label>
									<div class="col-md-8">
											<input type="text" name="productDescription"
										value="${list.productDescription}">
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