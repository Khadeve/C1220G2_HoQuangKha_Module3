package model.service.impl;

import model.bean.User;
import model.repository.UserRepo;
import model.repository.impl.UserRepoImpl;
import model.service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {
    private UserRepo userRepo = new UserRepoImpl();

    @Override
    public List<User> getUserList() {
        return userRepo.getUserList();
    }

    @Override
    public boolean addNewUser(User newUser) {
        return userRepo.addNewUser(newUser);
    }

    @Override
    public boolean updateUserById(int id, User user) {
        return userRepo.updateUserById(id, user);
    }

    @Override
    public User findUserById(int id) {
        return userRepo.findUserById(id);
    }

    @Override
    public boolean deleteUserById(int id) {
        return userRepo.deleteUserById(id);
    }

    @Override
    public List<User> findUserByCountry(String country) {
        return userRepo.findUserByCountry(country);
    }

    @Override
    public List<User> sortByName() {
        return userRepo.sortByName();
    }
}
