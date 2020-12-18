package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.model.BLManager;
import com.pojo.Productgroup;

/**
 * Servlet implementation class DeleteProductServlet
 */
@WebServlet("/DeleteProductGroup")
public class DeleteProductGroup extends HttpServlet {
	
	BLManager bl=new BLManager();
	Productgroup pg=new Productgroup();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteProductGroup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		int productGroupId=Integer.parseInt(request.getParameter("productGroupId"));
		pg=bl.searchbyProductGroupId(productGroupId);
		
		
		bl.deleteProductGroup(pg);
		out.print("<script type=\"text/javascript\">");
		out.print("alert('Record deleted');");
		out.print("location='ViewProductGroup.jsp';");
		out.print("</script>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
