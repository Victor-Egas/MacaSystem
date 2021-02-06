package com.ventas.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoguinServlet
 */
@WebServlet("/Loguin")
public class LoguinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoguinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
	
		String usuario= request.getParameter("usuario");
		String clave= request.getParameter("clave");
		String mensaje="CLAVE INCORRECTA";
		System.out.println("Entro servlet");
		if(usuario.equalsIgnoreCase("administrador") && clave.equalsIgnoreCase("administrador")) {
			 
			response.sendRedirect("Carrito.jsp");
		}
		
		else {
			
			request.setAttribute("msj", mensaje);
			response.sendRedirect("Loguin.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Hola get");
		doGet(request, response);
	}

}
