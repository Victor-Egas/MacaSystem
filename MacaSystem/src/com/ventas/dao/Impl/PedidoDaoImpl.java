package com.ventas.dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ventas.dao.PedidoDao;
import com.ventas.dto.Pedido;

import com.ventas.dao.MySQLConexion;




public class PedidoDaoImpl implements PedidoDao {
	
	@Override
	public List<Pedido> listaPedido() throws SQLException {
		List<Pedido> lista = new ArrayList<>();
	       
		
	       
        ResultSet rs = null; // tipo de resultado
		Connection con = null;
		PreparedStatement pst = null;
		
		 con =MySQLConexion.getConexion(); 
		   String sql = "SELECT * FROM db_macafood.tb_pedido "; // sentencia sql
		   pst = con.prepareStatement(sql);
		   // parámetros según la sentencia		
		   
		   System.out.println("entro  a impl");
		   rs = pst.executeQuery();
		   
        while (rs.next()) {
            Pedido registro = new Pedido(rs.getInt("codigo_pedido"),
            							 rs.getString("fecha_pedido"),
            		                     rs.getDouble("monto_pedido"), 
            		                     rs.getInt("codigo_usuario"));
            lista.add(registro);
        }
        System.out.println("selectos");
   //     MySQLConexion.getConexion().close();

        return lista;
	}

}
