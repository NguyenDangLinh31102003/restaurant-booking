/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dal.Dao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.util.Date;

/**
 *
 * @author buiqu
 */
@WebServlet(name = "BookControl", urlPatterns = {"/book"})
public class BookControl extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BookControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookControl at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        Dao db = new Dao();
        LocalDateTime currentDateTime = LocalDateTime.now();
        int hour = currentDateTime.getHour();
        int minute = currentDateTime.getMinute();

        try {
            if(request.getParameter("name") !=null && !request.getParameter("name").isEmpty() && request.getParameter("pnumber") != null && !request.getParameter("pnumber").isEmpty()){
                String name = request.getParameter("name");

            int pnumber = 0;
             if(request.getParameter("pnumber")!= null && !request.getParameter("pnumber").isEmpty() ){
            pnumber = Integer.parseInt(request.getParameter("pnumber"));
           }
                int numberp = 0;
           if(request.getParameter("numberp")!= null && !request.getParameter("numberp").isEmpty() ){
             numberp = Integer.parseInt(request.getParameter("numberp"));
           }
            String mail = request.getParameter("mail");
            String date = request.getParameter("date");
          
            int userID = Integer.parseInt(request.getParameter("id"));
            String time = Integer.toString(hour) + ":" + Integer.toString(minute);
            if (name == null || name.isEmpty() || request.getParameter("pnumber") == null || request.getParameter("pnumber").isEmpty() || mail == null || mail.isEmpty() || request.getParameter("numberp").isEmpty() || request.getParameter("numberp") == null || request.getParameter("id") == null || request.getParameter("id").isEmpty()) {
                request.setAttribute("mes", " PLEASS Enter full");
            } else if (request.getParameter("pnumber").length() != 10) {
                request.setAttribute("mes_pnumber", "Phone number is 10 number");
            } 
            else if (!mail.contains("@gmail.com") && !mail.contains("@fpt.edu.vn")) {
                request.setAttribute("mes_mail", "Worng mail, it need have @gmail.com or @fpt.edu.vn");
            } else if (date == null || date.isEmpty()) {
                request.setAttribute("mes_date", "Please enter date");
            } else {
                db.book(name, pnumber, mail, numberp, date, userID, time);
                request.setAttribute("sub", "ADD DONE");
            }
            request.setAttribute("ren", name);
            request.setAttribute("rep", pnumber);
            request.setAttribute("rep1", "0");
            request.setAttribute("rem", mail);
             request.setAttribute("re_numberp", numberp);
            request.setAttribute("re_date", date);
            }else{
                request.setAttribute("mes", "PLEASS Enter full");
            }
         
        } catch (Exception e) {

            request.setAttribute("mes", "PLEASS Enter full");
        }
       request.getRequestDispatcher("book.jsp").forward(request, response);

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
        processRequest(request, response);
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
