package com.example.jsonExam;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

@SpringBootApplication(exclude = SecurityAutoConfiguration.class)
public class ProjectTeam5Application {

	public static void main(String[] args) {
		SpringApplication.run(ProjectTeam5Application.class, args);
	}

}
