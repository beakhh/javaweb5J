package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conn.GetConn;

public class MemberDAO {
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	private MemberVO vo = null;
	
	public MemberDAO() {
		String url = "jdbc:mysql://localhost:3306/javaweb5";
		String user = "root";
		String password = "1234";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색 실패~~~");
		} catch (SQLException e) {
			System.out.println("Database 연동 실패~~~");
		}
	}
//사용한 객체의 반납(해제)
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
	
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
				pstmtClose();
			} catch (SQLException e) {}
		}
	}
	// 아이디 중복체크
	public String getMemberMidCheck(String mid) {
		String res = "0";
		try {
			sql = "select * from B_member where mid = ?";
			pstmt = conn.prepareStatement(sql);
		  pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				res = "1";
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return res;
	}
	
	// 닉네임 중복체크
	public String getMemberNickCheck(String nickName) {
		String res = "0";
		try {
			sql = "select * from B_member where nickName = ?";
			pstmt = conn.prepareStatement(sql);
		  pstmt.setString(1, nickName);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				res = "1";
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return res;
	}
	public int setMemberJoinOk(MemberVO vo) {
		int res1 = 0;
		try {
			sql="insert into member values (default,?,?,?,?,default,?,?,?,?,?,default,?,default,default,default,default,default,default,default,default,?)";
			
			
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res1;
	}
}
