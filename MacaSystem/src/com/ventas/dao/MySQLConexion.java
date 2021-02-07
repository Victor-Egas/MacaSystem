package com.ventas.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLConexion {
	
	public static Connection getConexion() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			String url = "jdbc:mysql://localhost/db_macafood?useTimezone=true&serverTimezone=UTC";
			
			String usr = "root";
			String psw = "F4cund03g4s.";
			
			con = DriverManager.getConnection(url, usr, psw);
			
		} catch (ClassNotFoundException ex) {
			System.out.println("Error >> Driver no Instalado!!");
		} catch (SQLException ex) {
			System.out.println("Error >> de conexión con la BD");
			
		}catch (Exception e) {
			System.out.println("Error >>"+ e.getMessage()); // TODO: handle exception
		}
		return con;
	}

}
