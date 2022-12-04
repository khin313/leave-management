package com.jdc.leaves.model.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.context.event.EventListener;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.annotation.Transactional;

import javax.sql.DataSource;
import java.util.List;
import java.util.Map;

public class AdminUserInitializer {

    private DataSource dataSource;

    @Autowired
    private PasswordEncoder encoder;

    public AdminUserInitializer(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @EventListener(classes = ContextRefreshedEvent.class)
    void initAdminUser() {
        if (isNoAdminUser()) {
            // create Admin User
            createAdminUser();
        }

    }

    @Transactional
    void createAdminUser() {
        var insert = new SimpleJdbcInsert(dataSource);
        insert.setTableName("account");
        insert.usingGeneratedKeyColumns("id");
        insert.setColumnNames(List.of(
                "name", "role", "email", "password"
        ));

        insert.execute(Map.of(
                "name", "admin",
                "role", "ADMIN",
                "email", "admin@gmail.com",
                "password", encoder.encode("admin")
        ));
    }

    private boolean isNoAdminUser() {
        return new NamedParameterJdbcTemplate(dataSource).queryForObject(
                "select count(id) from account where role = :role",
                Map.of("role", "ADMIN"),
                Long.class) == 0;
    }
}
