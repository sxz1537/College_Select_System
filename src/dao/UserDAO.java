package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import util.DBHelper;

public class UserDAO { 
	public boolean CheckUser(String Uname,String Upwd) {  //判断登录
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String name=Uname;
			String pwd=Upwd;
			String sql = "SELECT * FROM user WHERE name ='" + name + "'AND pwd = '" + pwd + "'";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			if (rs.next()) {
				return true;
			}else{
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}		
	}
	public boolean UserReg(String Uname,String Upwd) {  //用户注册
		Connection conn = null;
		PreparedStatement stmt = null;
		PreparedStatement pscheck = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String name=Uname;
			String pwd=Upwd;
			String sqlcheck="select * from user where name = '" + name + "'";
			pscheck=conn.prepareStatement(sqlcheck); //先判断数据库内是否有重名用户
			rs=pscheck.executeQuery();
			if(rs.next())   //先判断数据库内是否有重名用户
			{
				return false;	
			}
			else {
				String sql = "INSERT user(name,pwd) VALUES(?,?)"; //插入数据进行注册
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, name);
				stmt.setString(2, pwd);
				stmt.executeUpdate();
				return true;
			}
			
			} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

	}
	public static void main(String[] args) {
		UserDAO u=new UserDAO();
		Boolean isSuccess =u.UserReg("891","890");
		System.out.print(isSuccess);
	}
}
