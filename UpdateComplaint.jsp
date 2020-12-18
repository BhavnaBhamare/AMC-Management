<%@page import="com.pojo.Complaint"%>

<%@ include file="CallHeader.jsp"%>
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
					<b>Update Complaint</b>
				</div>

				<div style="color: #00b300; text-align: center; font-size: 15px;">${empadd}</div>
				<%
					session.removeAttribute("empadd");
				%>

				<div class="panel-body">
					<form class="form-horizontal" action="ComplaintUpdate"
						method="post">
						<fieldset>
							<!-- Name input-->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Customer
									Name</label>
								<div class="col-md-4">
									<input  name="cname" type="text"
										value="${comp.customer.cname}" class="form-control"
										readonly="readonly">
								</div>
							</div>



							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Assign
									To</label>
								<div class="col-md-4">

									<input name="ename" type="text"
										value="${comp.employee.fname}" class="form-control"
										readonly="readonly">

								</div>
							</div>

							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Status</label>
								<div class="col-md-4">
									<select name="status" class="form-control">
										<option>Registered</option>
										<option>Processing</option>
										<option>Resolved</option>
										<option>Can't Resolved</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Problem
								</label>
								<div class="col-md-4">
									<input name="problem" type="text"
										value="${comp.problem}" class="form-control"
										readonly="readonly">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Complaint
									Date</label>
								<div class="col-md-4">
									<input name="sdate" type="date"
										value="${comp.statusdate}" class="form-control"
										readonly="readonly">
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Extra
									Cost</label>
								<div class="col-md-4">
									<input name="expense" type="text"
										value="${comp.expense}" class="form-control"
										readonly="readonly">
								</div>
							</div>

							<!-- Form actions -->
							<div class="col-sm-04"></div>
							<div class="col-sm-04">

								<div class="form-group">
									<div class="col-md-6 widget-right">
										<!-- <button type="submit"
											class="btn btn-default btn-md pull-right">Update
											Complaint</button> -->
											<input type="submit" value="Update Complaint" class="btn btn-default btn-md pull-right">
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