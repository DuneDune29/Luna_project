package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.NoticeListService;
import vo.ActionForward;
import vo.Notice_bean;

public class MagNoticeContentAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int notice_id=Integer.parseInt(request.getParameter("notice_id"));
		String page = request.getParameter("page");
		NoticeListService noticeListService = new NoticeListService();
		Notice_bean notice = noticeListService.getNotice(notice_id);
		ActionForward forward = new ActionForward();
		request.setAttribute("page", page);
	   	request.setAttribute("notice", notice);
   		forward.setPath("/Notice_mag_Content.jsp");
   		return forward;
		
	}

}
