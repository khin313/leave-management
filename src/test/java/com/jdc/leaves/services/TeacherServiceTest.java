package com.jdc.leaves.services;

import com.jdc.leaves.model.dto.input.TeacherForm;
import com.jdc.leaves.model.service.TeacherService;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;

import java.time.LocalDate;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

@SpringJUnitConfig(locations = "/root-config.xml")
public class TeacherServiceTest {

    @Autowired
    private TeacherService service;

    @ParameterizedTest
    @Sql(scripts = "/sql/truncate.sql")
    @CsvSource(value = "0, Maung Maung, 09987898987, maung@gmail.com, 2022-09-01")
    void save_insert_success(int id, String name, String phone, String email, LocalDate assignDate) {
        var form = new TeacherForm(id, name, phone, email, assignDate);
        var result = service.save(form);

        assertEquals(1, result);
    }

    @ParameterizedTest
    @Sql(scripts = {
            "/sql/truncate.sql",
            "/sql/teachers.sql"
    })
    @CsvSource(value = {
            "1, Maung Maung, 09986547898, mg@gmail.com, 2022-08-01, 2",
            "2, Aung Aung, 09956251558, aung@gmail.com, 2022-09-01, 1",
            "3, Thidar, 09922598758, thi@gmail.com, 2022-10-01, 0"
    })
    void find_by_id_test(int id, String name, String phone, String email, LocalDate assignDate, int classCount) {
        var result = service.findById(id);
        assertEquals(name, result.getName());
        assertEquals(phone, result.getPhone());
        assertEquals(email, result.getEmail());
        assertEquals(assignDate, result.getAssignDate());
        assertEquals(classCount, result.getClassCount());
    }

    @ParameterizedTest
    @Sql(scripts = {
            "/sql/truncate.sql",
            "/sql/teachers.sql"
    })
    @CsvSource(value = {
            ",,,3",
            "thi,,,1",
            "myo,,,0",
            "thi,09922,,1",
            "thi,08922,,0",
            ",09922,,1 ",
            ",,aung,1 ",
            ",,myo,0 ",
            ",,aung,1",
            "aung,09956251558,aung@gmail,1 ",

    })
    void search_test(String name, String phone, String email, int count) {
        var result = service.search(
                Optional.ofNullable(name),
                Optional.ofNullable(phone),
                Optional.ofNullable(email));

        assertEquals(count, result.size());

    }

}
