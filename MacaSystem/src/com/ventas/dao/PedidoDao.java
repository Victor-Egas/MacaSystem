package com.ventas.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.ventas.dto.Pedido;

public interface PedidoDao {

	public List<Pedido> listaPedido() throws SQLException;
}
