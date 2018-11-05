package com.example.controller;

import com.example.entity.Role;
import com.example.entity.User;
import com.example.repos.UserRepos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserRepos userRepos;

    @GetMapping
    public String userList(Model model){
        model.addAttribute("users",userRepos.findAll());
        return "userList";
    }

    @GetMapping("{user}")
    //user/user_id
    public String userEdit(@PathVariable User user, Model model){
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());

        return "userEdit";
    }

}
