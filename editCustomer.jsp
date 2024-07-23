<!DOCTYPE html>
<html>
<head>
    <title>Edit Customer Details</title>
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
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 500px;
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
            margin: 8px 0 4px;
            color: #666;
            text-align: left;
            width: 100%;
        }

        input[type="text"], input[type="email"], input[type="number"] {
            width: 100%;
            padding: 8px;
            margin: 4px 0 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="checkbox"] {
            margin: 10px 0;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 8px 16px;
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
        <h1>Edit Customer Details</h1>
        <form action="EditCustomerServlet" method="post">
            <label for="accountno">Account Number:</label>
            <input type="text" id="accountno" name="accountno" required>
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
            <label for="updatePassword">Generate New Password?</label>
            <input type="checkbox" id="updatePassword" name="updatePassword" value="yes">
            <input type="submit" value="Edit Customer">
        </form>
    </div>
</body>
</html>
