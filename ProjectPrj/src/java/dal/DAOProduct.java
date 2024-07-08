/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import model.Category;
import model.Product;

/**
 *
 * @author Phung An
 */
public class DAOProduct extends DBContext {

    //hien product 
    public List<Product> getAll() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("id"), rs.getInt("category_id"), rs.getInt("brand_id"), rs.getString("title"), rs.getDouble("price"), rs.getString("thumbnail"), rs.getString("description"), rs.getInt("quantity"));
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<Product> getAllByPrice0() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM product where price <300000 Order By price\n";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("id"), rs.getInt("category_id"), rs.getInt("brand_id"), rs.getString("title"), rs.getDouble("price"), rs.getString("thumbnail"), rs.getString("description"));
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<Product> getAllByPrice1() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM product where price >=300000 and price <=1000000 Order By price \n";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("id"), rs.getInt("category_id"), rs.getInt("brand_id"), rs.getString("title"), rs.getDouble("price"), rs.getString("thumbnail"), rs.getString("description"));
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<Product> getAllByPrice2() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM product where price >=1000000 Order By price\n";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("id"), rs.getInt("category_id"), rs.getInt("brand_id"), rs.getString("title"), rs.getDouble("price"), rs.getString("thumbnail"), rs.getString("description"));
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<Product> getAllDes() {
        List<Product> list = new ArrayList<>();
        String sql = "Select * from Product Order By price desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("id"), rs.getInt("category_id"), rs.getInt("brand_id"), rs.getString("title"), rs.getDouble("price"), rs.getString("thumbnail"), rs.getString("description"));
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    // hien ra 3 san pham moi nhat
    public List<Product> getNewProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "Select top 3 * FROM Product Order by id Desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("id"), rs.getInt("category_id"), rs.getInt("brand_id"), rs.getString("title"), rs.getDouble("price"), rs.getString("thumbnail"), rs.getString("description"));
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    // hien ra 3 san pham moi nhat
    public List<Product> getFamousProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE id IN (\n"
                + "  SELECT TOP 3 product_id\n"
                + "  FROM Order_Details\n"
                + "  GROUP BY product_id\n"
                + "  ORDER BY SUM(num) DESC\n"
                + "  )";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("id"), rs.getInt("category_id"), rs.getInt("brand_id"), rs.getString("title"), rs.getDouble("price"), rs.getString("thumbnail"), rs.getString("description"));
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }
    //insert product

    public void insert(Product c) {
        String sql = "INSERT INTO [dbo].[Product]\n"
                + "           ([id]\n"
                + "           ,[category_id]\n"
                + "           ,[brand_id]\n"
                + "           ,[title]\n"
                + "           ,[price]\n"
                + "           ,[thumbnail]\n"
                + "           ,[description]\n"
                + "           ,[quantity])\n"
                + "     VALUES(?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, c.getId());
            st.setInt(2, c.getCategory_id());
            st.setInt(3, c.getBrand_id());
            st.setString(4, c.getTitle());
            st.setDouble(5, c.getPrice());
            st.setString(6, c.getThumbnail());
            st.setString(7, c.getDescription());
            st.setInt(8, c.getQuantity());

            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    //update
    public void update(Product p) {
//        String sql = "UPDATE [dbo].[Product]\n"
//                + "   SET"
//                + "      [category_id] = ?\n"
//                + "      ,[brand_id] = ?\n"
//                + "      ,[title] = ?\n"
//                + "      ,[price] = ?\n"
//                + "      ,[thumbnail] = ?\n"
//                + "      ,[description] = ?\n"
//                + " WHERE id=?";
        String sql = "UPDATE [dbo].[Product]\n"
                + "   SET "
                + "      [category_id] = ?\n"
                + "      ,[brand_id] = ?\n"
                + "      ,[title] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[thumbnail] =?\n"
                + "      ,[description] = ?\n"
                + "      ,[quantity] = ?\n"
                + " WHERE id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, p.getCategory_id());
            st.setInt(2, p.getBrand_id());
            st.setString(3, p.getTitle());
            st.setDouble(4, p.getPrice());
            st.setString(5, p.getThumbnail());
            st.setString(6, p.getDescription());
            st.setInt(7, p.getQuantity());
            st.setInt(8, p.getId());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    // delete product
    public void removeProduct(int id) {
        String sql = "delete from Product where id = " + id + "and "
                + id + "not in (select distinct product_id from Order_details)";
        try {
            PreparedStatement state = connection.prepareStatement(sql);
            state.execute();
        } catch (SQLException ex) {
        }
    }
// tim product qua cid

    public List<Product> getProductsbyCid(int cid) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product p Where 1=1 ";
        if (cid != 0) {
            sql += " and p.category_id =" + cid;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            //st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                //  Category c = new Category(rs.getInt("id"), rs.getString("name"));
                Product p = new Product(rs.getInt("id"), rs.getInt("category_id"), rs.getInt("brand_id"), rs.getString("title"), rs.getDouble("price"), rs.getString("thumbnail"), rs.getString("description"));
                list.add(p);
            }

        } catch (Exception e) {
        }
        return list;
    }

    //search sản phẩm
    public List<Product> search(String key) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE 1=1";
        if (key != null && !key.equals("")) {
            sql += " AND (title LIKE ? OR description LIKE ?)";
        }

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            if (key != null && !key.equals("")) {
                st.setString(1, "%" + key + "%");
                st.setString(2, "%" + key + "%");
            }

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("id"),
                        rs.getInt("category_id"),
                        rs.getInt("brand_id"),
                        rs.getString("title"),
                        rs.getDouble("price"),
                        rs.getString("thumbnail"),
                        rs.getString("description")
                );
                list.add(p);
            }
        } catch (SQLException e) {
            // Xử lý exception
        }
        return list;
    }

    public Product getProductByID(int id) {

        String sql = "SELECT * FROM product WHERE id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            //giá trị đầu tiên ở vị trí 1 thiết lập với id
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product p = new Product(rs.getInt("id"), rs.getInt("category_id"), rs.getInt("brand_id"), rs.getString("title"), rs.getDouble("price"), rs.getString("thumbnail"), rs.getString("description"), rs.getInt("quantity"));
                return p;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public int CountProduct() {
        int count = 0;
        String sql = "SELECT COUNT(*) as 'count'\n"
                + "  FROM product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            //st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    }

    public static void main(String[] args) {
        DAOProduct d = new DAOProduct();
        List<Product> a = d.getAll();
        List<Product> a1 = d.getProductsbyCid(1);
        Product p = d.getProductByID(3);
        System.out.println(d.CountProduct());
//        d.update(new Product(6, 1, 2, "dầu tẩy trang", 800000, "https://media.hcdn.vn/catalog/product/d/a/dau-tay-trang-shu-uemura-giam-tac-nhan-o-nhiem-150ml-1-1667442721_img_358x358_843626_fit_center.jpg", "Thành phần chính: công thức chứa 8 loại dầu quý hiếm, bao gồm: jojoba, rễ gừng, hạt ngô, hoa rum, đậu nành, hoa trà, cây olive và bơ đậu mỡ.")
//        );
        System.out.println(a.get(0).getPrice());
        System.out.println(p.getTitle());
        System.out.println("Count: " + d.CountProduct());
    }

}
