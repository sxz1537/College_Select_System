package dao;
//大学业务逻辑类

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entity.College;
import util.DBHelper;

public class CollegeDAO {
	// 获得大学信息
	public ArrayList<College> getAllCollege() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<College> list = new ArrayList<College>(); // 大学集合
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from college;"; // sql语句
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				College coll = new College();
				coll.setCollege_id(rs.getInt("college_id"));
				coll.setCollege_name(rs.getString("college_name"));
				coll.setCollege_grade(rs.getInt("college_grade"));
				coll.setCollege_location(rs.getString("college_location"));
				list.add(coll); // 把大学信息加入集合
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
			if (ps != null) {
				try {
					ps.close();
					ps = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	// 根据ID获取学校详细信息
	public College getFullInfById(int college_id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from college where college_id=?;"; // sql语句
			ps = conn.prepareStatement(sql);
			ps.setInt(1, college_id);
			rs = ps.executeQuery();
			if (rs.next()) {
				College coll = new College();
				coll.setCollege_id(rs.getInt("college_id"));
				coll.setCollege_name(rs.getString("college_name"));
				coll.setCollege_grade(rs.getInt("college_grade"));
				coll.setCollege_location(rs.getString("college_location"));
				coll.setCollege_desc(rs.getString("college_desc"));
				return coll;
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
			if (ps != null) {
				try {
					ps.close();
					ps = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

	}

	// 条件选取大学信息
	public ArrayList<College> getCollegeByGrade(int college_grade) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int grade = college_grade;

		ArrayList<College> list = new ArrayList<College>(); // 大学集合
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from college where college_grade <='" + grade + "'"; // sql语句
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				College coll = new College();
				coll.setCollege_id(rs.getInt("college_id"));
				coll.setCollege_name(rs.getString("college_name"));
				coll.setCollege_grade(rs.getInt("college_grade"));
				coll.setCollege_location(rs.getString("college_location"));
				list.add(coll); // 把大学信息加入集合
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
			if (ps != null) {
				try {
					ps.close();
					ps = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	public Boolean addCollege(College coll) { //添加学校函数
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "INSERT INTO college ( `college_name`, `college_grade`, `college_location`, `college_desc`) VALUES (?,?,?,?);"; // sql语句
		try {
			conn = DBHelper.getConnection();
			ps = conn.prepareStatement(sql);
//			ps.setInt(1, coll.getCollege_id());  //无需设置id
			ps.setString(1, coll.getCollege_name());
			ps.setInt(2, coll.getCollege_grade());
			ps.setString(3, coll.getCollege_location());
			ps.setString(4, coll.getCollege_desc());
			int n = ps.executeUpdate();// 数据库更新操作
			return true;
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
			if (ps != null) {
				try {
					ps.close();
					ps = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	public Boolean updateCollege(College coll) { //更新学校函数
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "update college set college_name=?,college_grade=?,college_location=?,college_desc=? where college_id=?;"; // sql语句
		try {
			conn = DBHelper.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, coll.getCollege_name());
			ps.setInt(2, coll.getCollege_grade());
			ps.setString(3, coll.getCollege_location());
			ps.setString(4, coll.getCollege_desc());
			ps.setInt(5, coll.getCollege_id());  //无需设置id
			int n = ps.executeUpdate();// 数据库更新操作
			return true;
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
			if (ps != null) {
				try {
					ps.close();
					ps = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	
	
	
	public Boolean delCollege(int coll_id) { //删除学校函数
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "delete from college where college_id=?;"; // sql语句
		try {
			conn = DBHelper.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, coll_id); 
//			ps.setString(1, coll.getCollege_name());
//			ps.setInt(2, coll.getCollege_grade());
//			ps.setString(3, coll.getCollege_location());
//			ps.setString(4, coll.getCollege_desc());
			int n = ps.executeUpdate();// 数据库更新操作
			return true;
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
			if (ps != null) {
				try {
					ps.close();
					ps = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

//	public static void main(String[] args) // 测试add
//	{
//		College c=new College();
//		c.setCollege_name("野鸡大学");
//		c.setCollege_grade(555);
//		c.setCollege_location("台湾省");
//		c.setCollege_desc("这是野鸡大学");
//		CollegeDAO colldao = new CollegeDAO();
//		boolean isSuccess = colldao.addCollege(c);
//		System.out.print(isSuccess);
//	}
	
//	public static void main(String[] args) // 测试update
//	{
//		College c=new College();
//		c.setCollege_id(97);
//		c.setCollege_name("野鸡大学666");
//		c.setCollege_grade(565);
//		c.setCollege_location("台湾");
//		c.setCollege_desc("这是野鸡大学666");
//		CollegeDAO colldao = new CollegeDAO();
//		boolean isSuccess = colldao.updateCollege(c);
//		System.out.print(isSuccess);
//	}	

//	public static void main(String[] args) // 测试del
//	{
//		
//		CollegeDAO colldao = new CollegeDAO();
//		boolean isSuccess = colldao.delCollege(95);
//		System.out.print(isSuccess);
//	}
}
