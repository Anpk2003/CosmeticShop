/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import model.Account;
import model.Item;
import model.OrderDetails;
import model.Orders;
import model.Cart;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import dal.DAOOrderDetails;
import dal.DAOOrders;
import dal.DAOProduct;
import model.Product;

@WebServlet(name = "CheckoutServlet", urlPatterns = {"/checkout"})
public class CheckoutServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        DAOOrders dao = new DAOOrders();
        DAOOrderDetails daood = new DAOOrderDetails();
        DAOProduct daop = new DAOProduct();
        Account acc = (Account) session.getAttribute("account");
        if (acc != null) {
            LocalDate curDate = java.time.LocalDate.now();
            String date = curDate.toString();
            int id = dao.maxid() + 1;
            int acc_id = acc.getId();
            String emailuser = request.getParameter("email");
            String fullname = request.getParameter("fullname");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String note = request.getParameter("note");
            int status = 1;
            String total = request.getParameter("total");
            double total1 = Double.parseDouble(total);
            Orders o = new Orders(id, acc_id, fullname, emailuser, phone,
                    address, note, date, status, total1);
            dao.insert(o);
            List<Item> listI = cart.getItems();
            for (Item c : listI) {
                int id_detail = daood.maxid() + 1;
                // San Pham ban dau duoc them vao cart
                Product productOrigin = daop.getProductByID(c.getProduct().getId());
                OrderDetails od = new OrderDetails(id_detail, o.getId(), c.getProduct().getId(),
                        c.getPrice(), c.getQuantity(), c.getQuantity() * c.getPrice());
                //update lai so luong san pham
                Product newProduct;
                newProduct = new Product(productOrigin.getId(), productOrigin.getCategory_id(), productOrigin.getBrand_id(), productOrigin.getTitle(),
                        productOrigin.getPrice(), productOrigin.getThumbnail(), productOrigin.getDescription(), productOrigin.getQuantity()-c.getQuantity());
                daop.update(newProduct);
                //them tung san pham vao hoa don
                daood.insert(od);
            }
            List<Orders> order = dao.getAll();
            List<Orders> order1 = dao.getOrderByAccount(acc_id);
            int size = order.size();
            int order_id = order.get(size - 1).getId();
           // request.setAttribute("bill1", order);
           response.sendRedirect("home.jsp");
         
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
