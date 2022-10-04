package com.alexandre.crudjspjava.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.alexandre.crudjspjava.bean.UsuarioBean;

public class UsuarioDao {
	
	public static Connection getConnection() {
		Connection con = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/crudjspjava", "root", "");
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}
	
	public static List<UsuarioBean> getAllUsuarios(){
		List<UsuarioBean> list = new ArrayList<UsuarioBean>();
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM usuario");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				UsuarioBean usuario = new UsuarioBean();
				usuario.setId(rs.getInt("id"));
				usuario.setNome(rs.getString("nome"));
				usuario.setSobrenome(rs.getString("sobrenome"));
				usuario.setEmail(rs.getString("email"));
				usuario.setSexo(rs.getString("sexo"));
				usuario.setPais(rs.getString("pais"));
				list.add(usuario);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
	
	public static UsuarioBean getUsuarioById(int id) {
		UsuarioBean usuario = null;
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM usuario WHERE id = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				usuario = new UsuarioBean();
				usuario.setId(rs.getInt("id"));
				usuario.setNome(rs.getString("nome"));
				usuario.setSobrenome(rs.getString("sobrenome"));
				usuario.setEmail(rs.getString("email"));
				usuario.setSexo(rs.getString("sexo"));
				usuario.setPais(rs.getString("pais"));
			}
		}catch (Exception e) {
			System.out.println(e);
		}
		return usuario;
	}
	
	public static int insertUsuario(UsuarioBean u) {
		int status = 0;
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(
					"INSERT INTO usuario (nome, sobrenome, email, sexo, pais) VALUES (?,?,?,?,?)"
			);
			ps.setString(1, u.getNome());
			ps.setString(2, u.getSobrenome());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getSexo());
			ps.setString(5, u.getPais());
			status = ps.executeUpdate();
			
		}catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int updateUsuario(UsuarioBean u) {
		int status = 0;
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(
					"UPDATE usuario SET nome=?, sobrenome=?, email=?, sexo=?, pais=? WHERE id = ?"
			);
			ps.setString(1, u.getNome());
			ps.setString(2, u.getSobrenome());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getSexo());
			ps.setString(5, u.getPais());
			ps.setInt(6, u.getId());
			status = ps.executeUpdate();
			
		}catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int deleteUsuario(UsuarioBean u) {
		int status = 0;
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(
					"DELETE FROM usuario WHERE id = ?"
			);
			ps.setInt(1, u.getId());
			status = ps.executeUpdate();
			
		}catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static List<UsuarioBean> getRecords(int start, int total){
		List<UsuarioBean> list = new ArrayList<UsuarioBean>();
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(
					"DELETE FROM usuario LIMIT "+(start)+", "+total
			);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				UsuarioBean usuario = new UsuarioBean();
				usuario.setId(rs.getInt("id"));
				usuario.setNome(rs.getString("nome"));
				usuario.setSobrenome(rs.getString("sobrenome"));
				usuario.setEmail(rs.getString("email"));
				usuario.setSexo(rs.getString("sexo"));
				usuario.setPais(rs.getString("pais"));
				list.add(usuario);
			}
			con.close();
		}catch (Exception e) {
			System.out.println(e);
		}
		
		return list;
	}
}