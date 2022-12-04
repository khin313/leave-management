package com.jdc.leaves.controller;

import com.jdc.leaves.model.dto.input.LeaveForm;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.time.LocalDate;
import java.util.Optional;

@Controller
@RequestMapping("/leaves")
public class LeaveController {

    @GetMapping
    public String index(@RequestParam Optional<Integer> classId,
                        @RequestParam Optional<String> studentName,
                        @RequestParam Optional<LocalDate> from,
                        @RequestParam Optional<LocalDate> to,
                        ModelMap model) {
        return "leaves/all-leaves";
    }

    @GetMapping("edit")
    public String edit(@RequestParam int classId, @RequestParam int studentId) {

        return "leaves/leaves-edit";
    }

    @PostMapping
    public String save(@Valid @ModelAttribute LeaveForm form, BindingResult result) {
        if (result.hasErrors()) {
            return "leaves/leaves-edit";
        }
        return "";
    }

    @ModelAttribute("form")
    LeaveForm form(@RequestParam(required = false) Integer classId,
                   @RequestParam(required = false) Integer studentId) {
        if (classId != null && studentId != null) {
            return new LeaveForm(classId, studentId);
        }

        return null;
    }

}