package com.team1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ViewCustomerServlet")
public class ViewCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountno = request.getParameter("accountno");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb1", "root", "1234");

            PreparedStatement pst = conn.prepareStatement("SELECT accountno, firstname, lastname, email, aadharno, phoneno, address, balance FROM customers WHERE accountno = ?");
            pst.setString(1, accountno);
            ResultSet rs = pst.executeQuery();

            PrintWriter out = response.getWriter();
            if (rs.next()) {
                out.println("Account Number: " + rs.getString("accountno"));
                out.println("First Name: " + rs.getString("firstname"));
                out.println("Last Name: " + rs.getString("lastname"));
                out.println("Email: " + rs.getString("email"));
                out.println("Aadhar Number: " + rs.getString("aadharno"));
                out.println("Phone Number: " + rs.getString("phoneno"));
                out.println("Address: " + rs.getString("address"));
                out.println("Balance: " + rs.getDouble("balance"));
            } else {
                out.println("Customer not found.");
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
