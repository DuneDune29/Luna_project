

<%@page import="vo.PageInfo"%>
<%@page import="vo.FNQ_bean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<meta charset="UTF-8">
<jsp:include page="header.jsp" />
<title>Insert title here</title>

<%

	ArrayList<FNQ_bean> fnqlist= new ArrayList<>();
	PageInfo pageinfo = new PageInfo();
	fnqlist=(ArrayList<FNQ_bean>)request.getAttribute("fnqList");
	pageinfo=(PageInfo)request.getAttribute("pageInfo");
	
	System.out.println(pageinfo.getPage());
	
		int listCount=pageinfo.getListCount();
		int nowPage=pageinfo.getPage();
		int maxPage=pageinfo.getMaxPage();
		int startPage=pageinfo.getStartPage();
		int endPage=pageinfo.getEndPage();
	
	%>
	
	


</head>
<body>
	<br>
	<br>
	<div class="container-fluid">
		<div class="row">
			<div class="d-flex flex-column flex-shrink-0 p-3 bg-light"
				style="width: 280px;">
				<br> <br> <a href="CC_notice.jsp"
					class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
					<svg class="bi me-2" width="40" height="32">
						<use xlink:href="CC_notice.jsp"></use></svg> <span class="fs-4">관리 홈</span>
				</a>
				<hr>
				<ul class="nav nav-pills flex-column mb-auto">
					<li class="nav-item"><a href="#" class="nav-link link-dark"
						aria-current="page"> <svg class="bi me-2" width="16"
								height="16">
								<use xlink:href="#home"></use></svg> 이용가이드
					</a></li>
					<li><a href="Notice_List.do" class="nav-link link-dark"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="Notice_List.do"></use></svg> 공지사항
					</a></li>
					<li><a href="FnQShow.do" class="nav-link active"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="FnQShow.do"></use></svg> 자주묻는질문
					</a></li>
					<li><a href="QnAlist.do" class="nav-link link-dark"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="QnAlist.do"></use></svg> 질문하기
					</a></li>
				</ul>
				

			</div>

			<main class="col-md-6 col-lg-8"> <br>
			<br>
			<br>
			<h4>FnQ</h4>
			<hr>
			<br>
			
			
			
			
			<br>
			
			<div class="container">
			<div class="row">

			<%
if(fnqlist != null && listCount > 0){
			
%>

			
				<a class="list-group-item list-group-item-action">
			<div class="row">
			<div class="col">
			<div class="row">
      <span class="col-md-2" style="text-align: center"><%="글 번호"%></span>
      <span class="col-md-1"></span>
      <span class="col-md-5" style="text-align:center"><%="내      용" %></span>
      
  </div>
  </div>
  </div>
  </a>
		<%
			
		for(int i=0;i<fnqlist.size();i++){
			String n = null;
	%>
			
				<a  class="list-group-item list-group-item-action">
				<div class="col">
      <div class="row">
			<div class="row" class="btn btn-info" data-toggle="collapse"
                     data-target="#content<%=i%>">
                     
      <span class="col-md-2" style="text-align: center"><%=(pageinfo.getPage()-1)*5+(i+1) %></span>
     &nbsp; &nbsp; &nbsp;
       <span class="col-md-5 "><%=fnqlist.get(i).getFNQ_TITLE() %>  </span>
      
    </div>
 
         
      <div class="col">
      <div class="row">

  <div id="content<%=i %>" class="collapse col-md-12">
<br>
<div class="col">
 <div class="row">
 
 <div class="col-md-2"></div>
  <div class="col-md-8">
  
   <%=fnqlist.get(i).getFNQ_CONTENT()%>
 </div></div></div>

  </div>
 </div>
 </div>
 </div>
 </div>

  </a>
  
  

			
			<%} %>
		</div>
		</div>
	<br>
			
	<section id="pageList" style="text-align : center">
		<%if(nowPage<=1){ %>
		<span style="color : darkgray; padding:8px 14px 6px; border-radius: 10px 10px 10px 10px">[이전]</span>&nbsp;
		<%}else{ %>
		<a href="FnQList.do?page=<%=nowPage-1 %>" style="color : darkgray; padding:8px 14px 6px; border-radius: 10px 10px 10px 10px">[이전]</a>&nbsp;
		<%} %>

		<%for(int a=startPage;a<=endPage;a++){
				if(a==nowPage){%>
		<span style="background-color: #32DBC6; color : white; font-weight: bold; padding:8px 14px 6px; border-radius: 10px 10px 10px 10px"><%=a %></span>&nbsp;
		<%}else{ %>
		<a href="FnQList.do?page=<%=a %>" style="color : darkgray; padding:8px 14px 6px; border-radius: 10px 10px 10px 10px"><%=a %>
		</a>&nbsp;
		<%} %>
		<%} %>

		<%if(nowPage>=maxPage){ %>
		<span style="color : darkgray; padding:8px 14px 6px; border-radius: 10px 10px 10px 10px">[다음]</span>
		<%}else{ %>
		<a href="FnQList.do?page=<%=nowPage+1 %>" style="color : darkgray; padding:8px 14px 6px; border-radius: 10px 10px 10px 10px">[다음]</a>
		<%} %>
	</section>
	<%
    }
	else
	{
	%>
	<section id="emptyArea">등록된 글이 없습니다.</section>
	<%
	}
%>

		</div>
			</main>
		

  <main class="col-md-3 ms-sm-auto col-lg-2 px-md-4"></main>
  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
			
			</div>
			
			
		</div>
	<br><br><br><br><br><br><br>




	<jsp:include page="footer.jsp" />
</body>
</html>