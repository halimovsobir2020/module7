<%--
  Created by IntelliJ IDEA.
  User: abdusoburxalimov
  Date: 03/12/24
  Time: 17:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <title>Add user</title>
</head>
<body>

<form action="/user/add" method="post">
    <input name="firstName" type="text" placeholder="FirstName">
    <input name="lastName" type="text" placeholder="LastName">
    <input name="country" type="text" placeholder="Country">
    <input name="region" type="text" placeholder="Region">
    <button class="btn btn-dark"> ok </button>
</form>


</body>
</html>
