<%@ page import="uz.pdp.demo12.test.RegionRepo" %>
<%@ page import="uz.pdp.demo12.test.Region" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: abdusoburxalimov
  Date: 30/11/24
  Time: 16:47
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
    List<Region> regions = RegionRepo.getRegions();

%>

<a href="AddRegion.jsp" class="btn btn-dark">Add region</a>

<hr>

<table class="table">
    <thead>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Country</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (Region region : regions) {
    %>
    <tr>
        <td><%=region.getId()%>
        </td>
        <td><%=region.getName()%>
        </td>
        <td><%=region.getCountry().getName()%>
        </td>
        <td>
            <div class="btn-group">
                <form action="/AddRegion.jsp">
                    <input type="hidden" name="id" value="<%=region.getId()%>">
                    <button class="btn btn-dark">update</button>
                </form>
                <button class="btn btn-dark">delete</button>
            </div>
        </td>
    </tr>
    <%
        }
    %>
    </tbody>

</table>


</body>
</html>
