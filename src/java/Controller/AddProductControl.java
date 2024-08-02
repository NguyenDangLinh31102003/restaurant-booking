/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dal.Dao;
import Model.Categorize;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.UUID;

/**
 *
 * @author LEGION
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 12
)
@WebServlet(name = "AddProductControl", urlPatterns = {"/add"})
public class AddProductControl extends HttpServlet {

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
            out.println("<title>Servlet crud</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet crud at " + request.getContextPath() + "</h1>");
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
        Dao dao = new Dao();
        ArrayList<Categorize> list = dao.listCategorize();
        request.setAttribute("listCate", list);

        request.getRequestDispatcher("add_product.jsp").forward(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private boolean checkNumValid(String id) {
        try {
            Double.parseDouble(id);
        } catch (NumberFormatException e) {
            return false;
        }
        return true;
    }

    private boolean checkDiscount(String discount) {

        if (!checkNumValid(discount)) {
            return false;
        }
        if (Double.parseDouble(discount) < 0 || Double.parseDouble(discount) > 100) {
            return false;
        }
        return true;
    }
    private static final String UPLOAD_DIRECTORY = "C:\\Users\\buiqu\\Downloads\\GivenProjectExample\\ASSIMENT_PRJ_BUIQUANGTHAI_HE173335_1\\web\\img_product";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       boolean check = false;
       Dao dao = new Dao();
        
            String price = request.getParameter("price");
        String name = request.getParameter("name");
        String discount = request.getParameter("discount");
        String des = request.getParameter("des");
        String status = request.getParameter("status");
        String idCate = request.getParameter("idCate");
        Part part = request.getPart("file");
        
        double dis = 0;
        double pricee = 0;
        

        if (dao.productExist(name) != null) {
            request.setAttribute("pExist", "Sản phẩm đã tồn tại");
            check = true;
        }

        if (!checkNumValid(price)) {
            request.setAttribute("numError", "Vui lòng nhập giá sản phẩm là một số");
            check = true;
        } 
        if (!checkDiscount(discount)) {
            request.setAttribute("numError1", "Vui lòng nhập giảm giá tương ứng với tỷ lệ phần trăm");
            check = true;
        } else {
            dis = Double.parseDouble(discount);
        }

        if (part.getSize() == 0) {
            request.setAttribute("null_img", "Ảnh sản phẩm không được trống");
            check = true;
        }
            if (check == false) {
            String fileName = getFileName(part);
            String uniqueFileName = UUID.randomUUID().toString() + "-" + fileName;
            int a = dao.addProduct(name, price, des, "img_product" + File.separator + uniqueFileName, discount, status, idCate);
            if (a > 0) {
                // Tạo đường dẫn tuyệt đối của thư mục lưu trữ file hình ảnh
                String uploadFilePath = UPLOAD_DIRECTORY + File.separator + uniqueFileName;

                // Ghi nội dung của phần multipart vào file trong thư mục lưu trữ
                part.write(uploadFilePath);
                // dao.addProduct(new ProductDBO(1,name,des,pricee,Integer.parseInt(quantity),uploadFilePath,dis,Integer.parseInt(idCate),Integer.parseInt(idSup)));

                response.sendRedirect("product");
                return;
            }else{
            request.setAttribute("pExist", "Pleasse enter full");
            }
        }
          request.setAttribute("price", price);
        request.setAttribute("name", name);
        request.setAttribute("des", des);
        request.setAttribute("idCate", idCate);

        request.setAttribute("discount", discount);

        request.setAttribute("listCate", dao.listCategorize());

       
    

        

        request.getRequestDispatcher("add_product.jsp").forward(request, response);

    }

    private String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");
        for (String content : partHeader.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
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
