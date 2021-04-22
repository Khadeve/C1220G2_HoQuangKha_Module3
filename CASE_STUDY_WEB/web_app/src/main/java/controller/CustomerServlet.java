package controller;

import model.bean.Customer;
import model.bean.CustomerType;
import model.service.CustomerService;
import model.service.CustomerTypeService;
import model.service.common.CustomerInputValidation;
import model.service.impl.CustomerServiceImpl;
import model.service.impl.CustomerTypeServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = {"" ,"/customer"})
public class CustomerServlet extends HttpServlet {
    CustomerService customerService = new CustomerServiceImpl();
    CustomerTypeService customerTypeService = new CustomerTypeServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userActionJsp = request.getParameter("userAction");

        if (userActionJsp == null) {
            userActionJsp = "";
        }

        switch(userActionJsp) {
            case "add":
                addNewCustomer(request, response);
                break;

            case "update":
                 updateCustomer(request, response);
                break;

            case "delete":
                deleteCustomer(request, response);
                break;

            case "search":
                searchCustomer(request, response);
                break;
            default:
                response.sendRedirect("furama_main_page.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userActionJsp = request.getParameter("userAction");

        if (userActionJsp == null) {
            userActionJsp = "";
        }

        switch(userActionJsp) {
            case "display":
                displayCustomerList(request, response);
                break;

            case "add":
                openCustomerRegisterPage(request, response);
                break;

            case "update":
                displayUpdateCustomer(request, response);
                break;

            case "delete":
                openDeleteConfirmationModal(request, response);
                break;
            default:
                 response.sendRedirect("furama_main_page.jsp");
        }
    }

    private void searchCustomer(HttpServletRequest request, HttpServletResponse response) {
        String searchData = request.getParameter("searchData");
        List<Customer> customerListServlet = customerService.searchWithinIdNamePhonenumber(searchData);

        request.setAttribute("searchData", searchData);
        request.setAttribute("customerListServlet", customerListServlet);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer_list_display.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        String idDatabase = request.getParameter("deletedId");
        customerService.deleteCustomerById(idDatabase);
        displayCustomerList(request, response);
    }

    private void openDeleteConfirmationModal(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        request.setAttribute("id", id);

        Customer customer = customerService.getCustomerById(id);
        request.setAttribute("deletedName", customer.getName());

        List<Customer> customerList = customerService.getCustomerList();
        request.setAttribute("customerListServlet", customerList);
        request.setAttribute("doOpenDeleteModal", "yes");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer_list_display.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        String name = request.getParameter("fullname");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String gender = request.getParameter("gender");
        String idCard = request.getParameter("idCard");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String customerType = request.getParameter("customerType");

//        Customer newlyUpdatedCustomer = new Customer(id, customerType, name, dateOfBirth, gender, idCard, phoneNumber, email, address);

        /* Validate input */
        boolean flag = true;
        boolean hasError = false;

        String idCheckMsg = null;
        String dateOfBirthCheckMsg = null;
        String idCardCheckMsg = null;
        String phoneNumberCheckMsg = null;
        String emailCheckMsg = null;

        flag = id.isEmpty() || customerService.isValidCustomerInput(id, CustomerInputValidation.CUSTOMER_ID_REGEX);
        if (!flag) {
            idCheckMsg = "Mismatching Id (right format: KH-dddd)";
            request.setAttribute("idErrorMsg", idCheckMsg);
            hasError = true;
        }


        flag = dateOfBirth.isEmpty() || customerService.isValidCustomerInput(dateOfBirth, CustomerInputValidation.DATE_REGEX);
        if (!flag) {
            dateOfBirthCheckMsg = "Mismatching date (right format: dd/mm/yyyy)";
            request.setAttribute("dateOfBirthErrorMsg", dateOfBirthCheckMsg);
            hasError = true;
        }

        flag = idCard.isEmpty() || customerService.isValidCustomerInput(idCard, CustomerInputValidation.ID_CARD_REGEX);
        if (!flag) {
            idCardCheckMsg = "Mismatching Id card (right format: ddddddddd or dddddddddddd)";
            request.setAttribute("idCardErrorMsg", idCardCheckMsg);
            hasError = true;
        }

        flag = phoneNumber.isEmpty() || customerService.isValidCustomerInput(phoneNumber, CustomerInputValidation.PHONE_NUMBER_REGEX);
        if (!flag) {
            phoneNumberCheckMsg = "Mismatching phone number (right format: 090xxxxxxx or 091xxxxxxx or (84)+90xxxxxxx or (84)+91xxxxxxx)";
            request.setAttribute("phoneNumberErrorMsg", phoneNumberCheckMsg);
            hasError = true;
        }

        flag = email.isEmpty() || customerService.isValidCustomerInput(email, CustomerInputValidation.EMAIL_REGEX);
        if (!flag) {
            emailCheckMsg = "Mismatching email (right format: abc@abc.abc)";
            request.setAttribute("emailErrorMsg", emailCheckMsg);
            hasError = true;
        }

        request.setAttribute("id", id);
        request.setAttribute("dateOfBirth", dateOfBirth);
        request.setAttribute("idCard", idCard);
        request.setAttribute("phoneNumber", phoneNumber);
        request.setAttribute("email", email);
        request.setAttribute("fullname", name);
        request.setAttribute("gender", gender);
        request.setAttribute("address", address);
        request.setAttribute("customerType", customerType);
        request.setAttribute("customerTypeList", customerTypeService.getCustomerTypes());

        if (hasError) {
            request.setAttribute("error", "yes");
        } else {
            Customer newCustomer = new Customer(id, customerType, name, dateOfBirth, gender, idCard, phoneNumber, email, address);
            customerService.updateCustomerById(id, newCustomer);
            request.setAttribute("error", "no");
        }

        RequestDispatcher rd = request.getRequestDispatcher("customer_update_form.jsp");
        try {
            rd.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void displayUpdateCustomer(HttpServletRequest request, HttpServletResponse response) {
        String fullId = request.getParameter("id");
        Customer updatedCustomer = customerService.getCustomerById(fullId);

        request.setAttribute("id", updatedCustomer.getId());
        request.setAttribute("fullname", updatedCustomer.getName());
        request.setAttribute("dateOfBirth", updatedCustomer.getDateOfBirth());
        request.setAttribute("idCard", updatedCustomer.getIdCard());
        request.setAttribute("phoneNumber", updatedCustomer.getPhoneNumber());
        request.setAttribute("email", updatedCustomer.getEmail());
        request.setAttribute("address", updatedCustomer.getAddress());
        request.setAttribute("gender", updatedCustomer.getGender());
        request.setAttribute("updatedCustomerType", updatedCustomer.getCustomerType());

        List<CustomerType> customerTypeList = customerTypeService.getCustomerTypes();
        request.setAttribute("customerTypeList", customerTypeList);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer_update_form.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void openCustomerRegisterPage(HttpServletRequest request, HttpServletResponse response) {
        List<CustomerType> customerTypeList = customerTypeService.getCustomerTypes();
        request.setAttribute("customerTypeList", customerTypeList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer_register_form.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void displayCustomerList(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = customerService.getCustomerList();

        request.setAttribute("customerListServlet", customerList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer_list_display.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void addNewCustomer(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        String name = request.getParameter("fullname");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String gender = request.getParameter("gender");
        String idCard = request.getParameter("idCard");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String customerType = request.getParameter("customerType");


        /* Validate input */
        boolean flag = true;
        boolean hasError = false;

        String idCheckMsg = null;
        String dateOfBirthCheckMsg = null;
        String idCardCheckMsg = null;
        String phoneNumberCheckMsg = null;
        String emailCheckMsg = null;

        flag = id.isEmpty() || customerService.isValidCustomerInput(id, CustomerInputValidation.CUSTOMER_ID_REGEX);
        if (!flag) {
            idCheckMsg = "Mismatching Id (right format: KH-dddd)";
            request.setAttribute("idErrorMsg", idCheckMsg);
            hasError = true;
        }


        flag = dateOfBirth.isEmpty() || customerService.isValidCustomerInput(dateOfBirth, CustomerInputValidation.DATE_REGEX);
        if (!flag) {
            dateOfBirthCheckMsg = "Mismatching date (right format: dd/mm/yyyy)";
            request.setAttribute("dateOfBirthErrorMsg", dateOfBirthCheckMsg);
            hasError = true;
        }

        flag = idCard.isEmpty() || customerService.isValidCustomerInput(idCard, CustomerInputValidation.ID_CARD_REGEX);
        if (!flag) {
            idCardCheckMsg = "Mismatching Id card (right format: ddddddddd or dddddddddddd)";
            request.setAttribute("idCardErrorMsg", idCardCheckMsg);
            hasError = true;
        }

        flag = phoneNumber.isEmpty() || customerService.isValidCustomerInput(phoneNumber, CustomerInputValidation.PHONE_NUMBER_REGEX);
        if (!flag) {
            phoneNumberCheckMsg = "Mismatching phone number (right format: 090xxxxxxx or 091xxxxxxx or (84)+90xxxxxxx or (84)+91xxxxxxx)";
            request.setAttribute("phoneNumberErrorMsg", phoneNumberCheckMsg);
            hasError = true;
        }

        flag = email.isEmpty() || customerService.isValidCustomerInput(email, CustomerInputValidation.EMAIL_REGEX);
        if (!flag) {
            emailCheckMsg = "Mismatching email (right format: abc@abc.abc)";
            request.setAttribute("emailErrorMsg", emailCheckMsg);
            hasError = true;
        }

        request.setAttribute("id", id);
        request.setAttribute("dateOfBirth", dateOfBirth);
        request.setAttribute("idCard", idCard);
        request.setAttribute("phoneNumber", phoneNumber);
        request.setAttribute("email", email);
        request.setAttribute("fullname", name);
        request.setAttribute("gender", gender);
        request.setAttribute("address", address);
        request.setAttribute("customerType", customerType);
        request.setAttribute("customerTypeList", customerTypeService.getCustomerTypes());

        if (hasError) {
            request.setAttribute("error", "yes");
        } else {
            Customer newCustomer = new Customer(id, customerType, name, dateOfBirth, gender, idCard, phoneNumber, email, address);
            customerService.addNewCustomer(newCustomer);
            request.setAttribute("error", "no");
            request.setAttribute("id", null);
            request.setAttribute("dateOfBirth", null);
            request.setAttribute("idCard", null);
            request.setAttribute("phoneNumber", null);
            request.setAttribute("email", null);
            request.setAttribute("fullname", null);
            request.setAttribute("gender", null);
            request.setAttribute("address", null);
            request.setAttribute("customerType", null);
        }

        RequestDispatcher rd = request.getRequestDispatcher("customer_register_form.jsp");
        try {
            rd.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
