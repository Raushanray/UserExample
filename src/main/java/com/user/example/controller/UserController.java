package com.user.example.controller;

import com.user.example.entity.User;
import com.user.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/")
    public User createUser(@RequestBody User user){
        return userService.saveUser(user);
    }

    @GetMapping("/")
    public List<User> getAll(){
        return userService.getAllUser();
    }

    @GetMapping("/{id}")
    public User getUserById(@PathVariable int id){
        return userService.getUser(id);
    }

    @DeleteMapping("/{id}")
    public void deleteUserById(@PathVariable int id){
        userService.deleteUser(id);
    }
}
