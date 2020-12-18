
<%@page import="com.pojo.Managesupplier"%>
<%@page import="com.pojo.Productgroup"%>
<%@page import="java.util.List"%>
<%@page import="com.model.BLManager"%>
<%@ include file="StockHeader.jsp"%>
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
					<b>Manage Product </b>
				</div>

				<div style="color: #00b300; text-align: center; font-size: 15px;">${empadd}</div>
				

				<div class="panel-body">
					<form class="form-horizontal" action="UpdateSupplier"
						method="post" enctype="">
						<fieldset>


							<div class="form-group">
								<label class="col-md-3 control-label" for="suplierName">Enter
									Supplier Name </label>
								<div class="col-md-4">
									<input type="text" name="supplierName" value="${list.suplierName}" placeholder="Enter Name"
										class="form-control">
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-3 control-label" for="supplierAddress">Enter
									Supplier Address </label>
								<div class="col-md-4">
									<input type="text" name="supplierAddress" value="${list.suplierAddress}"
										placeholder="Enter Address" class="form-control">
								</div>

							</div>
							<div class="form-group">
								<label class="col-md-3 control-label" for="supplierContact">Enter
									Supplier Contact </label>
								<div class="col-md-4">
									<input type="text" name="supplierContact" value="${list.supplierContact}"
										placeholder="Enter Contact Details" class="form-control">
								</div>

							</div>

							<div class="form-group">
								<label class="col-md-3 control-label" for="supplierEmail">Enter
									Supplier Email ID </label>
								<div class="col-md-4">
									<input type="text" name="supplierEmail"  value="${list.supplierEmail}"
										placeholder="Enter Email_Id" class="form-control">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Select
									Product Group Name </label>
								<div class="col-md-4">
								<input type="text" name="productGroupName" value="${list.productgroup.productGroupName}" readonly="readonly">
									
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-3 control-label" for="totalAmount">Enter
									Total Amount </label>
								<div class="col-md-4">
									<input type="text" name="totalAmount" value="${list.totalAmount}" placeholder="Enter Total Amount"
										class="form-control">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label" for="paidAmount">Enter
									Paid Amount </label>
								<div class="col-md-4">
									<input type="text" name="paidAmount" value="${list.paidAmount}"
										placeholder="Enter Paid Amount" class="form-control">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label" for="purchaseDate">Enter
									Purchase Date </label>
								<div class="col-md-4">
									<input type="date" name="purchaseDate" value="${list.purchaseDate}"
										placeholder="Enter Purchase Date" class="form-control">
								</div>
							</div>

							<!-- Form actions -->
							<div class="col-sm-04"></div>
							<div class="col-sm-04">
								<div class="form-group">
									<div class="col-md-6 widget-right">
										<input type="submit" value="Add Product "
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