package model.repository.impl;

import model.bean.RentType;
import model.repository.BaseRepository;
import model.repository.RentTypeRepo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class RentTypeRepoImpl implements RentTypeRepo {
    BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<RentType> getRentTypeList() {
        List<RentType> rentTypeList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();

        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from rent_type;");
            while(resultSet.next()) {
                String rentTypeId = resultSet.getString("rent_type_id");
                String rentTypeName = resultSet.getString("rent_type_name");
                String rentTypeCost = resultSet.getString("rent_type_cost");
                rentTypeList.add(new RentType(rentTypeId, rentTypeName, rentTypeCost));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rentTypeList;
    }
}
