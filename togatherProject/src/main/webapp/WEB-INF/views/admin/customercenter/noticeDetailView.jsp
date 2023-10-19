<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body id="page-top">
	<div id="wrapper">
		<jsp:include page="../common/leftnav.jsp"></jsp:include>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<jsp:include page="../common/topvar.jsp"></jsp:include>
					<div class="container-fluid ">
						<div class="container">
							<h1>공지사항</h1>
							<form action="update.no" method="post">
								<input type="hidden" name="NoticeNo" value="${n.noticeNo}">
								<div class="form-group">
									<label for="제목">제목</label> 
									<input type="text" name="noticeTitle"  class="form-control" id="제목" value="${n.noticeTitle}" >
									
								</div>
								<div class="form-group">
									<label for="내용">내용</label>
									<textarea class="form-control" id="내용" rows="20"
										name="noticeContent"   value="${n.noticeContent }">${n.noticeContent }</textarea>
								</div>
								<div class="btn-group float-right" role="group" aria-label="Basic mixed styles example">
								<button type="button" class="btn btn-secondary float-right" onclick="history.back();">뒤로가기</button>
								<button type="reset" class="btn btn-danger float-right">다시쓰기</button>
								<button type="submit" class="btn btn-warning float-right">공지사항 수정</button>
							</div>
							</form>
						</div>
					</div>
			</div>
		</div>
	</div>


</body>
</html>