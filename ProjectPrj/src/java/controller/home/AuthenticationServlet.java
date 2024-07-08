/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.home;

import dal.DAOAccount;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.SendEmail;
import model.UserC;
import model.VerifyRecaptcha;
import static model.VerifyRecaptcha.verify;

/**
 *
 * @author Phung An
 */
@WebServlet(name = "AuthenticationServlet", urlPatterns = {"/authentication"})
public class AuthenticationServlet extends HttpServlet {

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
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        //login
        if (action.equalsIgnoreCase("login")) {
            String email1 = request.getParameter("pemail");
            String pass = request.getParameter("pass");
            DAOAccount da = new DAOAccount();
            Account a = da.checkAuthen(email1, pass);
            String role;
            // tra ve thong bao
            if (a == null) {
                request.setAttribute("error", "Tài khoản hoặc mật khẩu không đúng. Vui lòng nhập lại thông tin");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                HttpSession session = request.getSession();
                if (a.isIsAdmin() == true) {
                    role = "Nhà quản lý";
                } else {
                    role = "Khách hàng";
                }
                session.setAttribute("role", role);
                session.setAttribute("account", a);
                response.sendRedirect("home");
            }
        }
        if (action.equalsIgnoreCase("logout")) {
            HttpSession session = request.getSession();
            session.invalidate();
            response.sendRedirect("home");
        }
        if (action.equalsIgnoreCase("register")) {
            DAOAccount da = new DAOAccount();
            List<Account> lista = da.getAll();
            String username = request.getParameter("user");
            String pass = request.getParameter("pass");
            String repass = request.getParameter("repass");
            String email = request.getParameter("email");
            String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
            System.out.println(gRecaptchaResponse);
            boolean verify = VerifyRecaptcha.verify(gRecaptchaResponse);
            if (!verify) {
                request.setAttribute("Recaptcha", "Vui lòng xác nhận mã captcha");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }
            //check register
            if (!pass.equals(repass)) {
                request.setAttribute("error", "Vui lòng nhập lại repassowrd cho đúng");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } else {
                Account a = da.checkAccountExist(email);
                if (a == null) {
                    //check verify
                    SendEmail sm = new SendEmail();
                    String code = sm.getRandom();
                    UserC userc = new UserC(code, email);
                    boolean test = sm.sendEmail1(userc);
                    if (test && userc != null) {
                        HttpSession session = request.getSession();
                        session.setAttribute("userc", userc);
                        session.setAttribute("email", email);
                        session.setAttribute("username", username);
                        session.setAttribute("pass", pass);
                        response.sendRedirect("verify.jsp");
                    }

                } else {
                    response.sendRedirect("register.jsp");
                }
            }
        }
        //change password
        if (action.equalsIgnoreCase("changeprofile")) {
            String email = request.getParameter("email");
            String pass = request.getParameter("password");
            String newpass = request.getParameter("newpassword");
            String cnewpass = request.getParameter("cnewpassword");
            String username = request.getParameter("username");
            DAOAccount da = new DAOAccount();
            Account a = da.checkAuthen(email, pass);
            if (a == null) {
                //khong ton tai
                String mess = "Vui lòng nhập lại mật khẩu cũ";
                request.setAttribute("mess", mess);
                request.getRequestDispatcher("profile.jsp").forward(request, response);
            } else {
                // mat khau khong trung
                if (!newpass.equals(cnewpass)) {
                    String mess = "Vui lòng nhập lại mật khẩu mới cho đúng";
                    request.setAttribute("mess", mess);
                    request.getRequestDispatcher("profile.jsp").forward(request, response);
                } else {
                    if (newpass.trim().isEmpty()) {
                        Account ac = new Account(a.getId(), a.getEmail(), a.isIsAdmin(), username, a.getPassword());
                        da.change(ac);
                        da.changeAdmin(ac);
                        HttpSession session = request.getSession();
                        session.setAttribute("account", ac);
                        response.sendRedirect("profile.jsp");
                    } else {
                        Account ac = new Account(a.getId(), a.getEmail(), a.isIsAdmin(), username, newpass);
                        da.change(ac);
                        da.changeAdmin(ac);
                        HttpSession session = request.getSession();
                        session.setAttribute("account", ac);
                        response.sendRedirect("login.jsp");
                    }
                }
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
