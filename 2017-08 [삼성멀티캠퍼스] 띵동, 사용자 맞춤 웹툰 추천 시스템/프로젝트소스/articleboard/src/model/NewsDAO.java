package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class NewsDAO {

	public boolean insert(NewsVO vo) {
		boolean result = true;
		PreparedStatement pstmt = null;
		Connection conn = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "project", "project");
			pstmt = conn.prepareStatement("INSERT INTO NAVER VALUES (?, ?, ?, ?, ?)");
			// ID, TITLE, DAY, AUTHOR, COUNT, 

			pstmt.setInt(1, vo.getId());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getDay());
			pstmt.setString(4, vo.getAuthor());
			pstmt.setInt(5, vo.getCount());
			
			pstmt.executeUpdate();
					
		} catch (Exception e) {
			System.out.println("Insert 에러==" + e);
			result = false;
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				System.out.println("JDBC 연결 끊기 에러==" + e);
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	public boolean update(NewsVO vo) {
		boolean result = true;
		PreparedStatement pstmt = null;
		Connection conn = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "project", "project");
			pstmt = conn.prepareStatement("UPDATE NAVER SET TITLE=?, DAY=?, AUTHOR=?, COUNT=? WHERE ID=?");

			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getDay());
			pstmt.setString(3, vo.getAuthor());
			pstmt.setInt(4, vo.getCount());
			
			pstmt.executeUpdate();
					
		} catch (Exception e) {
			System.out.println("Update 에러==" + e);
			result = false;
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				System.out.println("JDBC 연결 끊기 에러==" + e);
				e.printStackTrace();
			}
		}
		
		return result;
	}

	public boolean delete(int id) {
		boolean result = true;
		PreparedStatement pstmt = null;
		Connection conn = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "project", "project");
			pstmt = conn.prepareStatement("DELETE FROM NEWS WHERE ID=?");
			pstmt.setInt(1, id);
			
			pstmt.executeUpdate();			
		} catch (Exception e) {
			System.out.println("Update 에러==" + e);
			result = false;
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				System.out.println("JDBC 연결 끊기 에러==" + e);
				e.printStackTrace();
			}
		}
		
		return result;
	}

	public ArrayList<NewsVO> listAll() {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Connection conn = null;
		ArrayList<NewsVO> list = new ArrayList<NewsVO>();

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "project", "project");
			pstmt = conn.prepareStatement("SELECT ID,TITLE, DAY, AUTHOR, COUNT FROM NAVER ORDER BY TITLE DESC");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				NewsVO vo = new NewsVO();

				vo.setId(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setDay(rs.getString(3));
				vo.setAuthor(rs.getString(4));
				vo.setCount(rs.getInt(5));

				list.add(vo);
			}
		} catch (Exception e) {
			System.out.println("ListAll 에러==" + e);
			return null;
		} finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();
			} catch (Exception e) {
				System.out.println("JDBC 연결 끊기 에러==" + e);
				e.printStackTrace();
			}
		}

		return list;
	}

	public NewsVO listOne(int id) {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Connection conn = null;
		NewsVO vo = new NewsVO();

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "project", "project");
			pstmt = conn.prepareStatement("SELECT ID,TITLE, DAY, AUTHOR, COUNT FROM NAVER WHERE ID=?");
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				vo.setTitle(rs.getString(1));
				vo.setDay(rs.getString(2));
				vo.setAuthor(rs.getString(3));
				vo.setCount(rs.getInt(4));
			}
			
			/*조회수 늘리기*/
			pstmt = conn.prepareStatement("UPDATE NAVER SET COUNT = COUNT+1 WHERE ID=?");
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
					
		} catch (Exception e) {	
			System.out.println("ListOne 에러==" + e);
			return null;
		} finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();
			} catch (Exception e) {
				System.out.println("JDBC 연결 끊기 에러==" + e);
				e.printStackTrace();
			}
		}
		
		return vo;
	}



}
