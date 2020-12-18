package com.controller;

import java.io.File;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.model.BLManager;
import com.pojo.Employee;

@WebServlet("/AddStaffController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 100, // 10MB
maxRequestSize = 1024 * 1024 * 500)
public class AddStaffController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String SAV_DIR = "D://NewProject/MehataProject/WebContent/eimage";
   
	BLManager bl=new BLManager();
	Employee emp=new Employee();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String phno = request.getParameter("phno");
		String gender = request.getParameter("gender");
		
		int empid=(int)(Math.random()*9000)+1000;
		
		
		Part img = request.getPart("eimage");

		try 
		{
			String Image1 = extractFileName(img);
			emp.setProfileimage(Image1);
			img.write(SAV_DIR + File.separator + Image1);
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		
		emp.setFname(fname);
		emp.setLname(lname);
		emp.setEmail(email);
		emp.setPhone(phno);
		emp.setGender(gender);
		emp.setEmployeeId(empid);
		
		
		bl.saveemployee(emp);
		
        String m="Employee Added successfully";
		HttpSession session=request.getSession();
		session.setAttribute("empadd", m);
		
		response.sendRedirect("addStaffDetails.jsp");
		
		
	}
	private String extractFileName(Part img) 
	{
		String contentDisp = img.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";
	}

}
