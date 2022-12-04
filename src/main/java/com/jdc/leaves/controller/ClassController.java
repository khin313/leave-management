package com.jdc.leaves.controller;

import com.jdc.leaves.model.dto.input.ClassForm;
import com.jdc.leaves.model.dto.input.RegistrationForm;
import com.jdc.leaves.model.service.ClassService;
import com.jdc.leaves.model.service.RegistrationService;
import com.jdc.leaves.model.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.Optional;

@Controller
@RequestMapping("/classes")
public class ClassController {

    @Autowired
    private RegistrationService registrationService;

    @Autowired
    private ClassService classService;

    @Autowired
    private TeacherService teacherService;


    @GetMapping
    public String index(@RequestParam Optional<String> teacher,
                        @RequestParam Optional<LocalDate> from,
                        @RequestParam Optional<LocalDate> to,
                        ModelMap model) {
        var result = classService.search(teacher, from, to);
        model.put("list", result);

        return "classes/all-class";
    }

    @GetMapping("edit")
    public String edit(@RequestParam Optional<Integer> id,
                       ModelMap model) {
        model.put("teachers", teacherService.getAvailableTeachers());
        return "classes/class-edit";
    }

    @PostMapping
    public String save(@Valid @ModelAttribute(name = "classForm") ClassForm form, BindingResult result) {

        if (result.hasErrors()) {
            return "classes/class-edit";
        }
        // save form
        var id = classService.save(form);
        return "redirect:/classes/%d".formatted(id);
    }

    @GetMapping("{id}")
    public String showDetails(@PathVariable int id,
                              ModelMap model) {
        var result = classService.findDetailsById(id);
        model.put("dto", result);
        return "classes/class-detail";
    }

    @GetMapping("registration")
    public String editRegistration(
            @RequestParam(required = false, defaultValue = "0") int registId,
            @RequestParam(required = false, defaultValue = "0") int classId,
            ModelMap model) {

        ClassForm classServiceById = classService.findById(classId);
        System.out.println(classServiceById.toString());
        model.put("classInf", classServiceById);
        return "registration/registration-edit";
    }

    @PostMapping("registration")
    public String saveRegistration(@Valid @ModelAttribute(name = "registForm") RegistrationForm form, BindingResult result) {
        if (result.hasErrors()) {
            return "registration/registration-edit";
        }
        var id = registrationService.save(form);
        return "redirect:/classes/registration/%d".formatted(id);
    }

    @GetMapping("registration/{id}")
    public String showRegistrationDetails(@PathVariable int id,
                                          ModelMap model) {
        var result = registrationService.findDetailsById(id);
        model.put("dto", result);
        return "registration/registration-detail";
    }

    @ModelAttribute(name = "classForm")
    ClassForm classForm(Optional<Integer> id) {
        return id
                .filter(a -> a > 0)
                .map(classService::findById)
                .orElse(new ClassForm());
    }

    @ModelAttribute(name = "registForm")
    RegistrationForm registForm(
            @RequestParam(required = false, defaultValue = "0") int registId,
            @RequestParam(required = false, defaultValue = "0") int classId) {
        // Edit
        if (registId > 0) {
            return registrationService.getFormById(registId);
        }
        // Add new
        var form = new RegistrationForm();
        form.setClassId(classId);
        return form;
    }

}