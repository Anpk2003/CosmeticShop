/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.home;

import dal.DAOCategory;
import dal.DAOProduct;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author Phung An
 */
@WebServlet(name = "ProductServlet", urlPatterns = {"/product"})
public class ProductServlet extends HttpServlet {

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
        if (action == null || action.isEmpty()) {
            DAOProduct d = new DAOProduct();
            List<Product> a = d.getAll();
            List<Product> ades = d.getAllDes();
            DAOCategory da = new DAOCategory();
            List<Category> c = da.getAll();// in du lieu category
            String sortOption = request.getParameter("sort");
            request.setAttribute("listproduct", a);
            request.setAttribute("listcategory", c);
            request.getRequestDispatcher("product.jsp").forward(request, response);
        }
        //tim theo cateogry
        if (action.equalsIgnoreCase("category")) {
            String cateid_raw = request.getParameter("cid");
            if (cateid_raw != null && !cateid_raw.isEmpty()) {
                int cateid;
                try {
                    cateid = Integer.parseInt(cateid_raw);
                    DAOProduct dp = new DAOProduct();
                    List<Product> list1 = dp.getProductsbyCid(cateid);
                    DAOCategory dc = new DAOCategory();
                    List<Category> list2 = dc.getAll();

                    request.setAttribute("listproduct", list1);
                    request.setAttribute("listcategory", list2);

                    request.getRequestDispatcher("product.jsp").forward(request, response);
                } catch (Exception e) {
                }

            }
        }
        //search thanh cong cu
        if (action.equalsIgnoreCase("search")) {
            DAOProduct d = new DAOProduct();
            String key = request.getParameter("key2");
            List<Product> sproducts = d.search(key);
            // Sort the products based on the selected option
            String sortOption = request.getParameter("sort");
            if ("asc".equals(sortOption)) {
                Collections.sort(sproducts, Comparator.comparing(Product::getPrice));
            } else if ("desc".equals(sortOption)) {
                Collections.sort(sproducts, Comparator.comparing(Product::getPrice).reversed());
            }
            request.setAttribute("listproduct", sproducts);
            request.getRequestDispatcher("product.jsp").forward(request, response);
        }
        if (action.equalsIgnoreCase("checkbox")) {
            DAOProduct d = new DAOProduct();
            List<Product> list1 = d.getAllByPrice0();
            List<Product> list2 = d.getAllByPrice1();
            List<Product> list3 = d.getAllByPrice2();
            List<Product> list0 = d.getAll();
            List<Product> listc = new ArrayList<>();
            String[] choose = request.getParameterValues("dc");
            if (choose == null || choose.length == 0 || choose.length == 3) {
                listc.addAll(list0); // Default to all products if no colors selected
            } else {
                for (String color : choose) {
                    switch (color) {
                        case "0":
                            listc.addAll(list1);
                            break;
                        case "1":
                            listc.addAll(list2);
                            break;
                        case "2":
                            listc.addAll(list3);
                            break;
                    }
                }
            }
            request.setAttribute("listproduct", listc);
            request.getRequestDispatcher("product.jsp").forward(request, response);
        }
        //product details
        if(action.equalsIgnoreCase("details")){
              DAOProduct dao = new DAOProduct();
        String id = request.getParameter("product_id");
        Product d = new Product();
        int id1;
        try {
            id1 = Integer.parseInt(id);
            d = dao.getProductByID(id1);           

        } catch (Exception e) {
        }
       request.setAttribute("productdetail",d);
//       request.getRequestDispatcher("detailproduct.jsp").forward(request, response);
       request.getRequestDispatcher("detail.jsp").forward(request, response);
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
