package com.example.controller;

import com.example.entity.Role;
import com.example.entity.User;
import com.example.repos.UserRepos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Collections;

@Controller
public class RegistrationController {
    @Autowired
    private UserRepos userRepos;

    @GetMapping("/registration")
    public String registration(){
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Model model){

        User userFromDb = userRepos.findByUsername(user.getUsername());

        if(userFromDb != null){
            model.addAttribute("message", "Такой пользователь уже зарегестрирован!");
            return "registration";
        }
        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        userRepos.save(user);

        return "redirect:/login";
    }
}

