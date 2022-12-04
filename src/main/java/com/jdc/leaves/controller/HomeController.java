package com.jdc.leaves.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.Optional;

@Controller
@RequestMapping("/home")
public class HomeController {


    @GetMapping
    public String index(@RequestParam Optional<LocalDate> targetDate,
                        ModelMap model) {
        // TODO implement here
        return "home";
    }

}