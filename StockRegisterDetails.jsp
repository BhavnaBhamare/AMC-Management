<%@page import="com.pojo.Productgroup"%>
<%@page import="java.util.List"%>
<%@page import="com.model.BLManager"%>
<%@ include file="StockHeader.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	BLManager bl=new BLManager();
List<Productgroup> l=bl.searchProductGroupList();
session.setAttribute("list", l);
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
						<b>Stock Register Details</b>
					</div>

					<div style="color: #00b300; text-align: center; font-size: 15px;">${empadd}</div>
					<%
						session.removeAttribute("empadd");
					%>

					<div class="panel-body">
						<form action="StockDetailsController" method="post"
							class="form-horizontal">
							<fieldset>
								<div class="form-group">
									<label class="col-md-3 control-label" for="name">Select
										Product Group Name </label>
									<div class="col-md-6">
										<select name="productGroupName" onclick="getstate(this.value)">
											<option>select product group</option>
											<c:forEach items="${list}" var="l">

												<option>${l.productGroupName}</option>

											</c:forEach>


										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label" for="name">Product
										InStock</label>
									<div class="col-md-6">
										<select name="instock" id="state_div"
											onclick="get(this.value)">
											<option>select instock</option>


										</select>
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-3 control-label" for="name">Product
										outstock </label>
									<div class="col-md-6">
										<select name="outstock" id="outstock_div" onclick="">
											<option>select outstock</option>


										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label" for="name">Product
										Remaining Stock</label>
									<div class="col-md-6">
										<input type="text" name="remainingstock">



									</div>
								</div>

								<div class="form-group">

									<div class="col-md-5 widget-right">
										<input type="submit" value="Add Stock Details" name="flag"
											style="background-color: aqua"
											class="btn btn-default btn-md pull-right">
									</div>

									<div class="col-md-2 widget-right">
										<input type="submit" value="View Stock Details" name="flag"
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
<script type="text/javascript">
	function getXMLHTTP()

	{
		var xmlhttp = false;

		xmlhttp = new XMLHttpRequest();

		return xmlhttp;
	}

	function getstate(pname) {

		var strURL = "findInStock.jsp?productGroupName=" + pname;
		var req = getXMLHTTP();

		if (req) {

			req.onreadystatechange = function() {
				if (req.readyState == 4) {

					if (req.status == 200) {
						document.getElementById('state_div').innerHTML = req.responseText;

					}
				}
			}
		}

		req.open("GET", strURL, true);
		req.send();
	}

	function getstate1(pname) {

		var strURL = "findOutStock.jsp?productGroupName=" + pname;
		var req = getXMLHTTP();

		if (req) {

			req.onreadystatechange = function() {
				if (req.readyState == 4) {

					if (req.status == 200) {
						document.getElementById('outstock_div').innerHTML = req.responseText;
					}
				}
			}
		}

		req.open("GET", strURL, true);
		req.send();
	}
</script>





</html>