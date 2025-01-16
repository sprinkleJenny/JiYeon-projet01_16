package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDao {
	public Connection getConnection() throws Exception{
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "user1001";
			String pw = "pass1234";
			
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(url, id, pw);
			return conn;
	}
	
	//loginCheck(id, pw) : 로그인 체크 기능
	//파라미터 id : 입력한 id값
	//파라미터 pw : 입력한 pw값
	public boolean loginCheck(String id, String pw) throws Exception{
		String sql= "SELECT COUNT(*) FROM member1 WHERE id=? AND pw=?";
			
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		ResultSet rs = pstmt.executeQuery();
		boolean result = false;
		if(rs.next()) {
			result = rs.getInt(1)==1;
		}
			rs.close();
			pstmt.close();
			conn.close();
			
			return result;
	}
	public String nameCheck(String id) throws Exception{
		String sql="SELECT name FROM member1 WHERE id=?";
		
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		
		String name = null;
		if(rs.next()) {
			name = rs.getString("name");
			
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return name;
	}
	public static void main(String[] args) throws Exception {
		MemberDao dao = new MemberDao();
		System.out.println(dao.loginCheck("YG", "1234"));
		System.out.println(dao.loginCheck("MJ", "11"));
		
		System.out.println(dao.nameCheck("YG"));
		
	}
}
