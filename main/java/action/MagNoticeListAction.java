package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.NoticeListService;
import vo.ActionForward;
import vo.Notice_bean;
import vo.PageInfo;

public class MagNoticeListAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ArrayList<Notice_bean> noticeList = new ArrayList<Notice_bean>();
		int page = 1;
		int limit = 5;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		System.out.println(page);
		NoticeListService noticeListService = new NoticeListService();
		int listCount = noticeListService.getNoticeListCount();
		System.out.println(listCount);
		noticeList = noticeListService.getNoticeList(page, limit);
		System.out.println(noticeList);
		int maxPage = (int) ((double) listCount / limit + 0.9);
		int startPage = (((int) ((double) page / 5 + 0.8)) -1) * 5 + 1;
		int endPage = startPage + 5 - 1;
		
		if (endPage > maxPage)
			endPage = maxPage;
		
		PageInfo pageInfo = new PageInfo();
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		request.setAttribute("pageInfo", pageInfo);

		request.setAttribute("noticeList", noticeList);
		ActionForward forward = new ActionForward();
		forward.setPath("/Notice_mag_List.jsp");
		return forward;
	}
}