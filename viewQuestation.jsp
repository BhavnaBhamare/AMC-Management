<%@page import="com.pojo.Quatation"%>
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
		List<Quatation> m = bl.serachquatationlist();
		session.setAttribute("pro", m);
	
	%>


	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<b>Search Quatation</b>
				</div>

				<div style="color: #00b300; text-align: center; font-size: 15px;">${empadd}</div>
				<%
					session.removeAttribute("empadd");
				%>

				<div class="panel-body">
					<form class="form-horizontal" action="GenerateQuatation"
						method="post">
						<fieldset>
                                	<div class="form-group">
								<label class="col-md-3 control-label" for="name">Select
									Product Name </label>
								<div class="col-md-4">
									<select name="pname" class="form-control">
										<c:forEach items="${sessionScope.pro}" var="l">
											<option>${l.manageproduct.productName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
                                <div class="col-sm-04">
								<div class="form-group">
									<div class="col-md-5 widget-right">
										<input type="submit" value="Gerenare Quetation"
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