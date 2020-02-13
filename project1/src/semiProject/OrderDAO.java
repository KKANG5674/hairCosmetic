package semiProject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;

import member.MemberDTO;
import semiProject.OrderDTO;


//DAO 클래스 : 데이타 저장소를 이용하여 데이타 삽입,삭제,변경,검색 기능을 제공하는 클래스

//PHONEBOOK 테이블의 행 삽입,삭제,변경,검색 기능의 메소드를 제공하는 클래스
// => 싱글톤 클래스로 작성하는 것을 권장
public class OrderDAO extends JdbcDAO {
    private static OrderDAO _dao;
    
    private OrderDAO() {
        // TODO Auto-generated constructor stub
    }
    
    static {
        _dao=new OrderDAO();
    }
    
    public static OrderDAO getDAO() {
        return _dao;
    }
    
    //주문하기 (insert) 메소드
    public void insertorder(OrderDTO order) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con =getConnection();
            
            con.setAutoCommit(false);
            String query = "insert into ordertable values(ordertable_seq.nextval,sysdate,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'결제대기','배송준비')";
            pstmt = con.prepareStatement(query);
            //pstmt.setString(1, order.getId());
            pstmt.setString(1, order.getId());
            pstmt.setString(2, order.getHairType());
            pstmt.setString(3, order.getHairBold());
            pstmt.setString(4, order.getHairDamage());
            pstmt.setString(5, order.getHeadType());
            pstmt.setString(6, order.getProductFuntion());
            pstmt.setString(7, order.getShampooColor());
            pstmt.setString(8, order.getConditionColor());
            pstmt.setString(9, order.getSmell());
            pstmt.setString(10, order.getSmellPower());
            pstmt.setString(11, order.getCodeName());
            pstmt.setString(12, order.getHashTagOne());
            pstmt.setString(13, order.getHashTagTwo());
            pstmt.setString(14, order.getHashTagThree());
            pstmt.setString(15, order.getProSelect());
            pstmt.setString(16, order.getName());
            pstmt.setString(17, order.getPhone());
            pstmt.setString(18, order.getPostalCode());
            pstmt.setString(19, order.getAddress());
            pstmt.setString(20, order.getDetailAddress());
            pstmt.setString(21, order.getMessage());
            pstmt.setString(22, order.getDepositBank());
            pstmt.setString(23, order.getDepositName());
            pstmt.setString(24, order.getTotalCash());
            pstmt.executeUpdate();
            con.commit();
        } catch (Exception e) {
            con.rollback();
            System.out.println("[에러] qryInsert() 메소드의 SQL 오류" + e.getMessage());
        } finally {
            close(con, pstmt);
        }
    }

    /* 관리자 main 페이지에서 쓸 메소드 */
    /* 주문 */
    public int getOrderCount() {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int rows = 0;
        try {
            con = getConnection();
            
            String sql = "select count(*) from ordertable where payment='결제대기'";
            pstmt = con.prepareStatement(sql);
            
            rs = pstmt.executeQuery();

            if (rs.next()) {
                rows = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("[에러] getOrderCount() 메소드의 SQL 오류");
        } finally {
            close(con, pstmt, rs);
        }
        return rows;
    }
    public int getOrderTotal() {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int rows = 0;
        try {
            con = getConnection();
            
            String sql = "select sum(totalcash) from ordertable where payment='결제대기'";
            pstmt = con.prepareStatement(sql);
            
            rs = pstmt.executeQuery();

            if (rs.next()) {
                rows = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("[에러] getOrderTotal() 메소드의 SQL 오류");
        } finally {
            close(con, pstmt, rs);
        }
        return rows;
    }
    /* 결제 */
    public int getSaleCount() {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int rows = 0;
        try {
            con = getConnection();
            
            String sql = "select count(*) from ordertable where payment!='결제대기'";
            pstmt = con.prepareStatement(sql);
            
            rs = pstmt.executeQuery();

            if (rs.next()) {
                rows = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("[에러] getOrderCount() 메소드의 SQL 오류");
        } finally {
            close(con, pstmt, rs);
        }
        return rows;
    }
    public int getSaleTotal() {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int rows = 0;
        try {
            con = getConnection();
            
            String sql = "select sum(totalcash) from ordertable where payment!='결제대기'";
            pstmt = con.prepareStatement(sql);
            
            rs = pstmt.executeQuery();

            if (rs.next()) {
                rows = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("[에러] getSaleTotal() 메소드의 SQL 오류");
        } finally {
            close(con, pstmt, rs);
        }
        return rows;
    }
    /* 입금 전 */
    public int getOrderBefore() {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int rows = 0;
        try {
            con = getConnection();
            
            String sql = "select count(*) from ordertable where payment='결제대기'";
            pstmt = con.prepareStatement(sql);
            
            rs = pstmt.executeQuery();

            if (rs.next()) {
                rows = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("[에러] getOrderBefore() 메소드의 SQL 오류");
        } finally {
            close(con, pstmt, rs);
        }
        return rows;
    }

    /* 배송준비 */
    public int getOrderReady() {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int rows = 0;
        try {
            con = getConnection();
            
            String sql = "select count(*) from ordertable where delivery='배송준비' and payment!='결제대기'";
            pstmt = con.prepareStatement(sql);
            
            rs = pstmt.executeQuery();

            if (rs.next()) {
                rows = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("[에러] getOrderReady() 메소드의 SQL 오류");
        } finally {
            close(con, pstmt, rs);
        }
        return rows;
    }
    /* 배송중/ 배송완료 */
    public int getOrderDo() {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int rows = 0;
        try {
            con = getConnection();
            
            String sql = "select count(*) from ordertable where delivery='배송중' and payment!='결제대기'";
            pstmt = con.prepareStatement(sql);
            
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                rows = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("[에러] getOrderDo() 메소드의 SQL 오류");
        } finally {
            close(con, pstmt, rs);
        }
        return rows;
    }
    /* 배송완료 */
    public int getOrderDone() {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int rows = 0;
        try {
            con = getConnection();
            
            String sql = "select count(*) from ordertable where delivery='배송완료' and payment!='결제대기'";
            pstmt = con.prepareStatement(sql);
            
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                rows = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("[에러] getOrderDone() 메소드의 SQL 오류");
        } finally {
            close(con, pstmt, rs);
        }
        return rows;
    }
  //배송 정보 보여주는 메소드
  	public List<OrderDTO> getOrderList() {
  		Connection con =null;
  		PreparedStatement pstmt=null;
  		ResultSet rs=null;
  		List<OrderDTO> orderList=new ArrayList<OrderDTO>();
  		try {
  			con=getConnection();
  			
  			String sql="select * from ordertable order by no";
  			pstmt=con.prepareStatement(sql);
  			
  			rs=pstmt.executeQuery();

              while(rs.next()) { OrderDTO order = new OrderDTO();
              order.setOrderDate(rs.getDate("orderDate"));
              order.setNo(rs.getInt("NO"));
              order.setId(rs.getString("ID"));
              order.setName(rs.getString("NAME"));
              order.setProSelect(rs.getString("PROSELECT"));
              order.setPayment(rs.getString("PAYMENT"));
              order.setDelivery(rs.getString("DELIVERY"));
              order.setDepositBank(rs.getString("DEPOSITBANK"));
              order.setDepositName(rs.getString("DEPOSITNAME"));
              order.setTotalCash(rs.getString("TOTALCASH"));
              orderList.add(order);
              }
  		} catch (SQLException e) {
  			System.out.println("[에러]getOrderList() 메소드의 SQL 오류 = "+e.getMessage());
  		}finally {
  			close(con, pstmt, rs);
  		}
  		return orderList;
  	}
	//주문내역에 담긴 정보를 DTO 리스트에 담아서 가져온다.
	public ArrayList<OrderDTO> getOrderInfo(String id) 
	{
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    ArrayList<OrderDTO> list = new ArrayList();

	    try {
	        // 쿼리
	        StringBuffer query = new StringBuffer();
	        query.append("SELECT * FROM ordertable WHERE id=?");
			con =getConnection();
	        pstmt = con.prepareStatement(query.toString());
	        pstmt.setString(1, id);
	        rs = pstmt.executeQuery();
	
	        while(rs.next()){			//여기서 바로 출력할 수가 없다. 그래서 DTO에 출력할 거다
	        	OrderDTO orderDTO = new OrderDTO();	//while문 안에 있어야, 다른 값 가진 DTO들이 0계속 생길 것. 안 그러면 마지막 값만 저장.
	        	orderDTO.setNo(rs.getInt("no"));	
	        	orderDTO.setOrderDate(rs.getDate("cartDate"));
	        	orderDTO.setId(rs.getString("id"));
	        	orderDTO.setHairType(rs.getString("hairType"));
	        	orderDTO.setHairBold(rs.getString("hairBold"));
	        	orderDTO.setHairDamage(rs.getString("hairDamage"));
	        	orderDTO.setHeadType(rs.getString("headType"));
	        	orderDTO.setProductFuntion(rs.getString("productFuntion"));
	        	orderDTO.setShampooColor(rs.getString("shampooColor"));
	        	orderDTO.setConditionColor(rs.getString("conditionColor"));
	        	orderDTO.setSmell(rs.getString("smell"));
	        	orderDTO.setSmellPower(rs.getString("smellPower"));
	        	orderDTO.setCodeName(rs.getString("codeName"));
	        	orderDTO.setHashTagOne(rs.getString("hashTagOne"));
	        	orderDTO.setHashTagTwo(rs.getString("hashTagTwo"));
	        	orderDTO.setHashTagThree(rs.getString("hashTagThree"));
	        	orderDTO.setProSelect(rs.getString("proSelect"));
	        	orderDTO.setName(rs.getString("orderName"));
	        	orderDTO.setPhone(rs.getString("orderPhone"));
	        	orderDTO.setPostalCode(rs.getString("postalcode"));
	        	orderDTO.setAddress(rs.getString("orderAddress"));
	        	orderDTO.setDetailAddress(rs.getString("detailAddress"));
	        	orderDTO.setMessage(rs.getString("message"));
	        	orderDTO.setDepositBank(rs.getString("depositBank"));
	        	orderDTO.setDepositName(rs.getString("depositName"));
	        	orderDTO.setTotalCash(rs.getString("totalCash"));
	        	orderDTO.setPayment(rs.getString("payment"));
	        	orderDTO.setDelivery(rs.getString("delivery"));
				list.add(orderDTO);

	          }
	
	        return list;
	
	    } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } finally {
			close(con, pstmt, rs);
        }
	}
	
	//세션 아이디 카트 내역 확인 메소드
	public Boolean orderCheck(String id) 
    {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Boolean a = false;
 
        try {
            // 쿼리 - 먼저 입력된 아이디로 DB에서 카트내역이 있는지 조회한다.
            StringBuffer query = new StringBuffer();
            query.append("SELECT * FROM ordertable WHERE ID='"+id+"'");
			con =getConnection();
            pstmt = con.prepareStatement(query.toString());
            rs = pstmt.executeQuery();
            if (rs.next()) // 해당 아이디에 카트내역이 있을경우
            {
            	a=true;
                return a;
                
            } else {// 해당 아이디의 카트내역이 없을경우
            	return a;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } finally {
			close(con, pstmt, rs);
        }
    }
	// 삭제
    public int removeOrder(int no) {
        Connection con=null;
        PreparedStatement pstmt=null;
        int rows=0;
        try {
            con=getConnection();
            
            String sql="delete from ordertable where no=?";
            pstmt=con.prepareStatement(sql);
            pstmt.setInt(1, no);
            
            rows=pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("[에러]removeMember() 메소드의 SQL 오류 = "+e.getMessage());
        } finally {
            close(con, pstmt);
        }
        return rows;        
    }   
    // 오더 검색 
    /*
    public List<OrderDTO> getorderSearchList( String search, String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<OrderDTO> orderSearchList=new ArrayList<OrderDTO>();
		try {
			con=getConnection();
		
			if(keyword.equals("")) {	
				String sql="select * from ordertable order by no";
				pstmt=con.prepareStatement(sql);
				
			} else {
				String sql="select * from ordertable where "
					+search+" like '%'||?||'%' order by no";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
				
			}
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				OrderDTO order=new OrderDTO();
				order.setOrderDate(rs.getDate("cartDate"));
	              order.setNo(rs.getInt("NO"));
	              order.setId(rs.getString("ID"));
	              order.setName(rs.getString("ordername"));
	              order.setProSelect(rs.getString("PROSELECT"));
	              order.setPayment(rs.getString("PAYMENT"));
	              order.setDelivery(rs.getString("DELIVERY"));
	              order.setDepositBank(rs.getString("DEPOSITBANK"));
	              order.setDepositName(rs.getString("DEPOSITNAME"));
	              order.setTotalCash(rs.getString("TOTALCASH"));
	              orderSearchList.add(order);
			}
		} catch (SQLException e) {
			System.out.println("[에러]getMemberSearchList() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return orderSearchList;
	}
	*/
    
	// ORDER 테이블에 저장된 전체 주문의 갯수를 검색하여 반환하는 메소드
    public int getOrderTotal(String search, String keyword) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int rows = 0;
        try {
            con = getConnection();

            if (keyword.equals("")) {// 검색 기능 미사용
                String sql = "select count(*) from ordertable";
                pstmt = con.prepareStatement(sql);
            } else {// 검색 기능 사용
                // 컬럼명을 저장한 Java 변수는 InParameter로 사용 불가능
                
                String sql="select count(*) from ordertable where "+search+" like '%'||?||'%'";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, keyword);
            }

            rs = pstmt.executeQuery();

            if (rs.next()) {
                rows = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("[에러] getOrderTotal() 메소드의 SQL 오류");
        } finally {
            close(con, pstmt, rs);
        }
        return rows;
    }
    
    // 페이징 처리
    public List<OrderDTO> getorderSearchList(int startRow, int endRow, String search, String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<OrderDTO> orderSearchList=new ArrayList<OrderDTO>();
           try {
               con = getConnection();

               if (keyword.equals("")) {
                   String sql = "select * from (select rownum rn, temp.* from (select * from ordertable order by no) temp) where rn between ? and ?";
                   pstmt = con.prepareStatement(sql);
                   pstmt.setInt(1, startRow);
                   pstmt.setInt(2, endRow);
               } else {
                   String sql = "select * from (select rownum rn, temp.* from (select * from ordertable where "
       					+search+" like '%'||?||'%' order by no) temp) where rn between ? and ?";
                   pstmt = con.prepareStatement(sql);
                   pstmt.setString(1, keyword);
                   pstmt.setInt(2, startRow);
                   pstmt.setInt(3, endRow);
               }

               rs = pstmt.executeQuery();

               while (rs.next()) {
            	  OrderDTO order=new OrderDTO();
   				  order.setOrderDate(rs.getDate("cartDate"));
   	              order.setNo(rs.getInt("NO"));
   	              order.setId(rs.getString("ID"));
   	              order.setName(rs.getString("ordername"));
   	              order.setProSelect(rs.getString("PROSELECT"));
   	              order.setPayment(rs.getString("PAYMENT"));
   	              order.setDelivery(rs.getString("DELIVERY"));
   	              order.setDepositBank(rs.getString("DEPOSITBANK"));
   	              order.setDepositName(rs.getString("DEPOSITNAME"));
   	              order.setTotalCash(rs.getString("TOTALCASH"));
   	              orderSearchList.add(order); 
               }
           } catch (SQLException e) {
               System.out.println("[에러]getorderSearchList() 메소드의 SQL 오류 = " + e.getMessage());
           } finally {
               close(con, pstmt, rs);
           }
           return orderSearchList;
       }
    
    // 주문하기 배송 및 결제 수정
    public void updateOrder(int no, String payment, String delivery) {
        Connection con=null;
        PreparedStatement pstmt=null;
       
        try {
            con=getConnection();
			con.setAutoCommit(false);
            String sql="update ordertable set payment=?,delivery=? where no=?";
            pstmt=con.prepareStatement(sql);
            pstmt.setString(1, payment);
            pstmt.setString(2, delivery);
            pstmt.setInt(3, no);
            pstmt.executeUpdate();
            
            con.commit();
        } catch (SQLException e) {
            System.out.println("[에러]modifyMember() 메소드의 SQL 오류 = "+e.getMessage());
        } finally {
            close(con, pstmt);
        }
    }
    
	//주문번호에 따른 주문내역 리스트
	public ArrayList<OrderDTO> getOrderDetail(String no) 
	{
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    ArrayList<OrderDTO> list = new ArrayList();

	    try {
	        // 쿼리
	        StringBuffer query = new StringBuffer();
	        query.append("SELECT * FROM ordertable WHERE no=?");
			con =getConnection();
	        pstmt = con.prepareStatement(query.toString());
	        pstmt.setString(1, no);
	        rs = pstmt.executeQuery();
	
	        while(rs.next()){			//여기서 바로 출력할 수가 없다. 그래서 DTO에 출력할 거다
	        	OrderDTO orderDTO = new OrderDTO();	//while문 안에 있어야, 다른 값 가진 DTO들이 0계속 생길 것. 안 그러면 마지막 값만 저장.
	        	orderDTO.setNo(rs.getInt("no"));	
	        	orderDTO.setOrderDate(rs.getDate("cartDate"));
	        	orderDTO.setId(rs.getString("id"));
	        	orderDTO.setHairType(rs.getString("hairType"));
	        	orderDTO.setHairBold(rs.getString("hairBold"));
	        	orderDTO.setHairDamage(rs.getString("hairDamage"));
	        	orderDTO.setHeadType(rs.getString("headType"));
	        	orderDTO.setProductFuntion(rs.getString("productFuntion"));
	        	orderDTO.setShampooColor(rs.getString("shampooColor"));
	        	orderDTO.setConditionColor(rs.getString("conditionColor"));
	        	orderDTO.setSmell(rs.getString("smell"));
	        	orderDTO.setSmellPower(rs.getString("smellPower"));
	        	orderDTO.setCodeName(rs.getString("codeName"));
	        	orderDTO.setHashTagOne(rs.getString("hashTagOne"));
	        	orderDTO.setHashTagTwo(rs.getString("hashTagTwo"));
	        	orderDTO.setHashTagThree(rs.getString("hashTagThree"));
	        	orderDTO.setProSelect(rs.getString("proSelect"));
	        	orderDTO.setName(rs.getString("orderName"));
	        	orderDTO.setPhone(rs.getString("orderPhone"));
	        	orderDTO.setPostalCode(rs.getString("postalcode"));
	        	orderDTO.setAddress(rs.getString("orderAddress"));
	        	orderDTO.setDetailAddress(rs.getString("detailAddress"));
	        	orderDTO.setMessage(rs.getString("message"));
	        	orderDTO.setDepositBank(rs.getString("depositBank"));
	        	orderDTO.setDepositName(rs.getString("depositName"));
	        	orderDTO.setTotalCash(rs.getString("totalCash"));
	        	orderDTO.setPayment(rs.getString("payment"));
	        	orderDTO.setDelivery(rs.getString("delivery"));
				list.add(orderDTO);

	          }
	
	        return list;
	
	    } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } finally {
			close(con, pstmt, rs);
        }
	}
}   


