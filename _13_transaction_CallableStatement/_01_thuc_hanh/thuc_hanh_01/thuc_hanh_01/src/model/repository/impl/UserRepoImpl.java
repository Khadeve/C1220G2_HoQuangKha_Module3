package model.repository.impl;

import model.bean.User;
import model.repository.BaseRepository;
import model.repository.UserRepo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepoImpl implements UserRepo {
    private BaseRepository baseRepo = new BaseRepository();

    @Override
    public List<User> getUserList() {
        List<User> userList = new ArrayList<>();

        try {
            Connection connection = baseRepo.getConnection();
            CallableStatement callableStatement = connection.prepareCall(
                    "call getUserList();"
            );
            ResultSet resultSet = callableStatement.executeQuery();

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
            Connection conn = baseRepo.getConnection();
            CallableStatement callableStatement = conn.prepareCall(
                    "call addNewUser(?, ?, ?);"
            );

            callableStatement.setString(1, newUser.getName());
            callableStatement.setString(2, newUser.getEmail());
            callableStatement.setString(3, newUser.getCountry());

            callableStatement.executeUpdate();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean updateUserById(int id, User user) {
        try {
            Connection connection = baseRepo.getConnection();
            CallableStatement callableStatement = connection.prepareCall(
                    "call updateUserById(?, ?, ?, ?);"
            );

            callableStatement.setInt(1, id);
            callableStatement.setString(2, user.getName());
            callableStatement.setString(3, user.getEmail());
            callableStatement.setString(4, user.getCountry());

            callableStatement.executeUpdate();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public User findUserById(int id) {
        User expectedUser = new User();
        try {
            CallableStatement cs = baseRepo.getConnection().prepareCall("call findUserById(?);");
            cs.setString(1, String.valueOf(id));
            ResultSet rs = cs.executeQuery();

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
            Connection connection = baseRepo.getConnection();
            CallableStatement callableStatement = connection.prepareCall(
                    "CALL deleteUserById(?);"
            );

            callableStatement.setInt(1, id);
            callableStatement.executeUpdate();
            return true;

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

            while (rs.next()) {
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

            while (rs.next()) {
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
    public boolean addPermissionForUser(User user, int[] permissions) {
        Connection conn = baseRepo.getConnection();

        try {
            conn.setAutoCommit(false);
            int affectedRow = 0;
            PreparedStatement psInsertPermissions = conn.prepareStatement(
                    "INSERT INTO user_permission VALUES\n" +
                            "\t(?, ?);"
            );

            for (int permission : permissions) {
                psInsertPermissions.setInt(1, user.getId());
                psInsertPermissions.setInt(2, permission);
                int counter = affectedRow;
                affectedRow += psInsertPermissions.executeUpdate();
                if (affectedRow == counter) break;
            }

            // all success.
            if (affectedRow == permissions.length) {
                conn.commit();
                return true;
            }

            conn.rollback();
            return false;
        } catch (SQLException e) {
            try {
                conn.rollback();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return false;
    }

    @Override
    public boolean addUserTransaction(User newUser, int[] permissions) {
        Connection connection = baseRepo.getConnection();

        try {
            connection.setAutoCommit(false);
            int affectedRecords = 0;
            // first, insert base information of the new user.
            PreparedStatement psInsertUser = connection.prepareStatement(
                    "INSERT INTO users(`name`, email, country) VALUES\n" +
                            "\t(?, ?, ?)", Statement.RETURN_GENERATED_KEYS
            );

            psInsertUser.setString(1, newUser.getName());
            psInsertUser.setString(2, newUser.getEmail());
            psInsertUser.setString(3, newUser.getCountry());
            affectedRecords = psInsertUser.executeUpdate();

            ResultSet resultSet = psInsertUser.getGeneratedKeys();
            int id = 0;
            if (resultSet.next()) {
                id = resultSet.getInt(1);
            }

            // check whether first step is successful, if true then add permissions.
            if (affectedRecords == 1) {
                PreparedStatement psInsertPermissions = connection.prepareStatement(
                        "INSERT INTO user_permission VALUES\n" +
                                "\t(?, ?);"
                );

                for (int permission : permissions) {
                    psInsertPermissions.setInt(1, id);
                    psInsertPermissions.setInt(2, permission);
                    int counter = affectedRecords;
                    affectedRecords += psInsertPermissions.executeUpdate();
                    if (affectedRecords == counter) break;
                }

                if (affectedRecords == (1 + permissions.length)) {
                    connection.commit();
                    return true;
                }
                connection.rollback();
                return false;
            }

        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return false;
    }
}
