package com.user.example.service;

import com.user.example.entity.User;

import java.util.List;

public interface UserService {

    User saveUser(User user);

    List<User> getAllUser();

    User getUser(int id);

    void deleteUser(int id);
}
