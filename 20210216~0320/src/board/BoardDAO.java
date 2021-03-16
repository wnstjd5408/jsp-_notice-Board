package board;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

public class BoardDAO {
	
	private Context init;
	private DataSource ds;
	private Connection conn;
	private Statement state;
	private ResultSet rs;
	
	
	
	public BoardDAO() {
		
	
		try {
			init = (Context)new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			System.out.println("생성자 예외" + e.getMessage());
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
	
	
	public ArrayList<BoardDTO> selectAll(){
		String sql = "select * from board order by idx desc";
		ArrayList<BoardDTO> ary = new ArrayList<BoardDTO>();
		
		
		try {
			conn = ds.getConnection();
			state = conn.createStatement();
			rs = state.executeQuery(sql);
			
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				
				dto.setContent(rs.getNString("content"));
				dto.setCreationDate(rs.getDate("creationDate"));
				dto.setIdx(rs.getInt("idx"));
				dto.setIpaddr(rs.getNString("ipaddr"));
				dto.setTitle(rs.getString("title"));
				dto.setViewCount(rs.getInt("viewCount"));
				dto.setWriter(rs.getString("writer"));
				
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
	
	
	public BoardDTO selectOne(int idx) {
		String sql ="select * from board where idx= " + idx;
		
		
		try {
			conn =ds.getConnection();
			state = conn.createStatement();
			rs = state.executeQuery(sql);
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				
				dto.setContent(rs.getString("content"));
				dto.setCreationDate(rs.getDate("creationDate"));
				dto.setIdx(rs.getInt("idx"));
				dto.setIpaddr(rs.getString("ipaddr"));
				dto.setTitle(rs.getString("title"));
				dto.setViewCount(rs.getInt("viewCount"));
				dto.setWriter(rs.getString("writer"));
				
				return dto;
				
			}
			
			
		} catch (SQLException e) {
			System.out.println("SQL 예외" + e.getMessage());
			e.printStackTrace();
		}finally {
			close();
		}
		
		return null;
	}
	
	public int deleteBoard(int idx) {
		String sql = "delete from board where idx =" + idx;
		
		try {
			conn = ds.getConnection();
			state = conn.createStatement();
			int row = state.executeUpdate(sql);
			
			return row;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return 0;
		
		
	}
	public int insertBoard(BoardDTO dto) {
		String  sql="insert into board(content, ipaddr,title, writer)"
				+"values('%s',%s','%s','%s')";
		
		sql=String.format(sql,dto.getContent(),dto.getIpaddr(), dto.getTitle(),dto.getWriter());
		
		
		
		try {
			conn = ds.getConnection();
			state = conn.createStatement();
			
			int row = state.executeUpdate(sql);
			int idx = row == 1 ? selectMaxIdx() : 0;
			
			
			return idx;
		} catch (SQLException e){
			System.out.println("SQL 예외" + e.getMessage());
			e.printStackTrace();
		}finally {
			close();
		}
		
		return 0;
	}
	
	
	public int selectMaxIdx() {
		
		
		String sql = "select max(idx) from board";
		
		
		try {
			conn =ds.getConnection();
			state =conn.createStatement();
			rs = state.executeQuery(sql);
			
			
			while(rs.next()) {
				return rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.out.println("SQL 예외 :" + e.getMessage());
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		
		return 0;
	}
	
	public int updateBoard(BoardDTO dto) {
		String sql = "update board set title='%s', writer='%s',"
				+ "content='%s' where idx = " + dto.getIdx();
		
		
		sql = String.format(sql, dto.getTitle(),dto.getWriter(), dto.getContent());
		
		try {
			
			conn = ds.getConnection();
			state = conn.createStatement();
			
			int row = state.executeUpdate(sql);
			
			return row;
		}catch(SQLException e) {
			System.out.println("SQL 구문 예외 : " + e.getMessage());
			e.printStackTrace();
		}finally {
			close();
		}
		return 0;
		
	}
}
	

