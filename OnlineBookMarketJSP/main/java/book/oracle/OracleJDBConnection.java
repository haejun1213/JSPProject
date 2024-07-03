package book.oracle;

import java.sql.DriverManager;
import java.sql.SQLException;

import book.JDBConnection;

public class OracleJDBConnection extends JDBConnection {
	public OracleJDBConnection() {

		final String jdbcDriverClassName = "oracle.jdbc.OracleDriver";
		final String url = "jdbc:oracle:thin:@localhost:1521:xe";
		final String userid = "c##java";
		final String passwd = "1234";

		try {
			Class.forName(jdbcDriverClassName);

			conn = DriverManager.getConnection(url, userid, passwd);
			System.out.println("Oracle DB Connection Success");

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} 

	}
}
