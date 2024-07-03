package cart;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import book.JDBConnection;
import book.oracle.OracleJDBConnection;

public class OracleCartDAO implements CartDAO {

	@Override
	public int insert(CartItem item) {

		int result = 0;
		JDBConnection jdbc = new OracleJDBConnection();
		
		String sql = new StringBuilder("INSERT INTO CART")
				.append(" (ID, MEMBER_NO, BOOK_ID, QUANTITY, REGDATE)")
				.append(" VALUES (CART_SEQ.NEXTVAL, ?, ?, ?, SYSDATE)").toString();
		
		try {
			jdbc.pstmt = jdbc.conn.prepareStatement(sql);

			jdbc.pstmt.setInt(1, item.getMemberNo());
			jdbc.pstmt.setInt(2, item.getBookId());
			jdbc.pstmt.setInt(3, item.getQuantity());
			
			result = jdbc.pstmt.executeUpdate();
			System.out.println("Insert : " + result + "행");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		jdbc.close();
		return result;
	}

	@Override
	public CartItem select(int cartId, int memberNo) {
		CartItem item = null;
		JDBConnection jdbc = new OracleJDBConnection();
		
		String sql = new StringBuilder("SELECT *")
					 		   .append("  FROM CART")
					 	       .append(" WHERE ID = ?")
					 	       .append("   AND WHERE MEMBER_NO = ?").toString();
		
		try {
			jdbc.pstmt = jdbc.conn.prepareStatement(sql);

			jdbc.pstmt.setInt(1, cartId);
			jdbc.pstmt.setInt(2, memberNo);

			
			jdbc.rs = jdbc.pstmt.executeQuery();
			
			if(jdbc.rs.next()) {
				item = new CartItem(jdbc.rs.getInt("ID"),
						jdbc.rs.getInt("MEMBER_NO"),
						jdbc.rs.getInt("BOOK_ID"),
						jdbc.rs.getInt("QUANTITY"),
						jdbc.rs.getDate("REGDATE"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		jdbc.close();
		return item;
	}

	@Override
	public CartItem selectByBookId(int memberNo, int bookId) {
		CartItem item = null;
		JDBConnection jdbc = new OracleJDBConnection();
		
		String sql = new StringBuilder("SELECT *")
					 		   .append("  FROM CART")
					 	       .append(" WHERE MEMBER_NO = ?")
					 	       .append("   AND BOOK_ID = ?").toString();
		
		try {
			jdbc.pstmt = jdbc.conn.prepareStatement(sql);

			jdbc.pstmt.setInt(1, memberNo);
			jdbc.pstmt.setInt(2, bookId);

			
			jdbc.rs = jdbc.pstmt.executeQuery();
			
			if(jdbc.rs.next()) {
				item = new CartItem(jdbc.rs.getInt("ID"),
						jdbc.rs.getInt("MEMBER_NO"),
						jdbc.rs.getInt("BOOK_ID"),
						jdbc.rs.getInt("QUANTITY"),
						jdbc.rs.getDate("REGDATE"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		jdbc.close();
		return item;
	}
	

	@Override
	public List<CartItem> selectAll(int memberNo) {
		
		
		List<CartItem> itemList = new ArrayList<>();
		JDBConnection jdbc = new OracleJDBConnection();
		
		String sql = new StringBuilder("SELECT *")
							  .append("   FROM CART")
							  .append("  WHERE MEMBER_NO = ?").toString();
		
		try {
			jdbc.pstmt = jdbc.conn.prepareStatement(sql);

			jdbc.pstmt.setInt(1, memberNo);

			
			jdbc.rs = jdbc.pstmt.executeQuery();
			
			while(jdbc.rs.next()) {
				itemList.add(new CartItem(jdbc.rs.getInt("ID"),
						jdbc.rs.getInt("MEMBER_NO"),
						jdbc.rs.getInt("BOOK_ID"),
						jdbc.rs.getInt("QUANTITY"),
						jdbc.rs.getDate("REGDATE")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		jdbc.close();
		return itemList;
	}

	@Override
	public int update(int cartId, int memberNo, int quantity) {
		
		int result = 0;
		
		JDBConnection jdbc = new OracleJDBConnection();
		
		String sql = new StringBuilder("UPDATE CART")
				  .append(" SET QUANTITY = ?")
				  .append("  WHERE MEMBER_NO = ?")
				  .append("    AND ID = ?").toString();
		
		
		try {
			
			jdbc.pstmt = jdbc.conn.prepareStatement(sql);
			
			jdbc.pstmt.setInt(1, quantity);
			jdbc.pstmt.setInt(2, memberNo);
			jdbc.pstmt.setInt(3, cartId);
			
			result = jdbc.pstmt.executeUpdate();
			System.out.println("Update : " + result + "행");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		jdbc.close();
		return result;
	}

	@Override
	public int delete(int cartId, int memberNo) {
		int result = 0;
		JDBConnection jdbc = new OracleJDBConnection();

		String sql = new StringBuilder()
				.append("DELETE CART")
				.append(" WHERE ID = ?")
				.append(" AND MEMBER_NO = ?").toString();

		try {
			jdbc.pstmt = jdbc.conn.prepareStatement(sql);

			jdbc.pstmt.setInt(1, cartId);
			jdbc.pstmt.setInt(2, memberNo);

			result = jdbc.pstmt.executeUpdate();
			if (result > 0)
				System.out.println(result + "행이 삭제되었습니다.");

		} catch (SQLException e) {
			e.printStackTrace();
		}

		jdbc.close();
		return result;
	}

	@Override
	public int deleteAll(int memberNo) {
		int result = 0;
		JDBConnection jdbc = new OracleJDBConnection();

		String sql = new StringBuilder()
				.append("DELETE CART")
				.append(" WHERE MEMBER_NO = ?").toString();

		try {
			jdbc.pstmt = jdbc.conn.prepareStatement(sql);

			jdbc.pstmt.setInt(1, memberNo);

			result = jdbc.pstmt.executeUpdate();
			if (result > 0)
				System.out.println(result + "행이 삭제되었습니다.");

		} catch (SQLException e) {
			e.printStackTrace();
		}

		jdbc.close();
		return result;
	}

}
