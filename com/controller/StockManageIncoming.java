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

/**
 * Servlet implementation class StockManageIncoming
 */
@WebServlet("/StockManageIncoming")
public class StockManageIncoming extends HttpServlet {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
		String flag = request.getParameter("flag");

		if (flag.equals("Add Income")) {
			String productGroupName = request.getParameter("productGroupName");
			pg = bl.searchbyproductGroupName(productGroupName);
			String suplierName = request.getParameter("suplierName");
			ms = bl.searchbysupplierName(suplierName);
			
			int instock = Integer.parseInt(request.getParameter("instock"));
			
			String instockdate1 = request.getParameter("instockdate");
			Date instockdate=Date.valueOf(instockdate1);

			mi.setProductgroup(pg);
			mi.setManagesupplier(ms);
			mi.setInstock(instock);
			mi.setInstockdate(instockdate);

			bl.saveStockincoming(mi);
			
			String m="Stock Added successfully";
			HttpSession session=request.getSession();
			session.setAttribute("empadd", m);
			
			response.sendRedirect("stockManageIncoming.jsp");
			
		} else if (flag.equals("View Income")) 
		{
			response.sendRedirect("ViewStockIncome.jsp");
		}
	}

}
