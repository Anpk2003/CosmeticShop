/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAOProduct;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Item;
import model.Product;
import model.Cart;

/**
 *
 * @author Phung An
 */
@WebServlet(name = "CartServlet", urlPatterns = {"/cart"})
public class CartServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        if (action == null) {
            action = "listall";
        }
        if (action.equals("listall")) {
            DAOProduct daoP = new DAOProduct();
            Cart cart = null;
            Object o = session.getAttribute("cart");
            if (o != null) {
                cart = (Cart) o;
            } else {
                cart = new Cart();
            }
            int quantity = 1;
            try {
                if (request.getParameter("quantity") != null) {
                    quantity = Integer.parseInt(request.getParameter("quantity"));
                }
                int id = Integer.parseInt(request.getParameter("product_id"));
                Product product = daoP.getProductByID(id);
                Item item = new Item(product, quantity, product.getPrice() * quantity);
                cart.addItem(item);
                List<Item> list = cart.getItems();
                session.setAttribute("productOrigin", product);
                session.setAttribute("size", list.size());
                session.setAttribute("cart", cart);
                session.setAttribute("total", cart.getTotalMoney());
            } catch (Exception e) {
                e.printStackTrace();
            }

            request.getRequestDispatcher("product").forward(request, response);
        }
        //showcart bam vao gio hang
        if (action.equals("showcart")) {
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        }
        //delete pro
        if (action.equals("delete")) {
            Cart cart = null;
            Object o = session.getAttribute("cart");
            if (o != null) {
                cart = (Cart) o;
            } else {
                cart = new Cart();
            }
            try {
                int id = Integer.parseInt(request.getParameter("product_id"));
                cart.removeItem(id);
            } catch (Exception e) {
            }
            session.setAttribute("cart", cart);
            List<Item> list = cart.getItems();
            session.setAttribute("size", list.size());
            session.setAttribute("total", cart.getTotalMoney());
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        }
        //update product
        if (action.equals("updatecart")) {
            model.Cart cart = null;
            Object o = session.getAttribute("cart");
            if (o != null) {
                cart = (Cart) o;
            } else {
                cart = new Cart();
            }
            List<Item> list = cart.getItems();
            String[] quantity = request.getParameterValues("quantity");
          
            for (int i = 0; i < list.size(); i++) {
                list.get(i).setQuantity((Integer.parseInt(quantity[i])));
            }
            cart.setItems(list);
            session.setAttribute("cart", cart);
            session.setAttribute("size", list.size());
            session.setAttribute("total", cart.getTotalMoney());
            request.getRequestDispatcher("cart.jsp").forward(request, response);
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
