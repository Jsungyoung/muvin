package com.example.muvin;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@EnableJpaAuditing
@SpringBootApplication
public class MuvinApplication {

    public static void main(String[] args) {
        SpringApplication.run(MuvinApplication.class, args);
    }

}
