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
							<h1>신고내용</h1>
								<form action="rcount.bl">
									<input type="hidden" name="reNo" value="${r.reNo}"/>
									<input type="hidden" name="rePmem" value="${r.rePmem}"/>
									<input type="hidden" name="rpCount" value="${r.rpCount}"/>
								 <table id="contentArea" align="center" class="table">
					                <tr>
					                    <th>피신고자</th>
					                    <td>${r.rePmem}</td>
					                    <th>신고자</th>
					                    <td>${r.reMem}</td>
					                </tr>
					                <tr>
					                    <th>첨부파일</th>
					                    <td colspan="3">
					                    	<c:choose>
												<c:when test="${empty r.originName}">
												<!-- 첨부파일이 없는 경우 -->
					                    			첨부파일이 없습니다.
												</c:when>
												<c:otherwise>
					                        	<a href="${r.updateName }" download="${r.originName }">${r.originName}</a>
					                       		 </c:otherwise>
					                        </c:choose>
					                    </td>
					                </tr>
					                <tr>
					                    <th>내용</th>
					                    <td colspan="3"></td>
					                </tr>
					                <tr>
					                    <td colspan="4"><p style="height:150px">${r.reContent }</p></td>
					                </tr>
					            </table>
								<div class="btn-group float-right" role="group" aria-label="Basic mixed styles example">
								<button type="button" class="btn btn-secondary float-right" onclick="history.back();">뒤로가기</button>
								<button type="button" class="btn btn-danger float-right" onclick="deletenotice();" >반려하기</button>
								<button type="submit" class="btn btn-warning float-right">신고수락</button>
					            </form>
							</div>
							
						</div>
					</div>
			</div>
		</div>
	</div>
	
	<script>
		function deletenotice(){
			if(confirm("정말 해당글을 삭제하시겠습니까?")){
			 	location.href='delete.no?noticeNo='+${n.noticeNo}
			}else{
				location.href='detail.no?noticeNo='+${n.noticeNo}
			}
		}
	</script>
</body>
</html>