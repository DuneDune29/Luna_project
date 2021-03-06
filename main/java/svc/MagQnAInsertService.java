package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;
import java.sql.SQLException;


import dao.QnADAO;
import db.JdbcUtil;
import vo.Customer_bean;
import vo.User;

public class MagQnAInsertService {

   private QnADAO qnaDao = QnADAO.getInstance();
  
   
   public boolean insertQnA(String mag_content, int qa_id) {
      try (Connection conn = JdbcUtil.getConnection()) {
    	  qnaDao.setConnection(conn);
    	  qnaDao.insertMagQnAList(mag_content, qa_id);
    	  System.out.println("되나??");
    	  boolean isModifySuccess = false;
  	
  		
  	
  		int updateCount = qnaDao.insertMagQnAList(mag_content, qa_id);;
  		
  		if(updateCount > 0){
  			commit(conn);
  			isModifySuccess=true;
  		}
  		else{
  			rollback(conn);
  		}
  		
  		close(conn);
  		return isModifySuccess;
  		
  	
      } catch (SQLException e) {
         throw new RuntimeException(e);
      }
   }
}