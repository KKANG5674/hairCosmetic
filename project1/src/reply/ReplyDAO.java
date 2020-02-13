package reply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import notice.NoticeDTO;
import semiProject.JdbcDAO;

public class ReplyDAO extends JdbcDAO  {
    private static ReplyDAO _dao;

    private ReplyDAO() {
        // TODO Auto-generated constructor stub
    }

    public static ReplyDAO getDAO() {
        if (_dao == null) {
            _dao = new ReplyDAO();
        }
        return _dao;
    }
    
    //답변등록하기
    public int addReply(ReplyDTO reply) {
        Connection con = null;
        PreparedStatement pstmt = null;
        int rows = 0;
        try {
            con = getConnection();

            String sql = "insert into replytable values(?,?,?,'관리자',sysdate)";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, reply.getReplyNo());
            pstmt.setString(2, reply.getContent());
            pstmt.setInt(3, reply.getParents());

            rows = pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("[에러] addReply() 메소드의 SQL 오류" + e.getMessage());
        } finally {
            close(con, pstmt);
        }
        return rows;
    }
    
    //parents 불러오기
    public int getParents(int num) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int rows = 0;
        
        try {
            con = getConnection();

            String sql = "select parents from replytable where parents=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                rows = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("[에러] addReply() 메소드의 SQL 오류" + e.getMessage());
        } finally {
            close(con, pstmt, rs);
        }
        return rows;
    }
    
    
    
    //답변번호를전달받아 답변에 넣을 다른 정보 불러오기
    public ReplyDTO getReplyNo (int num) {
    	 Connection con = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         ReplyDTO reply=null;
		/* int rows=0; */
         
         try {
        	 
        	 con=getConnection();
        	
        	 String sql="select id,dateCreated,content from replytable where parents=?";
        	 pstmt=con.prepareStatement(sql);
        	 pstmt.setInt(1, num);
        	
        	 rs=pstmt.executeQuery();
        	
        	 if(rs.next()) {
        		 reply=new ReplyDTO();
        		 reply.setReplyNo(num);
        		 reply.setId(rs.getString("id"));
        		 reply.setDateCreated(rs.getString("dateCreated"));
        		 reply.setContent(rs.getString("content"));
        	 }
        	 
         }catch (Exception e) {
        	 System.out.println("[에러] getReplyNo() 메소드의 SQL 오류" + e.getMessage());
		}finally {
			close(con, pstmt, rs);
		}
		/* return rows; */
         return reply;
    }
    
    //
}
