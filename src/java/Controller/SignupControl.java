/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dal.Dao;
import Model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author buiqu
 */
@WebServlet(name = "SignupControl", urlPatterns = {"/signup"})
public class SignupControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.sendRedirect("signup.jsp");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Dao db = new Dao();
        String name = request.getParameter("name");
        String pass = request.getParameter("pass");
        String re_pass = request.getParameter("re_pass");
        String gmail = request.getParameter("email");
        String mail_gmail = "@gmail.com";
        String mail_fpt = "@fpt.edu.vn";
        if (name == null || pass == null || re_pass == null || gmail == null || name.isEmpty() || pass.isEmpty() || re_pass.isEmpty() || gmail.isEmpty()) {
            request.setAttribute("mesi", "Plasee enter full");
            request.setAttribute("na", name);
            request.setAttribute("em", gmail);
            request.setAttribute("pa", pass);
            request.setAttribute("rp", re_pass);
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } else {
            if (gmail.contains(mail_gmail) || gmail.contains(mail_fpt)) {
                if (!pass.equals(re_pass)) {
                    request.setAttribute("na", name);
                    request.setAttribute("em", gmail);
                    request.setAttribute("pa", pass);
                    request.setAttribute("rp", re_pass);
                    request.setAttribute("mesi", "Wrong with paasword dont same re_password");
                    request.getRequestDispatcher("signup.jsp").forward(request, response);
                } else {
                    if (db.checkUserExist(name) != null) {
                        request.setAttribute("na", name);
                        request.setAttribute("em", gmail);
                        request.setAttribute("pa", pass);
                        request.setAttribute("rp", re_pass);
                        request.setAttribute("mesi", "User already exists");
                        request.getRequestDispatcher("signup.jsp").forward(request, response);
                    } else {
                        db.signup(name, gmail, pass);
                        Account ac = new Account();
                        ac = db.findAccount(name, pass);
                        HttpSession Session = request.getSession();
                        Session.setAttribute("acc", ac);
                        response.sendRedirect("index");
                    }
                }
            } else {
                request.setAttribute("na", name);
                request.setAttribute("em", gmail);
                request.setAttribute("pa", pass);
                request.setAttribute("rp", re_pass);
                request.setAttribute("mesi", "Wrong with mail (we need @gmail.com or @fpt.edu.vn)");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
