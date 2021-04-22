package model.repository.impl;

import model.bean.ServiceType;
import model.repository.BaseRepository;
import model.repository.ServiceTypeRepo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ServiceTypeRepoImpl implements ServiceTypeRepo {
    BaseRepository baseRepository = new BaseRepository();
    @Override
    public List<ServiceType> getServiceTypeList() {
        List<ServiceType> serviceTypeList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from service_type;");
            while(resultSet.next()) {
                String serviceTypeId = resultSet.getString("service_type_id");
                String serviceTypeName = resultSet.getString("service_type_name");
                serviceTypeList.add(new ServiceType(serviceTypeId, serviceTypeName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return serviceTypeList;
    }
}
