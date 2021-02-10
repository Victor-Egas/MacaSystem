package com.ventas.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ventas.dao.PedidoDao;
import com.ventas.dao.Impl.PedidoDaoImpl;
import com.ventas.dto.DetallePedido;
import com.ventas.dto.Pedido;

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
		/*--- Inicio Conectando a ProductoDao ---*/
		PedidoDao pd=new PedidoDaoImpl();
		/*--- Fin Conectando a ProductoDao ---*/
		String accion=request.getParameter("accion");
		System.out.println("antes del switch");
		switch (accion) {
		/* Detalle del Pedido */
		case "listaDetalle":
			//int codigo=0;
			
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
			
			/*  Lista Por Codigo*/
			
		case "listarPorFiltro":
			//System.out.println("ListaCodigo");
			int codigo;
				if(!request.getParameter("codigo").equals("")) {
					codigo=Integer.parseInt(request.getParameter("codigo"));
			 }else {
				 codigo=0;
			 }
				
			String fecha=request.getParameter("fecha");
			try {
				
				List<Pedido> listaCodigo=pd.listaPorCodigo(codigo);
				System.out.println("codigo busqueda :"+codigo);
				request.setAttribute("codi", codigo);
				request.setAttribute("listaCodigo", listaCodigo);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("ERROR");
			}
			RequestDispatcher er=getServletContext().getRequestDispatcher("/Resumen.jsp");
    		er.forward(request, response);
			
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
