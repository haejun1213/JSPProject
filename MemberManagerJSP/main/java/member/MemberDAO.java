package member;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {
	
	public int insertMember(Member member) {

		int result = 0;
		JDBConnection jdbc = new JDBConnection();

		String sql = new StringBuilder()
				.append("INSERT INTO MEMBER (NO, ID, PASSWORD, NICKNAME, REGDATE)")
				.append("VALUES (MEMBER_SEQ.NEXTVAL, ?, ?, ?, SYSDATE)").toString();

		try {
			// PreparedStatement 객체 생성
			jdbc.pstmt = jdbc.conn.prepareStatement(sql);

			// SQL문 매개변수에 값 추가
			jdbc.pstmt.setString(1, member.getId());
			jdbc.pstmt.setString(2, member.getPassword());
			jdbc.pstmt.setString(3, member.getNickname());

			// SQL문 실행
			result = jdbc.pstmt.executeUpdate();
			if (result > 0)
				System.out.println(result + "행이 추가되었습니다.");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		jdbc.close();
		return result;
	}
	
	public List<Member> selectAllMember() {
		
		List<Member> memberList = new ArrayList<>();
		
		JDBConnection jdbc = new JDBConnection();

		// sql문 만들기

		String sql = new StringBuilder()
				.append("SELECT *")
				.append("  FROM MEMBER").toString();

		try {
			// PreparedStatement 객체 생성
			jdbc.pstmt = jdbc.conn.prepareStatement(sql);

			// SQL문 실행
			jdbc.rs = jdbc.pstmt.executeQuery();

			while (jdbc.rs.next()) {
				memberList.add(new Member(
						jdbc.rs.getInt("NO"),
						jdbc.rs.getString("ID"),
						jdbc.rs.getString("PASSWORD"),
						jdbc.rs.getString("NICKNAME"),
						jdbc.rs.getDate("REGDATE")));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		jdbc.close();
		return memberList;
	
	}
	
	
	public Member selectMember(int no) {
		
		Member member = null;
		JDBConnection jdbc = new JDBConnection();

		// sql문 만들기
		String sql = new StringBuilder()
				.append("SELECT *")
				.append("  FROM MEMBER")
				.append(" WHERE NO = ?").toString();

		try {
			// PreparedStatement 객체 생성
			jdbc.pstmt = jdbc.conn.prepareStatement(sql);

			jdbc.pstmt.setInt(1, no);
			// SQL문 실행
			jdbc.rs = jdbc.pstmt.executeQuery();

			if (jdbc.rs.next()) {
				member = new Member(
						jdbc.rs.getInt("NO"),
						jdbc.rs.getString("ID"),
						jdbc.rs.getString("PASSWORD"),
						jdbc.rs.getString("NICKNAME"),
						jdbc.rs.getDate("REGDATE"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		jdbc.close();
		return member;
	}

	
	public Member selectMember(String id, String password) {
		
		Member member = null;
		JDBConnection jdbc = new JDBConnection();

		// sql문 만들기
		String sql = new StringBuilder()
				.append("SELECT *")
				.append("  FROM MEMBER")
				.append(" WHERE ID = ?")
				.append("   AND PASSWORD = ?").toString();

		try {
			// PreparedStatement 객체 생성
			jdbc.pstmt = jdbc.conn.prepareStatement(sql);

			jdbc.pstmt.setString(1, id);
			jdbc.pstmt.setString(2, password);
			// SQL문 실행
			jdbc.rs = jdbc.pstmt.executeQuery();

			if (jdbc.rs.next()) {
				member = new Member(
						jdbc.rs.getInt("NO"),
						jdbc.rs.getString("ID"),
						jdbc.rs.getString("PASSWORD"),
						jdbc.rs.getString("NICKNAME"),
						jdbc.rs.getDate("REGDATE"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		jdbc.close();
		return member;
	}
	
	public int updateMember(Member member) {

		int result = 0;
		JDBConnection jdbc = new JDBConnection();
	
		String sql = new StringBuilder()
				.append("UPDATE MEMBER")
				.append("   SET PASSWORD = ?, NICKNAME = ?")
				.append(" WHERE NO = ?").toString();

		try {
			// PreparedStatement 객체 생성
			jdbc.pstmt = jdbc.conn.prepareStatement(sql);

			jdbc.pstmt.setString(1, member.getPassword());
			jdbc.pstmt.setString(2, member.getNickname());
			jdbc.pstmt.setInt(3, member.getNo());
			
			// SQL문 실행
			result = jdbc.pstmt.executeUpdate();
			if (result > 0)
				System.out.println(result + "행이 수정되었습니다.");
			else
				System.out.println("해당하는 행을 찾을 수 없습니다.");
				
		} catch (SQLException e) {
			e.printStackTrace();	
		}
		
		jdbc.close();
		return result;
	}

	public int deleteMember(int no) {
		
		int result = 0;
		JDBConnection jdbc = new JDBConnection();
		
		String sql = new StringBuilder()
				.append("DELETE MEMBER")
				.append(" WHERE NO = ?").toString();
		
		try {
			jdbc.pstmt = jdbc.conn.prepareStatement(sql);
		
			jdbc.pstmt.setInt(1, no);
		
			result = jdbc.pstmt.executeUpdate();
			if(result > 0)
				System.out.println(result + "행이 삭제되었습니다.");
		
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		jdbc.close();
		return result;
	}

}
