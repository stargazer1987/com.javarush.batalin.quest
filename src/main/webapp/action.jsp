<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Survival Horror - Action</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
</head>

<body>
<div class="container mt-5">
    <jsp:useBean id="action" scope="request" class="java.lang.String" />
    <jsp:useBean id="nextSituation" scope="request" class="java.lang.String" />
    <jsp:useBean id="name" scope="request" class="java.lang.String" />
    <h1 class="display-4 text-center fw-bold">Action</h1>

    <p class="mt-4 fs-4">${action}</p>

    <form action="${pageContext.request.contextPath}/play-the-game" method="POST" class="mt-3">
        <input type="hidden" name="situationId" value="${nextSituation}">
        <input type="hidden" name="name" value="${name}">
        <button type="submit" class="btn btn-primary">Next</button>
    </form>
</div>
</body>
</html>
