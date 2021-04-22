package model.repository.impl;

import model.bean.CustomerType;
import model.repository.BaseRepository;
import model.repository.CustomerTypeRepo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeRepoImpl implements CustomerTypeRepo {
    BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<CustomerType> getCustomerTypes() {
        List<CustomerType> customerTypeList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();

        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(
                    "select * from customer_type;"
            );
            while (rs.next()) {
                int id = rs.getInt("customer_type_id");
                String name = rs.getString("customer_type_name");
                CustomerType customerType = new CustomerType(id, name);
                customerTypeList.add(customerType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerTypeList;
    }
}
