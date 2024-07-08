/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import com.oracle.wls.shaded.org.apache.bcel.generic.AALOAD;
import dal.DAOAccount;
import dal.DAOBrand;
import dal.DAOCategory;
import dal.DAOProduct;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Account;
import model.Brand;
import model.Category;
import model.Product;

/**
 *
 * @author Phung An
 */
@WebServlet(name = "UpdateServlet", urlPatterns = {"/updatep"})
public class UpdateServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateServlet at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        if (action == null) {
            action = "listall";
        }
        if (action.equals("listall")) {
            String id_raw = request.getParameter("id");
            DAOProduct d = new DAOProduct();
            DAOCategory dc = new DAOCategory();
            DAOBrand db = new DAOBrand();
            List<Product> a = d.getAll();
            List<Category> c = dc.getAll();
            List<Brand> b = db.getAll();

            int id;
            try {
                id = Integer.parseInt(id_raw);
                Product p1 = d.getProductByID(id);
                request.setAttribute("product", p1);
                request.setAttribute("listP", a);
                request.setAttribute("listB", b);
                request.setAttribute("listC", c);
                request.getRequestDispatcher("admin/updateproduct.jsp").forward(request, response);

            } catch (Exception e) {
                System.out.println(e);
            }
        }

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
            String id_raw = request.getParameter("id");
            String idcat_raw = request.getParameter("category");
            String idbra_raw = request.getParameter("brand");
            String title = request.getParameter("title");
            String thumbnail = request.getParameter("thum");
            String price_raw = request.getParameter("price");
            String quantity = request.getParameter("quantity");
            String des = request.getParameter("des");
            DAOProduct dp = new DAOProduct();
            int id, idcat, idbra;
            double price;
            try {
                id = Integer.parseInt(id_raw);
                idcat = Integer.parseInt(idcat_raw);
                idbra = Integer.parseInt(idbra_raw);
                price = Double.parseDouble(price_raw);
                Product newp = new Product(id, idcat, idbra, title, price, thumbnail, des,Integer.parseInt(quantity));
                dp.update(newp);
                response.sendRedirect("adminproduct");
            } catch (Exception e) {
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
