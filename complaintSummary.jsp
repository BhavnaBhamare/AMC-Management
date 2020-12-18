
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
					<b>Complaint Summary</b>
				</div>

				<div style="color: #00b300; text-align: center; font-size: 15px;">${empadd}</div>
				<%
					session.removeAttribute("empadd");
				%>

				<div class="panel-body">
					<form class="form-horizontal" action="ComplaintSearch"
						method="post">
						<fieldset>
	

							<div class="form-group">
								<label class="col-md-2 control-label" for="name">From
									Date </label>
								<div class="col-md-3">
									<input id="name" name="fdate" type="date" class="form-control">
								</div>


								<label class="col-md-3 control-label" for="name">To Date</label>
								<div class="col-md-3">
									<input id="name" name="tdate" type="date" placeholder="Date"
										class="form-control">

								</div>

							</div>

							<div class="col-sm-04"></div>
							<div class="col-sm-04">

								<div class="form-group">
									<div class="col-md-6 widget-right">
										<button type="submit"
											class="btn btn-default btn-md pull-right">Search
											Summary</button>
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