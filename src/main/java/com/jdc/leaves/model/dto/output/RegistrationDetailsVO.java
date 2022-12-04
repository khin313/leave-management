package com.jdc.leaves.model.dto.output;

import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

public class RegistrationDetailsVO {

    public RegistrationDetailsVO() {
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate registDate;

    private ClassListVO classInfo;

    private StudentListVO student;

    public ClassListVO getClassInfo() {
        return classInfo;
    }

    public void setClassInfo(ClassListVO classInfo) {
        this.classInfo = classInfo;
    }

    public StudentListVO getStudent() {
        return student;
    }

    public void setStudent(StudentListVO student) {
        this.student = student;
    }
}