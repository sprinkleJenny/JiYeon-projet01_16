package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.MemberDto;

public class MemberDao {
	public Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "user1001";
		String pw = "pass1234";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, id, pw);
		return conn;
	}
	
	//멤버 생성
	public void memberNew(String id, String pw, String name, int point) throws Exception{
		String sql = "INSERT INTO table1(id, pw, name, point)" + 
				" VALUES(?, ?, ?, ?)";
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2,  pw);
		pstmt.setString(3, name);
		pstmt.setInt(4, 1000);
		
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		
	}
	
	//로그인체크
	public boolean loginCheck(String id, String pw) throws Exception{
		String sql = "SELECT COUNT(*) " + 
					" FROM table1" + 
					" WHERE id=? AND pw=?";
		
System.out.println(id +", " +pw);
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		ResultSet rs = pstmt.executeQuery();
		boolean result = false;
		while(rs.next()) {
System.out.println("rs.getInt(1) : " + rs.getInt(1));
			result = rs.getInt(1)==1;
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
		
	}
	
	//회원가입- id 중복 체크
//	public boolean isIdCheck(String id) throws Exception{
//		String sql = "SELECT COUNT(*)" + 
//				" FROM table1" + 
//				" WHERE id=?";
//		
//		Connection conn = getConnection();
//		PreparedStatement pstmt = conn.prepareStatement(sql);
//		pstmt.setString(1, id);
//		
//		ResultSet rs = pstmt.executeQuery();
//		boolean rsid= false;
//		if(rs.next()) {
//			rsid = rs.getInt(1)==1;
//		}
//		rs.close();
//		pstmt.close();
//		conn.close();
//		
//		return rsid;
//		
//	}
	
	//회원 정보 - 상세보기
	public MemberDto getMemberDtoId(String id) throws Exception{
		String sql= "SELECT id, pw, name, point" + 
					" FROM table1" + 
					" WHERE id = ?";
		
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		MemberDto dto = null;
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			String pw = rs.getString("pw");
			String name = rs.getString("name");
			int point = rs.getInt("point");
			
			dto = new MemberDto(id, pw, name, point);
			
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return dto;
	}
	
	//회원정보 - 삭제
	public void deleteMemberById(String id) throws Exception{
		String sql = "DELETE FROM table1 WHERE id=?";
		
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	
	//회원정보 - 수정
	public void modiftMember(String id, String pw, String name, int point) throws Exception{
		String sql = "UPDATE table1 SET id=? ,pw=?, name=? , point=? WHERE id=?";
		
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		pstmt.setInt(4, point);
		
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	
	
	public static void main(String[] args) throws Exception{
		
		MemberDao dao = new MemberDao();
		
		
		//생성
//		dao.memberNew("jj", "1", "kim", 1000);
//		System.out.println("생성되었습니다.");
		
//		//로그인 체크
//		System.out.println(dao.loginCheck("admin", "a"));
		
		//조회
		String id = "jj";
		MemberDto dto = dao.getMemberDtoId(id);
		System.out.println(dto.getName() + ", " +dto.getPoint() );
		
		
		
	}

}
