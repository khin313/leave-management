package com.jdc.leaves.model.dto.input;

import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.time.LocalDate;

public class ClassForm {

    public ClassForm() {
    }

    public ClassForm(int id, int teacher, LocalDate start, int months, String description) {
        this.id = id;
        this.teacher = teacher;
        this.start_date = start;
        this.months = months;
        this.description = description;
    }

    private int id;
    @Min(value = 1, message = "Select Teacher")
    private int teacher;
    @NotNull(message = "Please Enter Start Date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate start_date;
    @Min(value = 1, message = "Please Enter duration")
    private int months;
    @NotEmpty(message = "Please Enter Description")
    private String description;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTeacher() {
        return teacher;
    }

    public void setTeacher(int teacher) {
        this.teacher = teacher;
    }

    public LocalDate getStart_date() {
        return start_date;
    }

    public void setStart_date(LocalDate start_date) {
        this.start_date = start_date;
    }

    public int getMonths() {
        return months;
    }

    public void setMonths(int months) {
        this.months = months;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "ClassForm{" +
                "id=" + id +
                ", teacher=" + teacher +
                ", start_date=" + start_date +
                ", months=" + months +
                ", description='" + description + '\'' +
                '}';
    }
}