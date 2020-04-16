package dao;
//大学业务逻辑类

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entity.College_inf;
import util.DBHelper;

public class College_infDAO {
	// 获得大学信息
	public ArrayList<College_inf> getAllCollege_inf()
	{
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<College_inf> list = new ArrayList<College_inf>(); // 大学集合
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from college_inf;"; // sql语句
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) 
				{
					College_inf coll = new College_inf();
					coll.setCollege_id(rs.getInt("college_id"));
					coll.setCollege_name(rs.getString("college_name"));
					coll.setCollege_grade(rs.getInt("college_grade"));
					coll.setCollege_location(rs.getString("college_location"));
					list.add(coll); // 把大学信息加入集合
				}
			return list;
			} 
		catch (Exception e) {
			e.printStackTrace();
			return null;
		} 
		finally { 
			// 释放数据集对象
			if(rs!=null) {
			try {
				rs.close();
				rs = null;
			} catch (Exception e) {
				e.printStackTrace();
			}
			}
			// 释放语句对象
			if(stmt!=null) {
			try {
				stmt.close();
				stmt = null;
				} catch (Exception e) {
				e.printStackTrace();
			}
			}
		}
	}
	
	
	public static void main(String[] args) {  //测试查错
		String test=null;
		College_infDAO colldao = new College_infDAO();
		ArrayList<College_inf> list = colldao.getAllCollege_inf();
		if(list!=null&&list.size()>0)
		{
			
		for(int i=0;i<list.size();i++){
			College_inf collf=list.get(i);
			test=collf.getCollege_name();
			System.out.println(test);
		
		
		} 
		}

	}
}
