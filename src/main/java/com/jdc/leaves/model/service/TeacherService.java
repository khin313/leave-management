package com.jdc.leaves.model.service;

import com.jdc.leaves.model.dto.input.TeacherForm;
import com.jdc.leaves.model.dto.output.IdWithName;
import com.jdc.leaves.model.dto.output.TeacherListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import javax.sql.DataSource;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class TeacherService {

    private static final String SELECT_PROJECTION = """
            select t.id, a.name, t.phone, a.email, t.assign_date assignDate, count(c.id) class_count
             from teacher t join account a on a.id = t.id left join classes c on c.teacher_id = t.id
            """;
    private static final String SELECT_GROUP_BY = """
            group by t.id, a.name, t.phone, a.email, t.assign_date
            """;
    private NamedParameterJdbcTemplate jdbcTemplate;
    private SimpleJdbcInsert accountInsert;
    private SimpleJdbcInsert teacherInsert;
    private RowMapper<TeacherListVO> mapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public TeacherService(DataSource dataSource) {
        jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);

        accountInsert = new SimpleJdbcInsert(dataSource);
        accountInsert.setTableName("account");
        accountInsert.setGeneratedKeyName("id");
        accountInsert.setColumnNames(List.of(
                "name", "role",
                "email", "password"
        ));

        teacherInsert = new SimpleJdbcInsert(dataSource);
        teacherInsert.setTableName("teacher");

        mapper = new BeanPropertyRowMapper<>(TeacherListVO.class);
    }

    public List<TeacherListVO> search(Optional<String> name,
                                      Optional<String> phone,
                                      Optional<String> email) {
        var where = new StringBuffer();
        var params = new HashMap<String, Object>();

        // dynamic query
        where.append(email.filter(StringUtils::hasLength).map(a -> {
            params.put("email", a.concat("%"));
            return "and a.email like :email ";
        }).orElse(""));

        where.append(phone.filter(StringUtils::hasLength).map(a -> {
            params.put("phone", a.concat("%"));
            return "and t.phone like :phone ";
        }).orElse(""));

        where.append(name.filter(StringUtils::hasLength).map(a -> {
            params.put("name", a.toLowerCase().concat("%"));
            return "and lower(a.name) like :name ";
        }).orElse(""));

        var sql = "%s where 1=1 %s %s".formatted(SELECT_PROJECTION, where.toString(), SELECT_GROUP_BY);
        return jdbcTemplate.query(sql, params, mapper);
    }

    public TeacherListVO findById(int id) {
        var sql = "%s where %s %s".formatted(SELECT_PROJECTION, "t.id = :id", SELECT_GROUP_BY);

        return jdbcTemplate.queryForObject(sql, Map.of("id", id), mapper);
    }

    @Transactional
    public int save(TeacherForm form) {
        if (form.getId() == 0) {
            return insert(form);
        } else {
            return update(form);
        }
    }

    private int insert(TeacherForm form) {
        // Insert into Account
        var generateId = accountInsert.executeAndReturnKey(Map.of(
                "name", form.getName(),
                "role", "TEACHER",
                "email", form.getEmail(),
                "password", passwordEncoder.encode(form.getPhone())
        ));
        // Insert into Teacher
        teacherInsert.execute(Map.of(
                "id", generateId.intValue(),
                "phone", form.getPhone(),
                "assign_date", Date.valueOf(form.getAssignDate())
        ));

        return generateId.intValue();
    }

    private int update(TeacherForm form) {
        // Update Account Table
        jdbcTemplate.update(
                "update account set name = :name where id = :id",
                Map.of(
                        "name", form.getName(),
                        "id", form.getId()
                ));
        // Update Teacher Table
        jdbcTemplate.update(
                "update teacher set phone = :phone, assign_date = :assign where id = :id",
                Map.of(
                        "phone", form.getPhone(),
                        "assign", Date.valueOf(form.getAssignDate()),
                        "id", form.getId()
                ));


        return form.getId();
    }

    public List<IdWithName> getAvailableTeachers() {

        return jdbcTemplate.query("select t.id, a.name from teacher t join account a on t.id = a.id where a.deleted = :del",
                Map.of("del", false),
                new BeanPropertyRowMapper<>(IdWithName.class));
    }
}