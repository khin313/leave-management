package com.jdc.leaves.controller;

import com.jdc.leaves.model.dto.input.TeacherForm;
import com.jdc.leaves.model.dto.output.TeacherListVO;
import com.jdc.leaves.model.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Optional;

@Controller
@RequestMapping("/teachers")
public class TeacherController {

    @Autowired
    private TeacherService service;

    @GetMapping
    public String index(@RequestParam Optional<String> name,
                        @RequestParam Optional<String> phone,
                        @RequestParam Optional<String> email,
                        ModelMap model) {
        var result = service.search(name, phone, email);
        model.put("list", result);
        return "teachers/teachers";
    }

    @GetMapping("edit")
    public String edit(@RequestParam Optional<Integer> id) {
        return "teachers/teachers-edit";
    }

    @PostMapping
    public String save(@Valid @ModelAttribute(name = "form") TeacherForm form, BindingResult result) {
        if (result.hasErrors()) {
            return "teachers/teachers-edit";
        }
        service.save(form);
        return "redirect:/teachers";
    }

    @ModelAttribute(name = "form")
    TeacherForm form(@RequestParam Optional<Integer> id) {
        return id
                .filter(a -> a > 0)
                .map(service::findById)
                .map(TeacherListVO::form)
                .orElse(new TeacherForm());
    }

}