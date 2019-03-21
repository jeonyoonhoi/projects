package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MdcdDAO {

	//전체 리스트 보는 함수
	public ArrayList<TextVO> listUp(){
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Connection conn =null;
		ArrayList<TextVO> list = new ArrayList<TextVO>();
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","project");
			pstmt = conn.prepareStatement("SELECT ID,TITLE,DAY,AUTHOR,COUNT,IMG_URL,TEXT FROM NAVER");
			rs =pstmt.executeQuery();
			
			while(rs.next()){
				TextVO vo = new TextVO();
				
				vo.setId(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setDay(rs.getString(3));
				vo.setAuthor(rs.getString(4));
				vo.setCount(rs.getInt(5));
				vo.setImg_url(rs.getString(6));
				vo.setText(rs.getString(7));
				
				list.add(vo);
			}
		}catch(Exception e){
			System.out.println("listUp에러 == "+e);
			return null;
		}finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();
			}catch(Exception e){
				System.out.println("JDBC 연결끊기 에러 =="+ e);
				e.printStackTrace();
			}
		}
	return list;
	}
	
	//내가 좋아요 한 것들 보는 함수
	public LikeVO MyListUp(String userId){
		ResultSet rs = null;
		PreparedStatement pstmt = null ;
		Connection conn = null;
		LikeVO vo = new LikeVO();
		
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","project");
			pstmt = conn.prepareStatement("SELECT  TITLE,AUTHOR,COUNT FROM LIKELIST USERID = ?");
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			 //TITLE,AUTHOR,COUNT
			while (rs.next()) {
				vo.setTitle(rs.getString(1));
				vo.setAuthor(rs.getString(2));
				vo.setCount(rs.getInt(3));
			}
		} catch(Exception e){
			System.out.println("MyListUp 에러 == "+e);
			return null;
			
		} finally {
			try{
				pstmt.close();
				rs.close();
				conn.close();
			}catch (Exception e){
				System.out.println("JDBC 연결 끊기 에러 == " +e);
				e.printStackTrace();
			}
		}
		return vo;
		}

	public boolean insert(LikeVO vo){
		boolean result = true;
		PreparedStatement pstmt = null;
		Connection conn = null;
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc : oracle : thin:@local:1521:xe ","project" ,"project");
			pstmt = conn.prepareStatement("INSERT INTO LIKELIST VALUES (?,?,?,?,?)");
			//ID,TITLE,AUTHOR,COUNT, USERID
			pstmt.setInt(1, vo.getId());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getAuthor());
			pstmt.setInt(4, vo.getCount());
			pstmt.setString(5, vo2.getUserId());
			
			pstmt.executeUpdate();
		}catch (Exception e){
			System.out.println("insert에러=="+e);
			result= false;
		}finally{
			try{
				pstmt.close();
				conn.close();
			}catch(Exception e){
				System.out.println("JDBC 연결 끊기 에러= "+e);
				e.printStackTrace();
			}
		}
		return result;
		
	}

	
	
}

