<%@ page import="uz.pdp.demo12.todo.TodoRepo" %>
<%@ page import="uz.pdp.demo12.todo.Todo" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: abdusoburxalimov
  Date: 30/11/24
  Time: 15:41
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
    String search = Objects.requireNonNullElse(request.getParameter("search"), "");
    int pagejon = Integer.parseInt(Objects.requireNonNullElse(request.getParameter("page"), "1"));
    List<Todo> todos = TodoRepo.getTodoList(pagejon, search);
%>
<div class="w-50 p-4">
    <form action="">
        <div class="input-group">
            <input name="search" class="form-control" type="text" placeholder="Search...">
            <button class="btn btn-dark">Search</button>
        </div>
    </form>

</div>

<div class="row">
    <div class="col-6">
        <form action="/todo" method="post">
            <div class="input-group p-3">
                <input class="form-control" type="text" name="title">
                <button class="btn btn-dark"> Add</button>
            </div>
        </form>

    </div>
</div>

<hr>
<div class="p-3">
    <table class="table">
        <thead>
        <tr>
            <th>Id</th>
            <th>Title</th>
            <th>Completed</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Todo todo : todos) {
        %>
        <tr>
            <td><%=todo.getId()%>
            </td>
            <td><%=todo.getTitle()%>
            </td>
            <td><%=todo.getCompleted()%>
            </td>
            <td>
                <form action="/todo/delete" method="post">
                    <input type="hidden" value="<%=todo.getId()%>" name="id">
                    <button class="btn btn-danger">delete</button>
                </form>
            </td>
        </tr>

        <%
            }
        %>

        </tbody>
    </table>

</div>

<%
    long count = TodoRepo.count(search);
    int pageCount = (int) Math.ceil(count / 10.0);
    for (int i = 1; i <= pageCount; i++) {
%>
<a href="?page=<%=i%>&search=<%=search%>" class="btn btn-dark"><%=i%>
</a>
<%
    }
%>


</body>
</html>
