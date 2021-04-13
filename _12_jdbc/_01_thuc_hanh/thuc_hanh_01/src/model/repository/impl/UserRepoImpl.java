package model.repository.impl;

import model.bean.User;
import model.repository.BaseRepository;
import model.repository.UserRepo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserRepoImpl implements UserRepo {
    private BaseRepository baseRepo = new BaseRepository();

    @Override
    public List<User> getUserList() {
        List<User> userList = new ArrayList<>();

        try {
            Statement statement = baseRepo.getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery("select * from users;");

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");

                userList.add(new User(id, name, email, country));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return userList;
    }

    @Override
    public boolean addNewUser(User newUser) {
        try {
            PreparedStatement preparedStatement = baseRepo.getConnection().prepareStatement(
                    "insert into users(`name`, email, country) values\n" +
                            "(?, ?, ?);"
            );

            preparedStatement.setString(1, newUser.getName());
            preparedStatement.setString(2, newUser.getEmail());
            preparedStatement.setString(3, newUser.getCountry());

            return preparedStatement.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean updateUserById(int id, User user) {
        try {
            PreparedStatement preparedStatement = baseRepo.getConnection().prepareStatement(
                    "update users\n" +
                            "set `name` = ?, email = ?, country = ?\n" +
                            "where id = ?;" );

            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.setString(4, String.valueOf(id));

            return preparedStatement.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public User findUserById(int id) {
        User expectedUser = new User();
        try {
            PreparedStatement preparedStatement = baseRepo.getConnection().prepareStatement(
                    "select * from users\n" +
                            "where id = ?;" );
            preparedStatement.setString(1, String.valueOf(id));

            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                expectedUser.setId(id);
                expectedUser.setName(rs.getString("name"));
                expectedUser.setEmail(rs.getString("email"));
                expectedUser.setCountry(rs.getString("country"));
                return expectedUser;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return expectedUser;
    }

    @Override
    public boolean deleteUserById(int id) {
        try {
            PreparedStatement preparedStatement = baseRepo.getConnection().prepareStatement(
                    "DELETE FROM users\n" +
                            "WHERE id = ?;"
            );

            preparedStatement.setString(1, String.valueOf(id));
            return preparedStatement.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public List<User> findUserByCountry(String country) {
        List<User> userList = new ArrayList<>();

        try {
            if (country == null || country.length() == 0) {
                return getUserList();
            }

            PreparedStatement preparedStatement = baseRepo.getConnection().prepareStatement(
                    "select * from users\n" +
                            "where country like concat('%', ?, '%');"
            );
            preparedStatement.setString(1, country);

            ResultSet rs = preparedStatement.executeQuery();

            while(rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String userCountry = rs.getString("country");

                userList.add(new User(id, name, email, userCountry));
            }
            return userList;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    @Override
    public List<User> sortByName() {
        List<User> userList = new ArrayList<>();

        try {
            Statement statement = baseRepo.getConnection().createStatement();
            ResultSet rs = statement.executeQuery(
                    "select * from users\n" +
                            "order by name;"
            );

            while(rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String userCountry = rs.getString("country");

                userList.add(new User(id, name, email, userCountry));
            }
            return userList;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }
}
