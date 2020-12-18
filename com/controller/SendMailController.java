package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.BLManager;
import com.model.Emailutil;
import com.pojo.Complaint;


@WebServlet("/SendMailController")
public class SendMailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	BLManager bl=new BLManager();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out = response.getWriter();
		String bid=request.getParameter("comid");
		int id=Integer.parseInt(bid);
		
		Complaint c=bl.serachbycomid(id);
		
		String email=c.getCustomer().getEmail();
		
		String info1="Your Complaint Has been Registered successfully. Our Employee Will contact U soon";
		
		ServletContext context = getServletContext();
		String host = context.getInitParameter("host");
		String port = context.getInitParameter("port");
		String user = context.getInitParameter("user");
		String pass = context.getInitParameter("pass");
		System.out.println(host + "   " + port + "    " + user + "   " + pass + "   " + email + "    " + info1);

		try {
			Emailutil.sendEmail1(host, port, user, pass, email, info1);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		out.println("<script type=\"text/javascript\">");
		out.println("alert('Request Send successfully...');");
		out.println("location='sendEmailComplaint.jsp"+ "';");
		out.println("</script>");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
