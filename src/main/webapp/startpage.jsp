<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Survival Horror - Pre phase</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
</head>

<body>
<div class="container mt-5">
    <h1 class="display-4 text-center fw-bold">Prologue</h1>

    <p class="mt-4 fs-4">The game begins here!</p>

    <p class="mt-5 fs-5">Please enter your name to start:</p>

    <form action="${pageContext.request.contextPath}/play-the-game" method="POST" class="mt-3">
        <div class="mb-3">
            <label for="name" class="form-label">Name</label>
            <input type="text" class="form-control" id="name" name="name"
                   required maxlength="30" pattern=".{1,30}">
            <div class="form-text">Name should be 1 to 30 characters long.</div>
        </div>

        <input type="hidden" name="situationId" value="1">
        <button type="submit" class="btn btn-primary">Start Adventure</button>
    </form>
</div>
</body>
</html>