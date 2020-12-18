<%@page import="com.pojo.Customer"%>
<%@page import="com.pojo.Manageproduct"%>
<%@page import="java.util.List"%>
<%@page import="com.model.BLManager"%>
<%@ include file="AMCHeader.jsp"%>
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

	<%
		BLManager bl = new BLManager();
		List<Manageproduct> m = bl.serachproductlist();
		session.setAttribute("pro", m);

		List<Customer> m1 = bl.serachcustlist();
		session.setAttribute("cust", m1);
	%>


	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<b>Add Quatation</b>
				</div>

				<div style="color: #00b300; text-align: center; font-size: 15px;">${empadd}</div>
				<%
					session.removeAttribute("empadd");
				%>

				<div class="panel-body">
					<form class="form-horizontal" action="AddAMCQuatation"
						method="post">
						<fieldset>



							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Select
									Product Name </label>
								<div class="col-md-4">
									<select name="pname" class="form-control">
										<c:forEach items="${sessionScope.pro}" var="l">
											<option>${l.productName}</option>
										</c:forEach>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Select
									Customer Name </label>
								<div class="col-md-4">
									<select name="cname" class="form-control">
										<c:forEach items="${sessionScope.cust}" var="l">
											<option>${l.cname}</option>
										</c:forEach>
									</select>
								</div>
							</div>


							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Select
									Tax Type </label>
								<div class="col-md-3">
									<select name="taxtype" class="form-control">
										<option>Customs</option>
										<option>Service</option>
										<option>PF</option>

									</select>
								</div>
							</div>


							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Tax
									Percentage </label>
								<div class="col-md-3">
									<input id="name" name="taxpec" type="text" placeholder="10%"
										class="form-control">
								</div>
							</div>



							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Quatation
									Date </label>
								<div class="col-md-3">
									<input id="name" name="qdate" type="date" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Valid
									Till </label>
								<div class="col-md-3">
									<input id="name" name="validdate" type="date"
										class="form-control">
								</div>
							</div>

							
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Unit
									Price </label>
								<div class="col-md-3">
									<input id="name" name="price" type="text" placeholder="1,500"
										class="form-control">
								</div>
							</div>
							<div class="col-sm-04"></div>
							<div class="col-sm-04">
								<div class="form-group">
									<div class="col-md-5 widget-right">
										<input type="submit" value="Add Quatation" name="flag"
											style="background-color: aqua"
											class="btn btn-default btn-md pull-right">
									</div>

									<div class="col-md-2 widget-right">
										<input type="submit" value="View Quatation" name="flag"
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