package com.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.BLManager;
import com.pojo.Manageincoming;
import com.pojo.Manageoutgoing;
import com.pojo.Managesupplier;
import com.pojo.Productgroup;
import com.pojo.Stockdetails;

@WebServlet("/StockDetailsController")
public class StockDetailsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	BLManager bl = new BLManager();
	Stockdetails sd = new Stockdetails();
	Manageincoming mi = new Manageincoming();
	Manageoutgoing mo = new Manageoutgoing();
	Productgroup pg = new Productgroup();
    Managesupplier ms=new Managesupplier();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String flag = request.getParameter("flag");

		if (flag.equals("Add Stock Details")) {
			String productGroupName = request.getParameter("productGroupName");
			pg = bl.searchbyproductGroupName(productGroupName);
		
			int instock = Integer.parseInt(request.getParameter("instock"));
			mi=bl.searchincoming(instock);
			
			int outstock = Integer.parseInt(request.getParameter("instock"));
			mo=bl.searchoutcoming(outstock);
			int remainingstock = Integer.parseInt(request.getParameter("remainingstock"));
		
			sd.setProductgroup(pg);
			sd.setManageincoming(mi);
			sd.setManageoutgoing(mo);
			sd.setRemainingstock(remainingstock);
			
			bl.Stockdetails1(sd);
			
			String m="Stock Added successfully";
			HttpSession session=request.getSession();
			session.setAttribute("empadd", m);
			
			response.sendRedirect("StockRegisterDetails.jsp");
			
		} else if (flag.equals("View Stock Details")) 
		{
			response.sendRedirect("ViewStockDetails.jsp");
		}
	}

}
