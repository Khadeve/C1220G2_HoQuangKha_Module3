package model.repository.impl;

import model.bean.Customer;
import model.repository.BaseRepository;
import model.repository.CustomerRepo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepoImpl implements CustomerRepo {
    BaseRepository baseRepo = new BaseRepository();

    @Override
    public List<Customer> getCustomerList() {
        List<Customer> customerList = new ArrayList<>();

        Connection connection = baseRepo.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from customer;");
            while (resultSet.next()) {
                Customer customer = new Customer();
                customer.setId("KH-" + resultSet.getString("customer_id"));
                customer.setCustomerType(resultSet.getString("customer_type_id"));
                customer.setName(resultSet.getString("customer_name"));
                customer.setDateOfBirth(resultSet.getString("customer_birthday"));
                customer.setGender(resultSet.getString("customer_gender"));
                customer.setIdCard(resultSet.getString("customer_id_card"));
                customer.setPhoneNumber(resultSet.getString("customer_phone"));
                customer.setEmail(resultSet.getString("customer_email"));
                customer.setAddress(resultSet.getString("customer_address"));

                customerList.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    @Override
    public boolean addNewCustomer(Customer newCustomer) {
        Connection connection = baseRepo.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(
                    "insert into customer\n" +
                            "values\n" +
                            "\t(?, ?, ?, ?, ?, ?, ?, ?, ?);"
            );

            ps.setInt(1, Integer.parseInt(newCustomer.getId()));
            ps.setInt(2, Integer.parseInt(newCustomer.getCustomerType()));
            ps.setString(3, newCustomer.getName());
            ps.setDate(4, Date.valueOf(newCustomer.getDateOfBirth()));
            ps.setBoolean(5, Boolean.parseBoolean(newCustomer.getGender()));
            ps.setString(6, newCustomer.getIdCard());
            ps.setString(7, newCustomer.getPhoneNumber());
            ps.setString(8, newCustomer.getEmail());
            ps.setString(9, newCustomer.getAddress());

            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Customer getCustomerById(String id) {
        int idDatabase = Integer.parseInt(id.substring(3));
        Connection connection = baseRepo.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(
                "select * from customer\n" +
                        "where customer_id = ?;"
            );
            preparedStatement.setInt(1, idDatabase);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                String customerTypeId = rs.getString("customer_type_id");
                String customerName = rs.getString("customer_name");
                String customerBirthday = rs.getString("customer_birthday");
                String customerGender = rs.getString("customer_gender");
                String customerIdCard = rs.getString("customer_id_card");
                String customerPhone = rs.getString("customer_phone");
                String customerEmail = rs.getString("customer_email");
                String customerAddress = rs.getString("customer_address");

                return new Customer(id, customerTypeId, customerName
                        , customerBirthday, customerGender, customerIdCard, customerPhone
                , customerEmail, customerAddress);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void updateCustomerById(String id, Customer newCustomer) {
        int idDigitPart = Integer.parseInt(id.substring(3));
        Connection connection = baseRepo.getConnection();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(
                    "update customer\n" +
                            "set customer_id = ?, customer_type_id = ?, customer_name = ?,\n" +
                            "\tcustomer_birthday = ?, customer_gender = ?, customer_id_card = ?,\n" +
                            "customer_phone = ?, customer_email = ?, customer_address = ?\n" +
                            "where customer_id = ?;"
            );
            preparedStatement.setInt(1, idDigitPart);
            preparedStatement.setInt(2, Integer.parseInt(newCustomer.getCustomerType()));
            preparedStatement.setString(3, newCustomer.getName());
            preparedStatement.setString(4, newCustomer.getDateOfBirth());
            preparedStatement.setBoolean(5, Boolean.parseBoolean(newCustomer.getGender()));
            preparedStatement.setString(6, newCustomer.getIdCard());
            preparedStatement.setString(7, newCustomer.getPhoneNumber());
            preparedStatement.setString(8, newCustomer.getEmail());
            preparedStatement.setString(9, newCustomer.getAddress());
            preparedStatement.setInt(10, idDigitPart);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteCustomerById(String id) {
        Connection connection = baseRepo.getConnection();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(
                    "delete from customer\n" +
                            "where customer_id = ?;"
            );
            preparedStatement.setInt(1, Integer.parseInt(id));
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Customer> searchWithinIdNamePhonenumber(String searchData) {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = baseRepo.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(
                    "select distinct * from customer\n" +
                            "where customer_id like concat('%', ?, '%')\n" +
                            "\tor customer_name like concat('%', ?, '%')\n" +
                            "\tor customer_phone like concat('%', ?, '%');"
            );
            preparedStatement.setString(1, searchData);
            preparedStatement.setString(2, searchData);
            preparedStatement.setString(3, searchData);

            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
                Customer customer = new Customer();
                customer.setId("KH-" + resultSet.getString("customer_id"));
                customer.setCustomerType(resultSet.getString("customer_type_id"));
                customer.setName(resultSet.getString("customer_name"));
                customer.setDateOfBirth(resultSet.getString("customer_birthday"));
                customer.setGender(resultSet.getString("customer_gender"));
                customer.setIdCard(resultSet.getString("customer_id_card"));
                customer.setPhoneNumber(resultSet.getString("customer_phone"));
                customer.setEmail(resultSet.getString("customer_email"));
                customer.setAddress(resultSet.getString("customer_address"));

                customerList.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }
}
