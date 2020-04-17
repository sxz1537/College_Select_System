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
	public ArrayList<College_inf> getAllCollege_inf() {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<College_inf> list = new ArrayList<College_inf>(); // 大学集合
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from college_inf;"; // sql语句
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				College_inf collinf = new College_inf();
				collinf.setCollege_id(rs.getInt("college_id"));
				collinf.setCollege_name(rs.getString("college_name"));
				collinf.setCollege_grade(rs.getInt("college_grade"));
				collinf.setCollege_location(rs.getString("college_location"));
				list.add(collinf); // 把大学信息加入集合
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
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

	// 根据ID获取学校详细信息
	public College_inf getFullInfById(int college_id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from college_inf where college_id=?;"; // sql语句
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, college_id);
			rs = stmt.executeQuery();
			if (rs.next()) {
				College_inf collinf = new College_inf();
				collinf.setCollege_id(rs.getInt("college_id"));
				collinf.setCollege_name(rs.getString("college_name"));
				collinf.setCollege_grade(rs.getInt("college_grade"));
				collinf.setCollege_location(rs.getString("college_location"));
				collinf.setCollege_desc(rs.getString("college_desc"));
				return collinf;
			} else {
				return null;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
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
	//条件选取大学信息
	public ArrayList<College_inf> getCollege_infByGrade(int college_grade) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int grade=college_grade;

		ArrayList<College_inf> list = new ArrayList<College_inf>(); // 大学集合
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from college_inf where college_grade <='"+grade+"'" ;  // sql语句
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				College_inf collinf = new College_inf();
				collinf.setCollege_id(rs.getInt("college_id"));
				collinf.setCollege_name(rs.getString("college_name"));
				collinf.setCollege_grade(rs.getInt("college_grade"));
				collinf.setCollege_location(rs.getString("college_location"));
				list.add(collinf); // 把大学信息加入集合
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
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

	
	/*
	 * public static void main(String[] args) // 测试查错 { String test1 = null; String
	 * test2 = null; int test3 = 0; int test4 = 0; College_infDAO colldao = new
	 * College_infDAO(); College_inf collfullinf = colldao.getFullInfById(2);
	 * test1=collfullinf.getCollege_location(); test2=collfullinf.getCollege_name();
	 * test3=collfullinf.getCollege_id(); test4=collfullinf.getCollege_grade();
	 * System.out.println(test1); System.out.println(test2);
	 * System.out.println(test3); System.out.println(test4); }
	 */
	 
}
