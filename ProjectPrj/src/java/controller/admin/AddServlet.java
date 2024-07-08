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
@WebServlet(name = "AddServlet", urlPatterns = {"/manageproducts"})
public class AddServlet extends HttpServlet {

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
        if(action.equalsIgnoreCase("add")){
             String id_raw = request.getParameter("id");
        String title_raw = request.getParameter("title");
        String price_raw = request.getParameter("price");
        String quantity = request.getParameter("quantity");
        String thum = request.getParameter("thum");
        String des = request.getParameter("des");
        String pcat_raw = request.getParameter("category");
        String pbra_raw = request.getParameter("brand");
        DAOProduct cd = new DAOProduct();
        List<Product> listp = cd.getAll();
        int id, pcat, pbra;
        double price;
        try {
            id = Integer.parseInt(id_raw);
            price = Double.parseDouble(price_raw);
            pcat = Integer.parseInt(pcat_raw);
            pbra = Integer.parseInt(pbra_raw);
            for (Product pro : listp) {
                if (pro.getId() != id) {
                    Product newp = new Product(id, pcat, pbra, title_raw, price, thum, des,Integer.parseInt(quantity));
                    cd.insert(newp);
                    response.sendRedirect("adminproduct");
                } else {
                    request.setAttribute("message", id + "has exits");
                    request.getRequestDispatcher("admin/adminproduct.jsp").forward(request, response);
                }
            }

        } catch (Exception e) {
            System.out.print(e);
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
        List<Brand> b = db.getAll();
        List<Category> c = dc.getAll();
        int id;
        try {
            request.setAttribute("listP", a);
            request.setAttribute("listB", b);
            request.setAttribute("listC", c);
            request.getRequestDispatcher("addproduct.jsp").forward(request, response);

        } catch (Exception e) {
            System.out.println(e);
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
