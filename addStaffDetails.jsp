<%@ include file="PayRollHeader.jsp"%>

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
					<b>Add Employee Details</b>
				</div>
				
				<div style="color: #00b300; text-align: center; font-size: 15px;">${empadd}</div>
			   <%
				session.removeAttribute("empadd");
			   %>
				
				<div class="panel-body">
					<form class="form-horizontal" action="AddStaffController"
						method="post" enctype="multipart/form-data">
						<fieldset>

							
							<!-- Name input-->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">First
									Name</label>
								<div class="col-md-6">
									<input id="name" name="fname" type="text"
										placeholder="Avinash" class="form-control">
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Last Name
									</label>
								<div class="col-md-6">
									<input id="name" name="lname" type="text"
										placeholder="Patil" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Email Id</label>
								<div class="col-md-6">
									<input id="name" name="email" type="text" placeholder="Avi@gmail.com"
										class="form-control">
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Phone No</label>
								<div class="col-md-6">
									<input id="name" name="phno" type="text"
										placeholder="+91-9970113773" class="form-control">
								</div>
							</div>
							
							<!-- Name input-->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Gender
									</label>
								<div class="col-md-4">
									<select name="gender" class="form-control">
										<option>Male</option>
										<option>Female</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Employee
									Image</label>
								<div class="col-md-6">
									<input id="name" name="eimage" type="file" class="form-control">
								</div>
							</div>

							<!-- Form actions -->
							<div class="col-sm-04"></div>
							<div class="col-sm-04">
								<div class="form-group">
									<div class="col-md-6 widget-right">
											<input type="submit" value="Add Details" class="btn btn-default btn-md pull-right">
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