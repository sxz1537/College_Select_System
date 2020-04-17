package dao;
//文章阅读业务逻辑类

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entity.Essay;
import util.DBHelper;

public class EssayDAO {
	// 获得文章信息
	public ArrayList<Essay> getAllEssay() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<Essay> list = new ArrayList<Essay>(); // 大学集合
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from essay;"; // sql语句
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Essay e = new Essay();
				e.setEssay_id(rs.getInt("essay_id"));
				e.setEssay_title(rs.getString("essay_title"));
				e.setEssay_link(rs.getString("essay_link"));
				list.add(e); // 把大学信息加入集合
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

//	public static void main(String[] args) // 测试查错
//	{
//		int id = 0;
//		String title = null;
//		String link = null;
//		EssayDAO ed = new EssayDAO();
//		ArrayList<Essay> list = ed.getAllEssay();
//		if (list != null && list.size() > 0) {
//			for (int i = 0; i < list.size(); i++) {
//				Essay essay = list.get(i);
//				id = essay.getEssay_id();
//				title = essay.getEssay_title();
//				link = essay.getEssay_link();
//				System.out.println(id);
//				System.out.println(title);
//				System.out.println(link);
//			}
//		}
//	}
}