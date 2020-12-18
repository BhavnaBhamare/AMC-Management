
<%@page import="com.pojo.Manageincoming"%>
<%@page import="com.pojo.Managesupplier"%>
<%@page import="com.pojo.Productgroup"%>
<%@page import="java.util.List"%>
<%@page import="com.model.BLManager"%>
<%@ include file="StockHeader.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	BLManager bl = new BLManager();
	List<Productgroup> l = bl.searchProductGroupList();
	List<Manageincoming> l1 = bl.searchManageIncomingList();
	session.setAttribute("list", l);

	session.setAttribute("list1", l1);
%>


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
						<b>Stock Outgoing Details</b>
					</div>

					<div style="color: #00b300; text-align: center; font-size: 15px;">${empadd}</div>

					<div class="panel-body">
						<form action="StockManageutgoing" method="post"
							class="form-horizontal">
							<fieldset>
								<div class="form-group">
									<label class="col-md-3 control-label" for="name">Select
										Product Group Name </label>
									<div class="col-md-6">
										<select name="productGroupName">
											<c:forEach items="${list}" var="l">

												<option>${l.productGroupName}</option>

											</c:forEach>


										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label" for="name">OutStock
									</label>
									<div class="col-md-6">
										<input type="text" name="outstock">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label" for="name">
										Outstock Date :-</label>
									<div class="col-md-6">
										<input type="date" name="outstockdate">
									</div>
								</div>
							
								<div class="form-group">
									
									<div class="col-md-5 widget-right">
										<input type="submit" value="Add Outcome" name="flag"
											style="background-color: aqua"
											class="btn btn-default btn-md pull-right">
									</div>

									<div class="col-md-2 widget-right">
										<input type="submit" value="View Outcome" name="flag"
											style="background-color: aqua"
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