<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Dashboard</title>
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

        h1, h2 {
            color: #333;
        }

        p {
            color: #666;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            margin: 10px 0;
        }

        a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }

        a:hover {
            color: #0056b3;
        }

        form {
            display: inline-block;
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
        <h1>Customer Dashboard</h1>
        <%
            String accountno = request.getParameter("accountno");
            Connection conn = null;
            PreparedStatement pst = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_system", "root", "12345678");

                pst = conn.prepareStatement("SELECT * FROM customers WHERE accountno = ?");
                pst.setString(1, accountno);
                rs = pst.executeQuery();

                if (rs.next()) {
                    out.println("<p>Account Number: " + rs.getString("accountno") + "<br>");
                    out.println("First Name: " + rs.getString("firstname") + "<br>");
                    out.println("Last Name: " + rs.getString("lastname") + "<br>");
                    out.println("Email: " + rs.getString("email") + "<br>");
                    out.println("Aadhar Number: " + rs.getString("aadharno") + "<br>");
                    out.println("Phone Number: " + rs.getString("phoneno") + "<br>");
                    out.println("Address: " + rs.getString("address") + "<br>");
                    out.println("Balance: " + rs.getDouble("balance") + "<br></p>");
                } else {
                    out.println("<p>Customer not found.</p>");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (pst != null) pst.close();
                    if (conn != null) conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        %>
        <h2>Actions:</h2>
        <ul>
            <li><a href='deposit.jsp?accountno=<%= accountno %>'>Deposit</a></li>
            <li><a href='withdraw.jsp?accountno=<%= accountno %>'>Withdraw</a></li>
            <li>
                <form action="CloseAccountServlet" method="post">
                    <input type="hidden" name="accountno" value="<%= accountno %>">
                    <input type="submit" value="Close Account">
                </form>
            </li>
            <li><a href='TransactionsServlet?accountno=<%= accountno %>'>View Transactions</a></li>
        </ul>
    </div>
</body>
</html>
