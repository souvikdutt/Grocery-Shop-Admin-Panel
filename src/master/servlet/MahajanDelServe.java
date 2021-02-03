package master.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import master.DAO.MahajanDAO;
import master.DTO.MahajanBillDTO;

/**
 * Servlet implementation class MahajanDelServe
 */
public class MahajanDelServe extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String sdate=request.getParameter("sdate");
		String mid=request.getParameter("mid");
		
		MahajanBillDTO mbdto=new MahajanBillDTO();
		mbdto.setSdate(sdate);
		mbdto.setMid(mid);
		
		MahajanDAO mdao=new MahajanDAO();
		mdao.DelMahajanRiceBill(mbdto);
		response.sendRedirect("WelcomeMahajan.jsp");
	}

}
