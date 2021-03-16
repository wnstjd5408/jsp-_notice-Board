package abc;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DAO {

	private Context init;
	private DataSource ds;
	private Connection conn;
	private Statement state;
	private ResultSet rs;


	 //singleton pattern : 단 한개의 객체만을 가지고 구현(설계)한다.
	private static DAO instance = new DAO();
    public static DAO getInstance() {
    	return instance;
    }
	public DAO() {
	
			try {
				init = (Context)new InitialContext();
				ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
			} catch (NamingException e) {
				// TODO Auto-generated catch block
				System.out.println("생성자 예외 : " + e.getMessage());
				e.printStackTrace();
			}
			
	}
	public void close() {
		try {
			if(rs != null) rs.close();
			if(state != null)state.close();
			if(conn != null)conn.close();
		}catch(Exception e) {
			
		}	
	}
	
	public int idCheck(ABCDTO userid) {
		int rst = 0;
		String sql = "select * from abc where userid ='%s'";
		sql=String.format(sql, userid.getUserid());
		
		System.out.println("아이디 확인 " + sql);
		try {
			conn = ds.getConnection();
			state = conn.createStatement();
			rs = state.executeQuery(sql);
		
			  
			if(rs.next()) rst  = 1;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return rst;
		
			
		
	}

	
	public ArrayList<ABCDTO> abcshow(){
		
		ArrayList<ABCDTO> abc = new ArrayList<ABCDTO>();
		
		try {
			conn = ds.getConnection();
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
			
				close();
		}
		return null;
		
	}
	
	
	
	public ABCDTO selectabc(ABCDTO login) {
		
		String sql = "select * from abc where userid = '%s' and userpw ='%s'";
		sql=String.format(sql, login.getUserid(), login.getUserpw());
		
		
		System.out.println("SQL 구분 : " + sql);
		
		
		try {
			conn = ds.getConnection();
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
			close();
			
		}
		return null;
	}
	
	
//	public int selectone(String id , String pw) {
//		String sql = "select userpw from abc where userid = %s";
//		sql = String.format(sql,id);
//		try {
//			conn = ds.getConnection();
//			state = conn.prepareStatement(sql);
//			rs = state.executeQuery(sql);
//			
//			if(rs.next()) {
//				if(rs.getString(1).equals(pw)) {
//					return 1;
//				}else {
//					return 0;
//				}
//			}
//			return -1; // 아이디가 없음
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return -2; // 데이터베이스에 오류
//		
//		
//	}
	
	public int insertABC(ABCDTO join) {
		if(join.getUserid() == null) return 0;
		
		String sql = "insert into abc "
				+ "values('%s','%s','%s','%s','%s','%s','%s')";
		
		sql = String.format(sql,join.getUserid(),join.getUserpw(),join.getUsername(),join.getAge(),
				join.getGender(),join.getEmail(),join.getAddress());
		
		System.out.println("sql구문" + sql);
		try {
			conn = ds.getConnection();
			state = conn.createStatement();
			int row = state.executeUpdate(sql);
			
			return row;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("sql문 에러~~!!!");
			e.printStackTrace();
		}finally {
			close();
		}
		return 0;
	}
}
