/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

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
import model.Brand;
import model.Category;
import model.Product;

/**
 *
 * @author Phung An
 */
@WebServlet(name = "AdminCategoryServlet", urlPatterns = {"/admincategory"})
public class AdminCategoryServlet extends HttpServlet {

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
        String action = request.getParameter("action");
        if (action.equals("add")) {
            String id_raw = request.getParameter("id");
            String name = request.getParameter("name");
            DAOCategory c = new DAOCategory();
            List<Category> listc = c.getAll();
            int id;
            try {
                id = Integer.parseInt(id_raw);
                for (Category pro : listc) {
                    if (pro.getId() != id) {
                        c.insert(new Category(id, name));
                        response.sendRedirect("admincategory");
                    } else {
                        request.setAttribute("message", id + "has exits");
                        request.getRequestDispatcher("admin/admincategory.jsp").forward(request, response);
                    }
                }
            } catch (Exception e) {
            }
        }
        if (action.equalsIgnoreCase("update")) {
            String id_raw = request.getParameter("id");
            String name = request.getParameter("name");
            DAOCategory dao = new DAOCategory();
            int id;
            try {
                id = Integer.parseInt(id_raw);
                Category c = new Category(id, name);
                dao.update(c);
                request.setAttribute("id", id);
                request.setAttribute("name", name);
                response.sendRedirect("admincategory");
            } catch (Exception e) {
            }

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
        DAOProduct d = new DAOProduct();
        DAOCategory dc = new DAOCategory();
        DAOBrand db = new DAOBrand();
        List<Product> a = d.getAll();
        List<Category> c = dc.getAll();
        List<Brand> b = db.getAll();
        request.setAttribute("listP", a);
        request.setAttribute("listB", b);
        request.setAttribute("listC", c);
        request.getRequestDispatcher("admin/admincategory.jsp").forward(request, response);
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
