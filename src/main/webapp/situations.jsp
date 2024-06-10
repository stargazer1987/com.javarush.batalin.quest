<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Action Survival - Try to survive</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
</head>

<body>
<div class="container mt-5">
    <jsp:useBean id="situation" scope="request" class="com.javarush.batalin.quest.model.Situation" />
    <jsp:useBean id="name" scope="request" class="java.lang.String" />
    <h1 class="display-4 text-center fw-bold">${situation.situation}</h1>

    <p class="mt-4 fs-4">${situation.questionText}</p>

    <div class="text-center mt-4">
        <img src="${pageContext.request.contextPath}/resources/images/situation_${situation.id}.jpg"
             class="img-fluid" alt="Question Image">
    </div>

    <form action="${pageContext.request.contextPath}/play-the-game" method="POST" class="mt-3">
        <input type="hidden" name="situationId" value="${situation.id}">

        <c:forEach var="entry" items="${situation.answers.entrySet()}">
            <div class="form-check fs-4">
                <input class="form-check-input" type="radio" name="answer"
                       id="${entry.key}" value="${entry.key}" required>
                <label class="form-check-label" for="${entry.key}">
                        <b>${entry.key})</b> ${entry.value.answerText}
                </label>
            </div>
        </c:forEach>

        <input type="hidden" name="name" value="${name}">
        <button type="submit" class="btn btn-primary btn-lg">Далее</button>
    </form>

    <div class="mt-5">
        <p class="h6 text-start">Игрок: ${sessionScope.playerName}</p>
        <p class="h6 text-start">Кол-во попыток: ${sessionScope.gameCount}</p>

    </div>
</div>
</body>
</html>
