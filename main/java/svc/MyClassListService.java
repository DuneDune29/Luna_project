package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.CustomerDAO;
import vo.ClassBean;
import vo.User;

public class MyClassListService {
	public int getClassListCount(User authUser) throws Exception {
		int listCount = 0;
		Connection con = getConnection();
		CustomerDAO customerDAO = CustomerDAO.getInstance();
		customerDAO.setConnection(con);
		listCount = customerDAO.selectClassListCount(authUser);
		close(con);
		return listCount;

	}

	public ArrayList<ClassBean> getClassList(User authUser, int page, int limit) throws Exception {

		ArrayList<ClassBean> articleList = null;
		Connection con = getConnection();
		CustomerDAO customerDAO = CustomerDAO.getInstance();
		customerDAO.setConnection(con);
		articleList = customerDAO.selectMyClassList(authUser, page, limit);
		close(con);
		return articleList;

	}

}