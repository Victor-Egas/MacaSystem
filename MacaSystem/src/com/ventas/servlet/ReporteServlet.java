package com.ventas.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ventas.dao.PedidoDao;
import com.ventas.dao.Impl.PedidoDaoImpl;
import com.ventas.dto.DetallePedido;

/**
 * Servlet implementation class ReporteServlet
 */
@WebServlet("/ReporteServlet")
public class ReporteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReporteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String accion=request.getParameter("accion");
		System.out.println("antes del switch");
		switch (accion) {
		
		case "listaDetalle":
			//int codigo=0;
			PedidoDao pd=new PedidoDaoImpl();
			System.out.println("entro mi servlet");
			try {
				List<DetallePedido> listadetalle= pd.listaDetalle(1);
				request.setAttribute("listaDetalle", listadetalle);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			response.sendRedirect("Resumen.jsp");
			break;

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
