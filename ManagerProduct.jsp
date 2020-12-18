
<%@page import="com.pojo.Managesupplier"%>
<%@page import="com.pojo.Productgroup"%>
<%@page import="java.util.List"%>
<%@page import="com.model.BLManager"%>
<%@ include file="StockHeader.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
BLManager bl=new BLManager();
List<Productgroup> l=bl.searchProductGroupList();
List<Managesupplier> l1=bl.searchSuplierList();
session.setAttribute("list", l);

session.setAttribute("list1", l1);

%>
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
			   <%
				session.removeAttribute("empadd");
			   %>
				
				<div class="panel-body">
					<form class="form-horizontal" action="AddProductServlet"
						method="post" enctype="multipart/form-data">
						<fieldset>

							
							<div class="form-group">
								<label class="col-md-3 control-label" for="productName">Product  Name
									</label>
								<div class="col-md-4">
									<input type="text" name="productName" placeholder="Livpure Magna 11 Litres"  class="form-control">
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Select Product Group Name
									</label>
								<div class="col-md-4">
									<select name="productGroupName" class="form-control">
									<c:forEach items="${sessionScope.list}" var="l">
										<option>${l.productGroupName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Select Suplier Name
									</label>
								<div class="col-md-4">
									<select name="suplierName" class="form-control">
									<c:forEach items="${sessionScope.list1}" var="l">
										<option>${l.suplierName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						
							<div class="form-group">
								<label class="col-md-3 control-label" for="productCode">Product  code
									</label>
								<div class="col-md-4">
									<input type="text" name="productCode" placeholder="Product_01"  class="form-control">
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-md-3 control-label" for="productImage">Product  Image
									</label>
								<div class="col-md-4">
									<input type="file" name="productImage"   class="form-control">
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-md-3 control-label" for="productStock">Product  Stock
									</label>
								<div class="col-md-4">
									<input type="text" name="productStock" placeholder="1/2/3"  class="form-control">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label" for="productPrice">Product  Price
									</label>
								<div class="col-md-4">
									<input type="text" name="productPrice" placeholder="/Rs.200000"  class="form-control">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label" for="productWarranty">Product  Warranty
									</label>
								<div class="col-md-4">
									<input type="text" name="productWarranty" placeholder="9 months"  class="form-control">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label" for="productDescription">Product  Description
									</label>
								<div class="col-md-4">
									<input type="text" name="productDescription" placeholder="productDescription"  class="form-control">
								</div>
							</div>
							<!-- Form actions -->
							<div class="col-sm-04"></div>
							<div class="col-sm-04">
								<!-- <div class="form-group">
									<div class="col-md-6 widget-right">
											<input type="submit" value="Add Product " class="btn btn-default btn-md pull-right">
									</div>
								</div> -->
								
									<div class="form-group">
									<div class="col-md-5 widget-right">
										<input type="submit" value="Add Product " name="flag"
											style="background-color: aqua"
											class="btn btn-default btn-md pull-right">
									</div>

									<div class="col-md-2 widget-right">
										<input type="submit" value="View Product " name="flag"
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
</div>
<!--/.main-->