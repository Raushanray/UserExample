package com.user.example.service.impl;

import com.sun.jdi.request.InvalidRequestStateException;
import com.user.example.entity.User;
import com.user.example.repo.UserRepository;
import com.user.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;
    @Override
    public User saveUser(User user) {
        return userRepository.save(user);
    }

    @Override
    public List<User> getAllUser() {
        return userRepository.findAll();
    }

    @Override
    public User getUser(int id) {
        User user = userRepository.findById(id).orElseThrow(() -> new InvalidRequestStateException("user not found with given id!!"));
        return  user;
    }

    @Override
    public void deleteUser(int id) {
        userRepository.deleteById(id);
    }
}
