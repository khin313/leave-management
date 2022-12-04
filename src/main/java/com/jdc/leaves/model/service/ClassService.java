package com.jdc.leaves.model.service;

import com.jdc.leaves.model.dto.input.ClassForm;
import com.jdc.leaves.model.dto.output.ClassDetailsVO;
import com.jdc.leaves.model.dto.output.ClassListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.sql.DataSource;
import java.sql.Date;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class ClassService {
    @Autowired
    private RegistrationService registrationService;
    @Autowired
    private LeaveService leaveService;

    private static final String SELECT_PROJECTION = """
            select c.id id , t.id teacherId, a.name teacherName, t.phone teacherPhone,
            c.start_date startDate, c.months months,
            c.description description, count(r.classes_id) studentCount
            from classes c join teacher t on c.teacher_id = t.id
            join account a on a.id = t.id
            left join registration r on c.id = r.classes_id where 1 = 1
            """;
    private static final String SELECT_GROUPBY = " group by c.id, t.id, a.name, t.phone, c.start_date, c.months, c.description";
    private NamedParameterJdbcTemplate jdbcTemplate;
    private SimpleJdbcInsert insert;

    public ClassService(DataSource dataSource) {
        jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);

        insert = new SimpleJdbcInsert(dataSource);
        insert.setTableName("classes");
        insert.setGeneratedKeyName("id");
        insert.setColumnNames(List.of("teacher_id", "start_date", "months", "description"));
    }

    public List<ClassListVO> search(Optional<String> teacher,
                                    Optional<LocalDate> from,
                                    Optional<LocalDate> to) {
        var sb = new StringBuffer(SELECT_PROJECTION);

        var params = new HashMap<String, Object>();
        sb.append(teacher
                .filter(StringUtils::hasText)
                .map(s -> {
                    params.put("teacher", s.toLowerCase().concat("%"));
                    return "and lower(a.name) like :teacher";
                }).orElse(""));
        sb.append(from
                .map(s -> {
                    params.put("from", Date.valueOf(s));
                    return "and c.start_date >= :from";
                }).orElse(""));
        sb.append(to
                .map(s -> {
                    params.put("to", Date.valueOf(s));
                    return "and c.start_date <= :to";
                }).orElse(""));

        sb.append(SELECT_GROUPBY);

        return jdbcTemplate.query(sb.toString(), params, new BeanPropertyRowMapper<>(ClassListVO.class));
    }

    public ClassForm findById(int id) {
        return jdbcTemplate.queryForObject(
                "select * from classes where id = :id",
                Map.of("id", id),
                new BeanPropertyRowMapper<>(ClassForm.class)
        );
    }

    public int save(ClassForm form) {
        if (form.getId() == 0) {
            return insert(form);
        }
        return update(form);
    }


    public ClassDetailsVO findDetailsById(int id) {
        var result = new ClassDetailsVO();

        // Class Info
        var sql = "%s and c.id = :id %s".formatted(SELECT_PROJECTION, SELECT_GROUPBY);
        var classListVo = jdbcTemplate
                .queryForObject(sql, Map.of("id", id), new BeanPropertyRowMapper<>(ClassListVO.class));
        result.setClassInfo((ClassListVO) classListVo);

        // Registration For Class
        result.setRegistrations(registrationService.searchByClassId(id));

        // Leave For Class
        result.setLeaves(leaveService.search(
                Optional.of(id),
                Optional.empty(),
                Optional.empty(),
                Optional.empty()));
        return result;
    }

    private int update(ClassForm form) {
        jdbcTemplate.update("""
                update classes set teacher_id = :teacher, months = :months,
                start_date = :start, description = :desc where id = :id
                """, Map.of(
                "teacher", form.getTeacher(),
                "months", form.getMonths(),
                "start", Date.valueOf(form.getStart_date()),
                "desc", form.getDescription(),
                "id", form.getId())
        );

        return form.getId();
    }

    private int insert(ClassForm form) {
        var generatedId = insert.executeAndReturnKey(Map.of(
                "teacher_id", form.getTeacher(),
                "start_date", Date.valueOf(form.getStart_date()),
                "months", form.getMonths(),
                "description", form.getDescription()
        ));
        return generatedId.intValue();
    }


}