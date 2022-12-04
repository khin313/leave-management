package com.jdc.leaves.model.dto.input;

import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.time.LocalDate;

public class LeaveForm {

    public LeaveForm() {
    }

    public LeaveForm(int classId, int student) {
        this.classId = classId;
        this.student = student;
    }

    public LeaveForm(int classId, int student, LocalDate startDate, LocalDate applyDate, int days, String reason) {
        this.classId = classId;
        this.student = student;
        this.startDate = startDate;
        this.applyDate = applyDate;
        this.days = days;
        this.reason = reason;
    }

    private int classId;

    private int student;
    @NotNull(message = "Please Leave Start Date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate startDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate applyDate;

    @Min(value = 1, message = "Please Enter leave days")
    private int days;
    @NotEmpty(message = "Please Enter Reason")
    private String reason;

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    public int getStudent() {
        return student;
    }

    public void setStudent(int student) {
        this.student = student;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public int getDays() {
        return days;
    }

    public void setDays(int days) {
        this.days = days;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public LocalDate getApplyDate() {
        return applyDate;
    }

    public void setApplyDate(LocalDate applyDate) {
        this.applyDate = applyDate;
    }
}