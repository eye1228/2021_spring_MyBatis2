<%@page import="com.ict.db.VO"%>
<%@page import="com.ict.db.DAO"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String idx = request.getParameter("idx");
	
	//jsp에서는 session에 담아 있어서 그냥 사용했다. 하지만 보안으로 인해서 idx를 가지고 DB를 갔다가 와야한다.
	WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(application);
	DAO dao = (DAO) context.getBean("dao");
	
	
	VO vo = dao.getSelectOne(idx);
	//보안 때문에 세션은 로그인 여부만 저장하고 나머지는idx나 id를 이용해서 db를 직접 갔다가 오자
	pageContext.setAttribute("vo", vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	a{text-decoration: none;}
	table{width: 600px; border-collapse: collapse;; text-align: center;}
	table, th, td{border: 1px solid black; padding: 5px; margin: auto;}
	div{ width: 600px; margin: 100px auto; text-align: center;}
	
	.bg{background-color: #99ccff}
	input{ padding : 5px;  }
</style>
<script type="text/javascript">
	function update_ok(f) {
		// 비밀번호체크
		if(f.pwd.value == "${param.pwd}"){
			alert("수정하기");
			f.submit();
		}else{
			alert("비밀번호틀림");
			f.pwd.value="";
			f.pwd.focus();
			return;
		}
	}
</script>
</head>
<body>
	<div>
		<h2>방명록 : 수정화면</h2>
		<hr>
		<p>[ <a href="list.jsp">목록으로</a> ]</p>
		<form method="post" action="update_ok.jsp">
			<table>
				<tbody>
					<tr><th class="bg">작성자</th> <td><input type="text" name="name" value="${vo.name }"></td></tr>
					<tr><th class="bg">제목</th> <td><input type="text" name="subject" value="${vo.subject }"></td></tr>
					<tr><th class="bg">email</th> <td><input type="text" name="email" value="${vo.email }"></td></tr>
					<tr><th class="bg">비밀번호</th> <td><input type="password" name="pwd" ></td></tr>
					<tr>
					   <td colspan="2">
					   		<textarea rows="10" cols="50" name="content">${vo.content }</textarea>
					   </td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<input type="button" value="수정" onclick="update_ok(this.form)"> 
							<%-- DB 수정을 위해서 idx를 넘기자 --%>
							<input type="hidden" name="idx" value="${vo.idx }">
							<input type="hidden" name="cmd" value="update_ok">
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>