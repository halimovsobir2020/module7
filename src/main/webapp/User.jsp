<%@ page import="uz.pdp.demo12.user.UserRepo" %>
<%@ page import="uz.pdp.demo12.user.User" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: abdusoburxalimov
  Date: 03/12/24
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <title>Title</title>
</head>
<body>
<%
    UserRepo userRepo = new UserRepo();
    List<User> users = userRepo.findAll();
%>


<a class="btn btn-dark" href="AddUser.jsp">Add</a>


<table class="table">
    <thead>
    <tr>
        <th>Id</th>
        <th>FirstName</th>
        <th>LastName</th>
        <th>Country</th>
        <th>Region</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (User user : users) {
    %>
    <tr>
        <td><%=user.getId()%></td>
        <td><%=user.getFirstName()%></td>
        <td><%=user.getLastName()%></td>
        <td><%=user.getAddress().getCountry()%></td>
        <td><%=user.getAddress().getRegion()%></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>


</body>
</html>
