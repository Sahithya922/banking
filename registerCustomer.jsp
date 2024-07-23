<!DOCTYPE html>
<html>
<head>
    <title>Register Customer</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #ffcc33, #ff6699);
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
            max-width: 600px;
        }

        h1 {
            color: #333;
        }

        form {
            display: inline-block;
            text-align: left;
        }

        label {
            display: block;
            margin: 10px 0 5px;
            color: #666;
        }

        input[type="text"], input[type="email"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Register New Customer</h1>
        <form action="RegisterCustomerServlet" method="post">
            <label for="firstname">First Name:</label>
            <input type="text" id="firstname" name="firstname" required>
            <label for="lastname">Last Name:</label>
            <input type="text" id="lastname" name="lastname" required>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            <label for="aadharno">Aadhar Number:</label>
            <input type="text" id="aadharno" name="aadharno" required>
            <label for="phoneno">Phone Number:</label>
            <input type="text" id="phoneno" name="phoneno" required>
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required>
            <label for="balance">Initial Balance:</label>
            <input type="number" step="0.01" id="balance" name="balance" required>
            <input type="submit" value="Register Customer">
        </form>
    </div>
</body>
</html>
