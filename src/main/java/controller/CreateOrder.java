package controller;

import cart.CartProduct;
import dao.AddressDAO;
import dao.LogDAO;
import dao.OrderDAO;
import database.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.*;

import java.sql.Timestamp;
import java.time.Instant;
import java.io.IOException;
import java.util.Random;

@WebServlet("/createOrder")
public class CreateOrder extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        OrderDAO dao = new OrderDAO(DBConnect.getConnection());
        AddressDAO addressDAO = new AddressDAO(DBConnect.getConnection());
        LogDAO logDAO = new LogDAO(DBConnect.getConnection());
        String ip = IPAddressUtil.getPublicIPAddress();
        User user = (User) session.getAttribute("success");
        Address address = addressDAO.getSelectedAddressByUserId(user.getId());
        CartProduct cartProduct = (CartProduct) session.getAttribute("cart");
        boolean isAdd = false;
        if(cartProduct == null) cartProduct = new CartProduct();
        String invoiceNumber = generateInvoiceNumber();
        Timestamp timestamp = getCurrentTimestamp();

        Order order = new Order(user.getId(), invoiceNumber, String.valueOf(cartProduct.totalPriceAllProduct()), timestamp, "Chưa thanh toán", address.getId());
        isAdd = dao.insertOrder(order);
        if(isAdd) {
            session.setAttribute("createOrder",order);
            resp.sendRedirect(req.getContextPath()+"/createOrderDetail");
            logDAO.insertLog(new Log(Log.ALERT, user.getId(),ip,"Mua hàng","Tạo đơn hàng"+" "+order.getInvoiceNumber()+" " +" thành công ",0));
        }
        System.out.println(order);
    }

    private String generateInvoiceNumber() {
        String uniqueIdentifier = getUniqueIdentifier();

        long timestamp = System.currentTimeMillis();

        String invoiceNumber = "INV-" + uniqueIdentifier + "-" + timestamp;

        return invoiceNumber;
    }

    private String getUniqueIdentifier() {
        return String.valueOf(Math.abs(new Random().nextLong()));
    }
    private Timestamp getCurrentTimestamp() {
        Instant instant = Instant.now();
        return Timestamp.from(instant);
    }
}
