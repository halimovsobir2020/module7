<%@ page import="uz.pdp.demo12.test.CountryRepo" %>
<%@ page import="uz.pdp.demo12.test.Country" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.demo12.test.Region" %>
<%@ page import="uz.pdp.demo12.test.RegionRepo" %><%--
  Created by IntelliJ IDEA.
  User: abdusoburxalimov
  Date: 30/11/24
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <title>add region</title>
</head>
<body>

<%
    List<Country> countries = CountryRepo.getAllCountries();
    String id = request.getParameter("id");
    Region region = null;
    if (id != null) {
        region = RegionRepo.getById(Integer.parseInt(id));
    }
%>

<div class="row">
    <div class="col-6 offset-3">
        <div class="card">
            <div class="card-header">
                <%= region == null ? "Add region" : "Update region" %>
            </div>
            <div class="card-body">
                <form action="<%=region==null?"/region/add":"/region/update"%>" method="post">
                    <%
                        if (region != null) {
                    %>
                    <input type="hidden" name="id" value="<%=region.getId()%>">
                    <%
                        }
                    %>
                    <input value="<%=region==null?"":region.getName()%>" class="form-control" type="text"
                           placeholder="Name" name="name">
                    <select class="form-control"
                            name="countryId">
                        <option selected disabled value="">Select country</option>
                        <%
                            for (Country country : countries) {
                                if (region != null && region.getCountry().getId().equals(country.getId())) {
                        %>
                        <option selected value="<%=country.getId()%>"><%=country.getName()%>
                                <%
                        } else {
                        %>
                        <option value="<%=country.getId()%>"><%=country.getName()%>
                        </option>
                        <%
                                }
                            }
                        %>
                    </select>
                    <button class="btn btn-success"> save</button>
                </form>
            </div>
        </div>
    </div>
</div>


</body>
</html>
