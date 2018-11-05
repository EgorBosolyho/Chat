package com.example.controller;

import com.example.entity.Role;
import com.example.entity.User;
import com.example.repos.UserRepos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

@Controller
@RequestMapping("/user")
@PreAuthorize("hasAuthority('ADMIN')")
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

    @PostMapping
    public String saveEdit(
            @RequestParam("userId") User user,
            @RequestParam Map<String, String> chekbox,
            @RequestParam String userName){

        user.getRoles().clear();
        user.setUsername(userName);

        Role[] roles = Role.values();
        Set<String> setRoles = new HashSet<>();
        for(Role r: roles){
            setRoles.add(r.toString());
        }
        for(String key: chekbox.keySet()){
            if(setRoles.contains(key)){
                user.getRoles().add(Role.valueOf(key));
            }
        }

        userRepos.save(user);
        return "redirect:/user";
    }

}
