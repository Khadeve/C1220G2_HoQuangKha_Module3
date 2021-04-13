package model.repository;

import model.bean.User;

import java.util.List;

public interface UserRepo {

    List<User> getUserList();

    boolean addNewUser(User newUser);

    boolean updateUserById(int id, User user);

    User findUserById(int id);

    boolean deleteUserById(int id);

    List<User> findUserByCountry(String country);

    List<User> sortByName();
}
