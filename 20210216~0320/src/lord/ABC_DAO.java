package lord;

import java.sql.*;
import java.util.ArrayList;

public class ABC_DAO {

	private Connection conn;
	private Statement state;
	private ResultSet rs;
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "c##kjs";
	String password = "123456";

	
	public ABC_DAO() {
		// TODO Auto-generated constructor stub
		
		
		
			try {
				Class.forName(driver);
				conn = DriverManager.getConnection(url,user,password);
			} catch (ClassNotFoundException e) {
				System.out.println("드라이버 로딩 예외 : " + e.getMessage());
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("SQL 접속 예외 : " + e.getMessage());
				e.printStackTrace();
			}
			
			
	}
	
	public void close(){
		
		try {
			if(rs != null)	 		rs.close();
			if(state != null)	state.close();
			if(conn != null)	conn.close();
		}catch(Exception e) {
			
		}
	}
	public ArrayList<ABC_DTO> show(){
		String sql = "select * from abc";
		ArrayList<ABC_DTO> ary = new ArrayList<ABC_DTO>();
		
		
		try {
			state = conn.createStatement();
			rs = state.executeQuery(sql);
			
			
			while(rs.next()) {
				
				ABC_DTO dto = new ABC_DTO();

				
				
				dto.setAddress(rs.getNString("address"));
				dto.setUserid(rs.getString("userid"));
				dto.setUserpw(rs.getString("userpw"));
				dto.setUsername(rs.getString("username"));
				dto.setAge(rs.getString("age"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress(rs.getString("address"));
				dto.setGender(rs.getString("gender"));
				
				ary.add(dto);
			}
			return ary;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
	
	
	return null;
	
}
}
