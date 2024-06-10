<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Action Survival - Pre phase</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
</head>

<body>
<div class="container mt-5">
    <h1 class="display-4 text-center fw-bold">Пролог</h1>

    <p class="mt-4 fs-4">Вначале, это был - Classical Horror, но по мере разработки автор переработал подход:) Встречайте, Action Survival! Игра начнется очень неожиданно!</p>

    <p class="mt-5 fs-5">Введите имя:</p>

    <form action="${pageContext.request.contextPath}/play-the-game" method="POST" class="mt-3">
        <div class="mb-3">
            <label for="name" class="form-label">Имя</label>
            <input type="text" class="form-control" id="name" name="name"
                   required maxlength="20" pattern=".{1,20}">
            <div class="form-text">Имя должно содержать от 1 до 20 символов.</div>
        </div>

        <input type="hidden" name="situationId" value="1">
        <button type="submit" class="btn btn-primary btn-lg">Начать</button>
    </form>
</div>
</body>
</html>