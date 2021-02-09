package com.ventas.dto;

public class DetallePedido {
	String nombre_producto,nombre_usuario;
	int cantidad_pro_pedido;
	double subtotal_pro_pedido,precio_producto;
	
	
	
	
	
	public DetallePedido(String nombre_producto, String nombre_usuario, int cantidad_pro_pedido,
			double subtotal_pro_pedido, double precio_producto) {
		super();
		this.nombre_producto = nombre_producto;
		this.nombre_usuario = nombre_usuario;
		this.cantidad_pro_pedido = cantidad_pro_pedido;
		this.subtotal_pro_pedido = subtotal_pro_pedido;
		this.precio_producto = precio_producto;
	}
	
	public String getNombre_producto() {
		return nombre_producto;
	}
	public void setNombre_producto(String nombre_producto) {
		this.nombre_producto = nombre_producto;
	}
	public String getNombre_usuario() {
		return nombre_usuario;
	}
	public void setNombre_usuario(String nombre_usuario) {
		this.nombre_usuario = nombre_usuario;
	}
	public int getCantidad_pro_pedido() {
		return cantidad_pro_pedido;
	}
	public void setCantidad_pro_pedido(int cantidad_pro_pedido) {
		this.cantidad_pro_pedido = cantidad_pro_pedido;
	}
	public double getSubtotal_pro_pedido() {
		return subtotal_pro_pedido;
	}
	public void setSubtotal_pro_pedido(double subtotal_pro_pedido) {
		this.subtotal_pro_pedido = subtotal_pro_pedido;
	}
	public double getPrecio_producto() {
		return precio_producto;
	}
	public void setPrecio_producto(double precio_producto) {
		this.precio_producto = precio_producto;
	}
	
	
	

}
