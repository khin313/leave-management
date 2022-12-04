package com.jdc.leaves.model.dto.input;

import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotEmpty;
import java.time.LocalDate;

public class RegistrationForm {
    public RegistrationForm() {
    }

    public RegistrationForm(int classId, int studentId, LocalDate regisDate, String studentName, String email, String phone, String education) {
        this.classId = classId;
        this.studentId = studentId;
        this.regisDate = regisDate;
        this.studentName = studentName;
        this.email = email;
        this.phone = phone;
        this.education = education;
    }

    private int classId;
    private int studentId;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate regisDate;
    @NotEmpty(message = "Please Enter Student Name")
    private String studentName;
    @NotEmpty(message = "Please Enter Student Email")
    private String email;
    @NotEmpty(message = "Please Enter Student Phone")
    private String phone;
    private String education;

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public LocalDate getRegisDate() {
        return regisDate;
    }

    public void setRegisDate(LocalDate regisDate) {
        this.regisDate = regisDate;
    }
}