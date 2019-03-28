<%--
  Created by IntelliJ IDEA.
  User: cui
  Date: 2019/3/18
  Time: 22:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%--导入JSTL标签库--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <%--
        SpringMvc处理静态资源：
            js css html txt png jpg 等
         因为DispatcherServlce的<url-pattern>配置的是/，会匹配到所有的请求(jsp除为）
         因为

    --%>

    <script type="text/javascript" src="script/jquery-1.7.2.min.js"></script>
    <script type="text/javascript">
        $(function () {

            $(".del").click(function () {
                //
                var href = $(this).attr("href");
                $("form").attr("action", href).submit();
                return false;
            });

        });
    </script>
</head>
<body>

<form action="" method="post">
    <input type="hidden" name="_method" value="delete">

</form>

<h1 align="center">员工信息列表</h1>
<table border="1px" align="center" width="70%" cellspacing="0px">
    <tr>
        <th>Id</th>
        <th>LastName</th>
        <th>Email</th>
        <th>Gender</th>
        <th>DeptName</th>
        <th>Depration</th>
    </tr>

    <%--通过迭代生成表格--%>
    <c:forEach items="${emps}" var="emp">
        <tr align="center">
            <td>${emp.id}</td>
            <td>${emp.lastName}</td>
            <td>${emp.email}</td>
            <td>${emp.gender==0?"女":"男"}</td>
            <td>${emp.department.departmentName}</td>
            <td>
                <a href="emp/${emp.id}">Edit</a>
                &nbsp;&nbsp;
                <a class="del" href="emp/${emp.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
<h2 align="center"><a href="emp">Add New Emp</a></h2>
</body>
</html>
