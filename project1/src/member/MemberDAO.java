package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import notice.NoticeDTO;
import semiProject.JdbcDAO;


public class MemberDAO extends JdbcDAO {
	private static MemberDAO _dao;
	
	private MemberDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new MemberDAO();
	}
	
	public static MemberDAO getDAO() {
		return _dao;
	}
	
	//회원가입 (insert) 메소드
	public void insertMember(MemberDTO memberDTO) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con =getConnection();
			con.setAutoCommit(false);
			// 회원가입시 회원 권한 = '1'로 설정
			String query = "insert into membertable values(membertable_seq.nextval,?,?,?,?,?,?,?,sysdate,'1')";
			pstmt = con.prepareStatement(query);
			//pstmt.setString(1, order.getId());
			pstmt.setString(1, memberDTO.getId());
			pstmt.setString(2, memberDTO.getPassword());
			pstmt.setString(3, memberDTO.getName());
			pstmt.setString(4, memberDTO.getAddress());
			pstmt.setString(5, memberDTO.getSex());
			pstmt.setString(6, memberDTO.getBirthday());
			pstmt.setString(7, memberDTO.getPhone());
			pstmt.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			con.rollback();
			System.out.println("[에러] qryInsert() 메소드의 SQL 오류" + e.getMessage());
		} finally {
			close(con, pstmt);
		}
	}
	
	// 로그인 체크 메소드
	public int loginCheck(MemberDTO memberDTO) 
    {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String dbPW = ""; // db에서 꺼낸 비밀번호를 담을 변수
        int x = -1;
 
        try {
            // 쿼리 - 먼저 입력된 아이디로 DB에서 비밀번호를 조회한다.
           
        	StringBuffer query = new StringBuffer();
            query.append("SELECT password FROM membertable WHERE ID='"+memberDTO.getId()+"'");
			con =getConnection();
            pstmt = con.prepareStatement(query.toString());
            
            //pstmt.setString(1, memberDTO.getId());
            rs = pstmt.executeQuery();
            
            if (rs.next()) // 입려된 아이디에 해당하는 비번 있을경우
            {
                dbPW = rs.getString("password"); // 비번을 변수에 넣는다.
                if (dbPW.equals(memberDTO.getPassword())) 
                    x = 1; // 넘겨받은 비번과 꺼내온 배번 비교. 같으면 인증성공
                
                else                  
                    x = 0; // DB의 비밀번호와 입력받은 비밀번호 다름, 인증실패
                
            } else {
                x = -1; // 해당 아이디가 없을 경우
            }
            return x;
 
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } finally {
			close(con, pstmt, rs);
        }
    }

	// 아이디 전달 받아 테이블 정보 반환 메소드
	public MemberDTO getMember(String id) {
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    MemberDTO member = null;
	    try {
            con = getConnection();
            
            String sql = "select * from membertable where id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                member = new MemberDTO();
                member.setMemberNo(rs.getInt("memberNo"));
                member.setId(rs.getString("id"));
                member.setPassword(rs.getString("password"));
                member.setName(rs.getString("name"));
                member.setAddress(rs.getString("address"));
                member.setSex(rs.getString("sex"));
                member.setBirthday(rs.getString("birthday"));
                member.setPhone(rs.getString("phone"));
                member.setMemberDate(rs.getString("memberdate"));
                member.setAuthority(rs.getString("authority"));
            }
        } catch (SQLException e) {
            System.out.println("[에러]getMember() 메소드의 SQL 오류 = "+e.getMessage());
        } finally {
            close(con, pstmt, rs);
        }
	    return member;
	}
	
	// 삭제
    public int removeMember(String id) {
        Connection con=null;
        PreparedStatement pstmt=null;
        int rows=0;
        try {
            con=getConnection();
            
            String sql="delete from membertable where id=?";
            pstmt=con.prepareStatement(sql);
            pstmt.setString(1, id);
            
            rows=pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("[에러]removeMember() 메소드의 SQL 오류 = "+e.getMessage());
        } finally {
            close(con, pstmt);
        }
        return rows;        
    }
	
  //회원정보를 전달받아 MEMBER 테이블에 저장된 회원정보를 변경하고 변경행의 갯수를 반환하는 메소드
    public int modifyMember(MemberDTO member) {
        Connection con=null;
        PreparedStatement pstmt=null;	
        int rows=0;
        try {
            con=getConnection();
            
            String sql="update membertable set password=?,name=?,address=?,sex=?,birthday=?,phone=? where id=?";
            pstmt=con.prepareStatement(sql);
            pstmt.setString(1, member.getPassword());
            pstmt.setString(2, member.getName());
            pstmt.setString(3, member.getAddress());
            pstmt.setString(4, member.getSex());
            pstmt.setString(5, member.getBirthday());
            pstmt.setString(6, member.getPhone());
            pstmt.setString(7, member.getId());
            
            rows=pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("[에러]modifyMember() 메소드의 SQL 오류 = "+e.getMessage());
        } finally {
            close(con, pstmt);
        }
        return rows;
    }
	
	// 모든 회원정보 검색 반환
	   public List<MemberDTO> getMemberList() {
	        Connection con=null;
	        PreparedStatement pstmt=null;
	        ResultSet rs=null;
	        List<MemberDTO> memberList=new ArrayList<MemberDTO>();
	        try {
	            con=getConnection();
	            
	            String sql="select * from membertable order by memberno";
	            pstmt=con.prepareStatement(sql);
	            
	            rs=pstmt.executeQuery();
	            
            
              while(rs.next()) { MemberDTO member = new MemberDTO();
              member.setMemberNo(rs.getInt("MEMBERNO"));
              member.setId(rs.getString("ID"));
              member.setPassword(rs.getString("PASSWORD"));
              member.setName(rs.getString("NAME"));
              member.setAddress(rs.getString("ADDRESS"));
              member.setSex(rs.getString("SEX"));
              member.setBirthday(rs.getString("BIRTHDAY"));
              member.setPhone(rs.getString("PHONE"));
              member.setMemberDate(rs.getString("MEMBERDATE"));
              member.setAuthority(rs.getString("AUTHORITY"));
              memberList.add(member); 
            }

	        } catch (SQLException e) {
	            System.out.println("[에러]getMemberList() 메소드의 SQL 오류 = "+e.getMessage());
	        } finally {
	            close(con, pstmt, rs);
	        }
	        return memberList;
	    }

	// 아이디 상태 전달받아 회원정보 변경
	public int modifyMemberStatus(String id,int status) {
	    Connection con=null;
	    PreparedStatement pstmt=null;
	    int rows=0;
	    try {
	        con=getConnection();
	            
	        String sql="update membertable set status=? where id=?";
	        pstmt=con.prepareStatement(sql);
	        pstmt.setInt(1, status);
	        pstmt.setString(2, id);
	            
	        rows=pstmt.executeUpdate();
	    } catch (SQLException e) {
	        System.out.println("[에러]modifyMemberStatus() 메소드의 SQL 오류 = "+e.getMessage());
	    } finally {
	        close(con, pstmt);
	    }
	    return rows;
	 }
	
	//키워드를 통해 검색
	/*
	public List<MemberDTO> getMemberSearchList( String search, String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<MemberDTO> memberSearchList=new ArrayList<MemberDTO>();
		try {
			con=getConnection();
		
			if(keyword.equals("")) {	
				String sql="select * from membertable order by memberno";
				pstmt=con.prepareStatement(sql);
				
			} else {
				String sql="select * from membertable where "
					+search+" like '%'||?||'%' order by memberno";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
				
			}
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO member=new MemberDTO();
				 member.setMemberNo(rs.getInt("MEMBERNO"));
	              member.setId(rs.getString("ID"));
	              member.setPassword(rs.getString("PASSWORD"));
	              member.setName(rs.getString("NAME"));
	              member.setAddress(rs.getString("ADDRESS"));
	              member.setSex(rs.getString("SEX"));
	              member.setBirthday(rs.getString("BIRTHDAY"));
	              member.setPhone(rs.getString("PHONE"));
	              member.setMemberDate(rs.getString("MEMBERDATE"));
	              member.setAuthority(rs.getString("AUTHORITY"));
	              memberSearchList.add(member); 
			}
		} catch (SQLException e) {
			System.out.println("[에러]getMemberSearchList() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return memberSearchList;
	}
	*/
	
	// MEMBER 테이블에 저장된 전체 회원의 갯수를 검색하여 반환하는 메소드
    public int getMemberTotal(String search, String keyword) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int rows = 0;
        try {
            con = getConnection();

            if (keyword.equals("")) {// 검색 기능 미사용
                String sql = "select count(*) from membertable";
                pstmt = con.prepareStatement(sql);
            } else {// 검색 기능 사용
                // 컬럼명을 저장한 Java 변수는 InParameter로 사용 불가능
                
                String sql="select count(*) from membertable where "+search+" like '%'||?||'%'";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, keyword);
            }

            rs = pstmt.executeQuery();

            if (rs.next()) {
                rows = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("[에러] getMemberTotal() 메소드의 SQL 오류");
        } finally {
            close(con, pstmt, rs);
        }
        return rows;
    }
	
	 // 페이징 처리
	public List<MemberDTO> getMemberSearchList(int startRow, int endRow, String search, String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<MemberDTO> memberSearchList=new ArrayList<MemberDTO>();
        try {
            con = getConnection();

            if (keyword.equals("")) {
                String sql = "select * from (select rownum rn, temp.* from (select * from membertable order by memberno) temp) where rn between ? and ?";
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, startRow);
                pstmt.setInt(2, endRow);
            } else {
                String sql = "select * from (select rownum rn, temp.* from (select * from membertable where "
    					+search+" like '%'||?||'%' order by memberno) temp) where rn between ? and ?";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, keyword);
                pstmt.setInt(2, startRow);
                pstmt.setInt(3, endRow);
            }

            rs = pstmt.executeQuery();

            while (rs.next()) {
            	MemberDTO member=new MemberDTO();
				 member.setMemberNo(rs.getInt("MEMBERNO"));
	              member.setId(rs.getString("ID"));
	              member.setPassword(rs.getString("PASSWORD"));
	              member.setName(rs.getString("NAME"));
	              member.setAddress(rs.getString("ADDRESS"));
	              member.setSex(rs.getString("SEX"));
	              member.setBirthday(rs.getString("BIRTHDAY"));
	              member.setPhone(rs.getString("PHONE"));
	              member.setMemberDate(rs.getString("MEMBERDATE"));
	              member.setAuthority(rs.getString("AUTHORITY"));
	              memberSearchList.add(member); 
            }
        } catch (SQLException e) {
            System.out.println("[에러]getMemberSearchListList() 메소드의 SQL 오류 = " + e.getMessage());
        } finally {
            close(con, pstmt, rs);
        }
        return memberSearchList;
    }
	
	// 휴면계정
	public int modifyMemberDate() {
        Connection con=null;
        PreparedStatement pstmt=null;
        int rows=0;
        try {
            con=getConnection();
            
            String sql="UPDATE membertable set authority = CASE when (sysdate-memberdate)>=180 then 2 when (sysdate-memberdate)<180 then 1 end WHERE id != 'admin'";
            pstmt=con.prepareStatement(sql);
                
            rows=pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("[에러]modifyMemberDate() 메소드의 SQL 오류 = "+e.getMessage());
        } finally {
            close(con, pstmt);
        }
        return rows;
     }
	// 로그인 시 memberdate 변경
	   public int modifyLoginMemberDate(String id) {
	        Connection con=null;
	        PreparedStatement pstmt=null;
	        int rows=0;
	        try {
	            con=getConnection();

	            String sql="update membertable set memberdate=sysdate where id=?";
	            pstmt=con.prepareStatement(sql);
	            pstmt.setString(1, id);
	                
	            rows=pstmt.executeUpdate();
	        } catch (SQLException e) {
	            System.out.println("[에러]modifyLoginMemberDate() 메소드의 SQL 오류 = "+e.getMessage());
	        } finally {
	            close(con, pstmt);
	        }
	        return rows;
	     }
	   
		// 아이디와 패스워드를 입력받아 비밀번호를 바꿔주는 메소드
	    public void passwordUpdate(String id,String passwd) {
	        Connection con=null;
	        PreparedStatement pstmt=null;
	        try {
				con =getConnection();
				con.setAutoCommit(false);
	            String sql="update membertable set password=? where id=?";
	            pstmt=con.prepareStatement(sql);
	            pstmt.setString(1, passwd);
	            pstmt.setString(2, id);
				pstmt.executeUpdate();
	            
	            con.commit();
	        } catch (SQLException e) {
	            System.out.println("[에러]modifyMember() 메소드의 SQL 오류 = "+e.getMessage());
	        } finally {
	            close(con, pstmt);
	        }
	    }
	    
		// 비밀번호찾기 - 이메일,이름,생년월일 입력값 체크 메소드
		public int passSearchCheck(MemberDTO memberDTO) 
	    {
	        Connection con = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        int x = -1;
	 
	        try {
	            // 쿼리 - 이메일,이름,생년월일에 맞는 행이 있는지 조회한다.
	            StringBuffer query = new StringBuffer();
	            query.append("SELECT * FROM membertable WHERE ID='"+memberDTO.getId()+"' AND BIRTHDAY='"+memberDTO.getBirthday()+"' AND NAME='"+memberDTO.getName()+"'");
				con =getConnection();
	            pstmt = con.prepareStatement(query.toString());
	            
	            //pstmt.setString(1, memberDTO.getId());
	            rs = pstmt.executeQuery();
	            
	            if (rs.next()) // 입력된 정보에 해당하는 행이있는경우
	            {
	                x = 1;
	                
	            } else {
	                x = -1; // 입력된 정보에 해당하는 행이 없을 경우
	            }
	            return x;
	 
	        } catch (SQLException e) {
	            throw new RuntimeException(e.getMessage());
	        } finally {
				close(con, pstmt, rs);
	        }
	    }
		
		// 권한 설정 및 페이지 이동
		   public int AuthorityCheck(MemberDTO member) 
		    {
		        Connection con = null;
		        PreparedStatement pstmt = null;
		        ResultSet rs = null; 
		        int x = 0;
		        try {
		            // 쿼리 - 먼저 입력된 아이디로 DB에서 권한을 조회한다.
		            StringBuffer query = new StringBuffer();
		            query.append("SELECT AUTHORITY FROM membertable WHERE ID='"+member.getId()+"'");
		            con = getConnection();
		            pstmt = con.prepareStatement(query.toString());
		           
		            rs = pstmt.executeQuery();
		            if (rs.next()) // 입력된 ID에 권한이 있을경우
		            { 
		               x=rs.getInt("AUTHORITY");
		            } else {
		                x = -1; // 해당 아이디가 없을 경우
		            }
		 
		            return x;
		 
		        } catch (SQLException e) {
		            throw new RuntimeException(e.getMessage());
		        } finally {
		          close(con, pstmt, rs);
		        }
		    } 
	
		}

