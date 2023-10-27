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
							<h1>FAQ</h1>
							<form action="update.fa" method="post">
								<input type="hidden" name="faqNo" value="${f.faqNo}">
								<div class="form-group">
									<label for="제목">제목</label> 
									<input type="text" name="faqTitle"  class="form-control" id="제목" value="${f.faqTitle}" >
									
								</div>
								<div class="form-group">
									<label for="내용">내용</label>
									<textarea class="form-control" id="내용" rows="20"
										name="faqContent"  value="${f.faqContent }">${f.faqContent }</textarea>
								</div>
								<div class="btn-group float-right" role="group" aria-label="Basic mixed styles example">
								<button type="button" class="btn btn-secondary float-right" onclick="history.back();">뒤로가기</button>
								<button type="button" class="btn btn-danger float-right" onclick="deletefaq();" >삭제하기</button>
								<button type="submit" class="btn btn-warning float-right">faq 수정</button>
							</div>
							</form>
						</div>
					</div>
			</div>
		</div>
	</div>
	
	<script>
		function deletefaq(){
			if(confirm("정말 해당글을 삭제하시겠습니까?")){
			 	location.href='delete.fa?faqNo='+${f.faqNo}
			}else{
				location.href='detail.fa?faqNo='+${f.faqNo}
			}
		}
	</script>
</body>
</html>