<%@ page import="uz.pdp.demo12.test.CountryRepo" %>
<%@ page import="uz.pdp.demo12.test.ReportData" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: abdusoburxalimov
  Date: 30/11/24
  Time: 17:58
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
    List<ReportData> report = CountryRepo.getReport();
%>

<table class="table">
    <thead>
    <tr>
        <th>Country</th>
        <th>Region count</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (ReportData reportData : report) {
    %>
        <tr>
            <td><%=reportData.getCountry()%></td>
            <td><%=reportData.getRegionCount()%></td>
        </tr>
    <%
        }

    %>
    </tbody>
</table>


</body>
</html>
