package com.team1;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterCustomerServlet")
public class RegisterCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String aadharno = request.getParameter("aadharno");
        String phoneno = request.getParameter("phoneno");
        String address = request.getParameter("address");
        String balanceStr = request.getParameter("balance");
        double balance = Double.parseDouble(balanceStr);

        // Generate unique account number
        String accountno = generateAccountNumber();

        // Generate temporary password
        String tempPassword = generateTempPassword();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb1", "root", "1234");

            PreparedStatement pst = conn.prepareStatement("INSERT INTO customers (accountno, firstname, lastname, email, aadharno, phoneno, address, password, balance, temp_colum) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            pst.setString(1, accountno);
            pst.setString(2, firstname);
            pst.setString(3, lastname);
            pst.setString(4, email);
            pst.setString(5, aadharno);
            pst.setString(6, phoneno);
            pst.setString(7, address);
            pst.setString(8, tempPassword);
            pst.setDouble(9, balance);
            pst.setInt(10, 1); // Set temp_colum to 1
            int rowCount = pst.executeUpdate();

            PrintWriter out = response.getWriter();
            if (rowCount > 0) {
                out.println("Customer registered successfully.");
                out.println("Account Number: " + accountno);
                out.println("Temporary Password: " + tempPassword);
            } else {
                out.println("Failed to register customer.");
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private String generateAccountNumber() {
        Random rand = new Random();
        int num = 1000000 + rand.nextInt(9000000);
        return String.valueOf(num);
    }

    private String generateTempPassword() {
        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder(10);
        for (int i = 0; i < 10; i++) {
            int randomIndex = random.nextInt(CHARACTERS.length());
            sb.append(CHARACTERS.charAt(randomIndex));
        }
        return sb.toString();
    }
}
