package abc;

import java.sql.*;
import java.util.ArrayList;

public class DAO_backup {


	Connection conn;
	Statement state;
	ResultSet rs;


	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "c##kjs";
	String password = "123456";
	 //singleton pattern : 단 한개의 객체만을 가지고 구현(설계)한다.
	private static DAO_backup instance = new DAO_backup();
    public static DAO_backup getInstance() {
    	return instance;
    }
	public DAO_backup() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,user, password);
		} catch (ClassNotFoundException e) {

			System.out.println("클래스를 찾을 수 없습니다");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("SQL 접속 예외");
			e.printStackTrace();
		}
	}
	public int idCheck(ABCDTO userid) {
		int rst = 0;
		String sql = "select * from abc where userid ='%s'";
		sql=String.format(sql, userid.getUserid());
		
		System.out.println("아이디 확인 " + sql);
		try {
			state = conn.createStatement();
			rs = state.executeQuery(sql);
		
			  
			if(rs.next()) rst  = 1;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) 		rs.close();
				if(state != null)	state.close();
				if(conn != null)	conn.close();
			}catch(Exception e) {
				
			}
		}
		return rst;
		
			
		
	}
	
	
	public ArrayList<ABCDTO> abcshow(){
		
		ArrayList<ABCDTO> abc = new ArrayList<ABCDTO>();
		
		try {
			state = conn.createStatement();
			rs = state.executeQuery("select * from abc");
			
			
			while(rs.next()) {
				
				
				ABCDTO dto = new ABCDTO();
				dto.setUserid(rs.getString("userid"));
				dto.setUserpw(rs.getString("userpw"));
				dto.setUsername(rs.getString("username"));
				dto.setAge(rs.getString("age"));
				dto.setGender(rs.getString("gender"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress(rs.getString("address"));
				
				abc.add(dto);
				
			}
			return abc;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) 		rs.close();
				if(state != null)	state.close();
				if(conn != null)	conn.close();
			}catch(Exception e) {
				
			}
			
		}
		return null;
		
	}
	public ABCDTO selectabc(ABCDTO login) {
		
		String sql = "select * from abc where userid = '%s' and userpw ='%s'";
		sql=String.format(sql, login.getUserid(), login.getUserpw());
		
		
		System.out.println("SQL 구분 : " + sql);
		
		
		try {
			state = conn.createStatement();
			rs = state.executeQuery(sql);
			
			while(rs.next()){
				ABCDTO dto = new ABCDTO();
				dto.setUserid(rs.getString("USERID"));
				dto.setUserpw(rs.getString("USERPW"));
				dto.setUsername(rs.getString("USERNAME"));
				dto.setAge(rs.getString("AGE"));
				dto.setGender(rs.getNString("GENDER"));
				dto.setEmail(rs.getString("EMAIL"));
				dto.setAddress(rs.getString("ADDRESS"));
				
				return dto;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL 예외 발생");
		}
		finally {
			try {
				if(rs != null) 		rs.close();
				if(state != null)	state.close();
				if(conn != null)	conn.close();
			}catch(Exception e) {
				
			}
			
		}
		return null;
	}
	
	public int insertABC(ABCDTO join) {
		if(join.getUserid() == null) return 0;
		
		String sql = "insert into abc "
				+ "values('%s','%s','%s','%s','%s','%s','%s')";
		
		sql = String.format(sql,join.getUserid(),join.getUserpw(),join.getUsername(),join.getAge(),
				join.getGender(),join.getEmail(),join.getAddress());
		
		System.out.println("sql구문" + sql);
		try {
			state = conn.createStatement();
			int row = state.executeUpdate(sql);
			
			return row;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("sql문 에러~~!!!");
			e.printStackTrace();
		}finally {
			try {
				if(rs != null)		rs.close();
				if(state != null)	state.close();
				if(conn != null)	conn.close();
				
			}catch(Exception e) {
				 
				
			}
		}
		return 0;
	}
}
