<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entity.College"%>
<%@ page import="dao.CollegeDAO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>高考志愿填报模拟</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
function onSearch(obj){//js函数开始
  setTimeout(function(){//因为是即时查询，需要用setTimeout进行延迟，让值写入到input内，再读取
    var storeId = document.getElementById('store');//获取table的id标识
    var rowsLength = storeId.rows.length;//表格总共有多少行
    var key = obj.value;//获取输入框的值
    var searchCol = 1;//要搜索的哪一列，这里是第一列，从0开始数起
    for(var i=1;i<rowsLength;i++){//按表的行数进行循环，本例第一行是标题，所以i=1，从第二行开始筛选（从0数起）
      var searchText = storeId.rows[i].cells[searchCol].innerHTML;//取得table行，列的值
      if(searchText.match(key)){//用match函数进行筛选，如果input的值，即变量 key的值为空，返回的是ture，
        storeId.rows[i].style.display='';//显示行操作，
      }else{
        storeId.rows[i].style.display='none';//隐藏行操作
      }
    }
  },200);//200为延时时间
}
</script>
</head>
<body>
	<!-- 添加登录后才可以使用功能的限制 -->
		<% String username=(String)session.getAttribute("loginuser");
		if(username==null){
			 response.sendRedirect("login_failure2.jsp");
		}
		%> 
			<strong>输入学校关键字进行筛选</strong><div style="width:300px" class="input-group" > <input  class="form-control" name="key" type="text" id="key" onkeydown="onSearch(this)" value="" /></div>
			<table class="table table-striped" id="store">
				<thead>
					<tr>
						<th>大学ID</th>
						<th>名称</th>
						<th>录取分数线</th>
						<th>省份</th>
					</tr>
				</thead>
				<!-- 循环部分开始 -->
				<%
					CollegeDAO colldao = new CollegeDAO();
					ArrayList<College> list = colldao.getAllCollege();
					if (list != null && list.size() > 0) {
						for (int i = 0; i < list.size(); i++) {
							int k=i+1;
							College collf = list.get(i);
				%>
				<tbody>
					<tr>
						<td><%=k%></td>
						<td><a href="college_details.jsp?college_id=<%=collf.getCollege_id()%>"><%=collf.getCollege_name()%></a></td>
						<td><%=collf.getCollege_grade()%></td>
						<td><%=collf.getCollege_location()%></td>
					</tr>
					<%
						}
						}
					%>
				</tbody>
			</table>
</body>
</html>