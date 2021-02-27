<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../common/boardHead.jsp"/>
<body>
<div class="container">
	<div class="row">		
		<jsp:include page="../common/boardTop.jsp"/>
	</div>
	<div class="row">		
		<jsp:include page="../common/boardLeft.jsp"></jsp:include>
		<div class="col-9 pt-3">
		<!-- ### 게시판의 body 부분 start ### -->
			<h3>자료실 - <small>Write(글쓰기)</small></h3>
		<script>
		/*연습문제] 글쓰기 폼에 빈값이 있는경우 서버로 전송되지 않도록 
		아래 validate()함수를 완성하시오. 모든값이 입력되었다면 WriteProc.jsp로
		submit되어야 한다.
		*/
		function checkValidate(fm) {
			if(!fm.name.value){
				alert("작성자의 이름을 입력하세요");
				fm.title.focus();
				return false;
			}
			if(!fm.pass.value){
				alert("비밀번호를 입력하세요");
				fm.title.focus();
				return false;
			}
			if(!fm.title.value){
				alert("제목을 입력하세요");
				fm.title.focus();
				return false;
			}
			if(!fm.content.value){
				alert("내용을 입력하세요");
				fm.content.focus();
				return false;
			}
		}
		</script>
			<!-- 
			파일 업로드를 위해서는 반드시 enctype을 선언해야 한다.
			선언문장이 없으면 파일은 서버로 전송되지 않는다.
			 -->
			<form name="writeFrm" method="post" action="../DataRoom/DataEdit" 
				onsubmit="return checkValidate(this);"
				enctype="multipart/form-data">
			<div class="row mt-3 mr-1">
			
				<input type="hid`den" name="idx" value="${dto.idx }" />
				<input type="hid`den" name="nowPage" value="${param.nowPage }" />
				<input type="hid`den" name="originalfile" value="${dto.attachedfile }" />
				<!--  
				기본에 등록한 파일이 있는경우 수정시 파일을 첨부하지 않으면 기존파일을
				유지해야 하므로 별도의 hidden폼이 필요하다.
				즉, 새로운 파일을 등록하면 새로운 값으로 업데이트하고,
				파일을 등록하지 않으면 기존파일명으로 데이터를 유지하게된다.
				-->
				<table class="table table-bordered table-striped">
				<colgroup>
					<col width="20%"/>
					<col width="*"/>
				</colgroup>
				<tbody>
					<tr>
						<th class="text-center align-middle">작성자</th>
						<td>
							<input type="text" class="form-control"	name="name"
							style="width:100px;" value="${dto.name }"/>
						</td>
					</tr>
					<tr>
						<th class="text-center" 
							style="vertical-align:middle;">패스워드</th>
						<td>
							<input type="password" class="form-control" name="pass"
								style="width:200px;" value="${dto.pass }"/>
						</td>
					</tr>
					<tr>
						<th class="text-center"
							style="vertical-align:middle;">제목</th>
						<td>
							<input type="text" class="form-control" 
								name="title" value="${dto.title }"/>
						</td>
					</tr>
					<tr>
						<th class="text-center"
							style="vertical-align:middle;">내용</th>
						<td>
							<textarea rows="10" 
								class="form-control" name="content">${dto.content }</textarea>
						</td>
					</tr>
					<tr>
						<th class="text-center"
							style="vertical-align:middle;">첨부파일</th>
						<td>
							파일명 : ${dto.attachedfile }<br />
							<input type="file" class="form-control" name="attachedfile"/>
						</td>
					</tr>
				</tbody>
				</table>
				</div>
				<div class="row mb-3">
					<div class="col text-right">
						<button type="submit" class="btn btn-danger">전송하기</button>
						<button type="reset" class="btn btn-dark">Reset</button>
						<button type="button" class="btn btn-warning" 
						onclick="location.href='../DataRoom/DataList?nowPage=${param.nowPage}';">리스트보기</button>
					</div>
				</div>
			</form>
			
				
		<!-- ### 게시판의 body 부분 end ### -->	
		</div>
	</div>
	<div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
	<jsp:include page="../common/boardBottom.jsp"></jsp:include>
</div>
</body>
</html>