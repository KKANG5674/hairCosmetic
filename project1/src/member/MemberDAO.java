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
	
	//ȸ������ (insert) �޼ҵ�
	public void insertMember(MemberDTO memberDTO) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con =getConnection();
			con.setAutoCommit(false);
			// ȸ�����Խ� ȸ�� ���� = '1'�� ����
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
			System.out.println("[����] qryInsert() �޼ҵ��� SQL ����" + e.getMessage());
		} finally {
			close(con, pstmt);
		}
	}
	
	// �α��� üũ �޼ҵ�
	public int loginCheck(MemberDTO memberDTO) 
    {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String dbPW = ""; // db���� ���� ��й�ȣ�� ���� ����
        int x = -1;
 
        try {
            // ���� - ���� �Էµ� ���̵�� DB���� ��й�ȣ�� ��ȸ�Ѵ�.
           
        	StringBuffer query = new StringBuffer();
            query.append("SELECT password FROM membertable WHERE ID='"+memberDTO.getId()+"'");
			con =getConnection();
            pstmt = con.prepareStatement(query.toString());
            
            //pstmt.setString(1, memberDTO.getId());
            rs = pstmt.executeQuery();
            
            if (rs.next()) // �Է��� ���̵� �ش��ϴ� ��� �������
            {
                dbPW = rs.getString("password"); // ����� ������ �ִ´�.
                if (dbPW.equals(memberDTO.getPassword())) 
                    x = 1; // �Ѱܹ��� ����� ������ ��� ��. ������ ��������
                
                else                  
                    x = 0; // DB�� ��й�ȣ�� �Է¹��� ��й�ȣ �ٸ�, ��������
                
            } else {
                x = -1; // �ش� ���̵� ���� ���
            }
            return x;
 
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } finally {
			close(con, pstmt, rs);
        }
    }

	// ���̵� ���� �޾� ���̺� ���� ��ȯ �޼ҵ�
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
            System.out.println("[����]getMember() �޼ҵ��� SQL ���� = "+e.getMessage());
        } finally {
            close(con, pstmt, rs);
        }
	    return member;
	}
	
	// ����
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
            System.out.println("[����]removeMember() �޼ҵ��� SQL ���� = "+e.getMessage());
        } finally {
            close(con, pstmt);
        }
        return rows;        
    }
	
  //ȸ�������� ���޹޾� MEMBER ���̺��� ����� ȸ�������� �����ϰ� �������� ������ ��ȯ�ϴ� �޼ҵ�
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
            System.out.println("[����]modifyMember() �޼ҵ��� SQL ���� = "+e.getMessage());
        } finally {
            close(con, pstmt);
        }
        return rows;
    }
	
	// ��� ȸ������ �˻� ��ȯ
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
	            System.out.println("[����]getMemberList() �޼ҵ��� SQL ���� = "+e.getMessage());
	        } finally {
	            close(con, pstmt, rs);
	        }
	        return memberList;
	    }

	// ���̵� ���� ���޹޾� ȸ������ ����
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
	        System.out.println("[����]modifyMemberStatus() �޼ҵ��� SQL ���� = "+e.getMessage());
	    } finally {
	        close(con, pstmt);
	    }
	    return rows;
	 }
	
	//Ű���带 ���� �˻�
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
			System.out.println("[����]getMemberSearchList() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return memberSearchList;
	}
	*/
	
	// MEMBER ���̺��� ����� ��ü ȸ���� ������ �˻��Ͽ� ��ȯ�ϴ� �޼ҵ�
    public int getMemberTotal(String search, String keyword) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int rows = 0;
        try {
            con = getConnection();

            if (keyword.equals("")) {// �˻� ��� �̻��
                String sql = "select count(*) from membertable";
                pstmt = con.prepareStatement(sql);
            } else {// �˻� ��� ���
                // �÷����� ������ Java ������ InParameter�� ��� �Ұ���
                
                String sql="select count(*) from membertable where "+search+" like '%'||?||'%'";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, keyword);
            }

            rs = pstmt.executeQuery();

            if (rs.next()) {
                rows = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("[����] getMemberTotal() �޼ҵ��� SQL ����");
        } finally {
            close(con, pstmt, rs);
        }
        return rows;
    }
	
	 // ����¡ ó��
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
            System.out.println("[����]getMemberSearchListList() �޼ҵ��� SQL ���� = " + e.getMessage());
        } finally {
            close(con, pstmt, rs);
        }
        return memberSearchList;
    }
	
	// �޸����
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
            System.out.println("[����]modifyMemberDate() �޼ҵ��� SQL ���� = "+e.getMessage());
        } finally {
            close(con, pstmt);
        }
        return rows;
     }
	// �α��� �� memberdate ����
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
	            System.out.println("[����]modifyLoginMemberDate() �޼ҵ��� SQL ���� = "+e.getMessage());
	        } finally {
	            close(con, pstmt);
	        }
	        return rows;
	     }
	   
		// ���̵�� �н����带 �Է¹޾� ��й�ȣ�� �ٲ��ִ� �޼ҵ�
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
	            System.out.println("[����]modifyMember() �޼ҵ��� SQL ���� = "+e.getMessage());
	        } finally {
	            close(con, pstmt);
	        }
	    }
	    
		// ��й�ȣã�� - �̸���,�̸�,������� �Է°� üũ �޼ҵ�
		public int passSearchCheck(MemberDTO memberDTO) 
	    {
	        Connection con = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        int x = -1;
	 
	        try {
	            // ���� - �̸���,�̸�,������Ͽ� �´� ���� �ִ��� ��ȸ�Ѵ�.
	            StringBuffer query = new StringBuffer();
	            query.append("SELECT * FROM membertable WHERE ID='"+memberDTO.getId()+"' AND BIRTHDAY='"+memberDTO.getBirthday()+"' AND NAME='"+memberDTO.getName()+"'");
				con =getConnection();
	            pstmt = con.prepareStatement(query.toString());
	            
	            //pstmt.setString(1, memberDTO.getId());
	            rs = pstmt.executeQuery();
	            
	            if (rs.next()) // �Էµ� ������ �ش��ϴ� �����ִ°��
	            {
	                x = 1;
	                
	            } else {
	                x = -1; // �Էµ� ������ �ش��ϴ� ���� ���� ���
	            }
	            return x;
	 
	        } catch (SQLException e) {
	            throw new RuntimeException(e.getMessage());
	        } finally {
				close(con, pstmt, rs);
	        }
	    }
		
		// ���� ���� �� ������ �̵�
		   public int AuthorityCheck(MemberDTO member) 
		    {
		        Connection con = null;
		        PreparedStatement pstmt = null;
		        ResultSet rs = null; 
		        int x = 0;
		        try {
		            // ���� - ���� �Էµ� ���̵�� DB���� ������ ��ȸ�Ѵ�.
		            StringBuffer query = new StringBuffer();
		            query.append("SELECT AUTHORITY FROM membertable WHERE ID='"+member.getId()+"'");
		            con = getConnection();
		            pstmt = con.prepareStatement(query.toString());
		           
		            rs = pstmt.executeQuery();
		            if (rs.next()) // �Էµ� ID�� ������ �������
		            { 
		               x=rs.getInt("AUTHORITY");
		            } else {
		                x = -1; // �ش� ���̵� ���� ���
		            }
		 
		            return x;
		 
		        } catch (SQLException e) {
		            throw new RuntimeException(e.getMessage());
		        } finally {
		          close(con, pstmt, rs);
		        }
		    } 
	
		}
