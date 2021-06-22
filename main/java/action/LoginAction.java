package action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.LoginService;
import vo.ActionForward;
import vo.User;


public class LoginAction implements Action{
   
   private static final String FORM_VIEW = "login.jsp";
   private LoginService loginService = new LoginService();
   ActionForward forward = new ActionForward();
   
   
   

   @Override
public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
	   
	 
	      if (req.getMethod().equalsIgnoreCase("GET")) {
		         return processForm(req, res);
		      } else if (req.getMethod().equalsIgnoreCase("POST")) {
		         return processSubmit(req, res);
		      } else { 
		         res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		      return null;
		   }

}


private ActionForward processForm(HttpServletRequest req, HttpServletResponse res) {
	
	forward.setPath(FORM_VIEW);
	return forward;
     
   }
   
   private ActionForward processSubmit(HttpServletRequest req, HttpServletResponse res) throws Exception {
      String id = trim(req.getParameter("id"));
      String password = trim(req.getParameter("password"));
      
      Map<String, Boolean> errors = new HashMap<>();
      req.setAttribute("errors", errors);
      
      if (id == null || id.isEmpty())
         errors.put("id", Boolean.TRUE);
      if (password == null || password.isEmpty())
         errors.put("password", Boolean.TRUE);
      
      if (!errors.isEmpty()) {
    	  forward.setPath(FORM_VIEW);
    		return forward;
      }
      
      try {
         User user = loginService.login(id, password);
         req.getSession().setAttribute("authUser", user);
         res.sendRedirect(req.getContextPath() + "/index.jsp");
         return null;
      } catch (Exception e) {
         errors.put("idOrPwNotMatch", Boolean.TRUE);
         forward.setPath(FORM_VIEW);
     	return forward;
      }
   }
   
   private String trim(String str) {
      return str == null ? null : str.trim();
   }
}