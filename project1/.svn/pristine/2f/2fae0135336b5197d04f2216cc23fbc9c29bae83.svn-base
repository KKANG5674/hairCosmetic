package notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import semiProject.JdbcDAO;

//DAO 클래스 : 데이타 저장소를 이용하여 데이타 삽입,삭제,변경,검색 기능을 제공하는 클래스

public class NoticeDAO extends JdbcDAO {
    private static NoticeDAO _dao;

    private NoticeDAO() {
        // TODO Auto-generated constructor stub
    }

    public static NoticeDAO getDAO() {
        if (_dao == null) {
            _dao = new NoticeDAO();
        }
        return _dao;
    }

    // NOTICE 테이블에 저장된 전체 게시글의 갯수를 검색하여 반환하는 메소드
    public int getNoticeTotal(String search, String keyword) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int rows = 0;
        try {
            con = getConnection();

            if (keyword.equals("")) {// 검색 기능 미사용
                String sql = "select count(*) from noticetable where title!='삭제글'";
                pstmt = con.prepareStatement(sql);
            } else {// 검색 기능 사용
                // 컬럼명을 저장한 Java 변수는 InParameter로 사용 불가능
                
                String sql="select count(*) from noticetable where "+search+" like '%'||?||'%' and title!='삭제글'";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, keyword);
            }

            rs = pstmt.executeQuery();

            if (rs.next()) {
                rows = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("[에러] getNoticeTotal() 메소드의 SQL 오류");
        } finally {
            close(con, pstmt, rs);
        }
        return rows;
    }

    // 페이징 처리
    public List<NoticeDTO> getNoticeList(int startRow, int endRow, String search, String keyword) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<NoticeDTO> noticeList = new ArrayList<NoticeDTO>();
        try {
            con = getConnection();

            if (keyword.equals("")) {
                String sql = "select * from (select rownum rn, temp.* from (select * from noticetable where title!='삭제글' order by num desc) temp) where rn between ? and ?";
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, startRow);
                pstmt.setInt(2, endRow);
            } else {
                String sql = "select * from (select rownum rn, temp.* from (select * from noticetable where " + search
                        + " like '%'||?||'%' and title!='삭제글'order by num desc) temp) where rn between ? and ?";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, keyword);
                pstmt.setInt(2, startRow);
                pstmt.setInt(3, endRow);
            }

            rs = pstmt.executeQuery();

            while (rs.next()) {
                NoticeDTO notice = new NoticeDTO();

                notice.setNum(rs.getInt("num"));
                notice.setTitle(rs.getString("title"));
                notice.setContent(rs.getString("content"));
                notice.setCount(rs.getInt("count"));
                notice.setId(rs.getString("id"));
                notice.setDateCreated(rs.getString("datecreated"));
                noticeList.add(notice);
            }
        } catch (SQLException e) {
            System.out.println("[에러]getNoticeList() 메소드의 SQL 오류 = " + e.getMessage());
        } finally {
            close(con, pstmt, rs);
        }
        return noticeList;
    }

    // 시퀸스의 자동 증가값을 검색
    public int getNoticeNum() {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int num = 0;
        try {
            con = getConnection();

            String sql = "select notice_seq.nextval from dual";
            pstmt = con.prepareStatement(sql);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                num = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("[에러]getNoticeNum() 메소드의 SQL 오류 = " + e.getMessage());
        } finally {
            close(con, pstmt, rs);
        }
        return num;
    }

    // 삽입
    public int addNotice(NoticeDTO notice) {
        Connection con = null;
        PreparedStatement pstmt = null;
        int rows = 0;
        try {
            con = getConnection();

            /* String sql = "insert into noticetable values(?,?,?,0,?,sysdate)"; */
            String sql = "insert into noticetable values(?,?,?,0,'관리자',sysdate)";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, notice.getNum());
            pstmt.setString(2, notice.getTitle());
            pstmt.setString(3, notice.getContent());
            /* pstmt.setString(4, notice.getId()); */

            rows = pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("[에러] addNotice() 메소드의 SQL 오류" + e.getMessage());
        } finally {
            close(con, pstmt);
        }
        return rows;
    }

    /*
     * // 수정 public int modifyNotice(NoticeDTO notice) { Connection con=null;
     * PreparedStatement pstmt=null; int rows=0; try { con=getConnection();
     * 
     * String
     * query="update noticetable set title=?,content=?,count=?,id=?, dateCreated=sysdate where num=?"
     * ; pstmt=con.prepareStatement(query); //pstmt.setString(1, student.getName());
     * pstmt.setString(1, notice.getTitle()); pstmt.setString(2,
     * notice.getContent()); pstmt.setInt(3, notice.getCount()); pstmt.setString(4,
     * notice.getId()); pstmt.setInt(5, notice.getNum());
     * 
     * rows=pstmt.executeUpdate(); } catch (SQLException e) {
     * System.out.println("[에러]updateStudent() 메소드의 SQL 오류 = "+e.getMessage()); }
     * finally { close(con, pstmt); } return rows; }
     */

    // 저장된 게시글을 검색하여 반환
    public NoticeDTO getNotice(int num) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        NoticeDTO notice = null;
        try {
            con = getConnection();

            String sql = "select * from noticetable where num=? and title!='삭제글'";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                notice = new NoticeDTO();
                notice.setNum(rs.getInt("num"));
                notice.setTitle(rs.getString("title"));
                notice.setContent(rs.getString("content"));
                notice.setCount(rs.getInt("count"));
                notice.setId(rs.getString("id"));
                notice.setDateCreated(rs.getString("dateCreated"));
            }

        } catch (SQLException e) {
            System.out.println("[에러]getNotice() 메소드의 SQL 오류 = " + e.getMessage());
        } finally {
            close(con, pstmt, rs);
        }
        return notice;
    }

    // 삭제
    public int removeNotice(int num) {
        Connection con = null;
        PreparedStatement pstmt = null;
        int rows = 0;
        try {
            con = getConnection();

            String sql = "update noticetable set title='삭제글' where num=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);

            rows = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("[에러]removeNotice() 메소드의 SQL 오류 = " + e.getMessage());
        } finally {
            close(con, pstmt);
        }
        return rows;
    }

    // 조회수가 1 증가
    public int modifyReadCount(int num) {
        Connection con = null;
        PreparedStatement pstmt = null;
        int rows = 0;
        try {
            con = getConnection();

            String sql = "update noticetable set count=count+1 where num=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);

            rows = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("[에러]modifyReadCount() 메소드의 SQL 오류 = " + e.getMessage());
        } finally {
            close(con, pstmt);
        }
        return rows;
    }

    // 시작 행번호와 종료 행번호를 전달받아 NOTICE 테이블에 저장된 게시글 목록을 검색하여 반환하는 메소드
    // => 테이블에 저장된 행에 대한 페이징 처리
    public List<NoticeDTO> getNoticeList(int startRow, int endRow) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<NoticeDTO> noticeList = new ArrayList<NoticeDTO>();
        try {
            con = getConnection();

            // sql문 수정
            String sql = "select * from (select rownum rn, temp.* from (select * from noticetable where title!='삭제글') where rn between ? and ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, startRow);
            pstmt.setInt(2, endRow);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                NoticeDTO notice = new NoticeDTO();
                // student.setNo(rs.getInt("no"));
                notice.setNum(rs.getInt("num"));
                notice.setTitle(rs.getString("title"));
                notice.setContent(rs.getString("content"));
                notice.setCount(rs.getInt("count"));
                notice.setDateCreated(rs.getString("dateCreated"));
                noticeList.add(notice);
            }

        } catch (SQLException e) {
            System.out.println("[에러]getNoticeList() 메소드의 SQL 오류 = " + e.getMessage());
        } finally {
            close(con, pstmt, rs);
        }
        return noticeList;
    }

}
