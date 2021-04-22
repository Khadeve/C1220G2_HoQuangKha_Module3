package model.repository.impl;

import model.bean.Service;
import model.repository.BaseRepository;
import model.repository.ServiceRepo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ServiceRepoImpl implements ServiceRepo {
    BaseRepository serviceBaseRepo = new BaseRepository();

    @Override
    public boolean addNewService(Service newService) {
        Connection connection = serviceBaseRepo.getConnection();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(
                    "insert into service values\n" +
                            "\t(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);"
            );
            preparedStatement.setInt(1, Integer.parseInt(newService.getId()));
            preparedStatement.setString(2, newService.getName());
            preparedStatement.setDouble(3, Double.parseDouble(newService.getArea()));
            preparedStatement.setDouble(4, Double.parseDouble(newService.getCost()));
            preparedStatement.setInt(5, Integer.parseInt(newService.getMaxPeople()));
            preparedStatement.setInt(6, Integer.parseInt(newService.getRentType()));
            preparedStatement.setInt(7, Integer.parseInt(newService.getServiceType()));
            preparedStatement.setString(8, newService.getRoomStandard());
            preparedStatement.setString(9, newService.getDescriptionOtherConvenience());
            preparedStatement.setDouble(10, Double.parseDouble(newService.getPoolArea()));
            preparedStatement.setInt(11, Integer.parseInt(newService.getNumberOfFloor()));

            preparedStatement.executeUpdate();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
