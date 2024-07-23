<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Withdraw Money</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #66ccff, #ff99cc);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            text-align: center;
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 400px;
        }

        h1 {
            color: #333;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        label {
            display: block;
            margin: 10px 0 5px;
            color: #666;
        }

        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Withdraw Money</h1>
        <form action="WithdrawServlet" method="post">
            <input type="hidden" name="accountno" value="<%= request.getParameter("accountno") %>">
            <label for="amount">Amount to Withdraw:</label>
            <input type="number" id="amount" name="amount" step="0.01" required>
            <input type="submit" value="Withdraw">
        </form>
    </div>
</body>
</html>
