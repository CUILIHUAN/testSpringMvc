<%--
  Created by IntelliJ IDEA.
  User: cui
  Date: 2019/3/19
  Time: 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--springMvc的表单标签
    1.可以快速的开发表单
    2.可以更加方便的回显数据

    springmvc表单标签遇到的问题：
    java.lang.IllegalStateException: Neither BindingResult nor plain target object for bean name 'command' available as request attribute

    问题所在：springmvc的表单标签必须要进行数据的回显，默认会使用command这个Key到request中
        找回显的数据，如果找不到，则抛出异常

    问题解决：让springmvc可以通过command从request中找到回显的数据
    还可以通过modelAttribute来指定一个key替换默认的command
--%>
<form:form action="emp" method="post" modelAttribute="employee">
    <c:if test="${!empty employee.id}" var="flag">
        <form:hidden path="id"/>
        <input type="hidden" name="_method" value="put">
    </c:if>

    lastName:<form:input path="lastName"></form:input></input>
    <br>
    Email:<form:input path="email"/>
    <br>
    Gender:<form:radiobuttons path="gender" items="${genders}"/>
    <br>
    deptName:<form:select path="department.id" items="${depts}" itemLabel="departmentName" itemValue="id"/>
    <br>
    <c:if test="${flag}">
        <input type="submit" value="EDIT"/>
    </c:if>
    <c:if test="${!flag}">
        <input type="submit" value="ADD">
    </c:if>
</form:form>

</body>
</html>
