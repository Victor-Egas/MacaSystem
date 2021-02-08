package com.ventas.dto;

public class Pedido {

	String fecha_pedido;
	double monto_pedido;
	int codigo_usuario, codigo_pedido;
	
	
	
	
	
	public Pedido(int codigo_pedido,String fecha_pedido, double monto_pedido, int codigo_usuario) {
		super();
		this.codigo_pedido= codigo_pedido;
		this.fecha_pedido = fecha_pedido;
		this.monto_pedido = monto_pedido;
		this.codigo_usuario = codigo_usuario;
	}
	
	
	
	public int getCodigo_pedido() {
		return codigo_pedido;
	}
	public void setCodigo_pedido(int codigo_pedido) {
		this.codigo_pedido = codigo_pedido;
	}
	public String getFecha_pedido() {
		return fecha_pedido;
	}
	public void setFecha_pedido(String fecha_pedido) {
		this.fecha_pedido = fecha_pedido;
	}
	public double getMonto_pedido() {
		return monto_pedido;
	}
	public void setMonto_pedido(double monto_pedido) {
		this.monto_pedido = monto_pedido;
	}
	public int getCodigo_usuario() {
		return codigo_usuario;
	}
	public void setCodigo_usuario(int codigo_usuario) {
		this.codigo_usuario = codigo_usuario;
	}
	
	
	
}
