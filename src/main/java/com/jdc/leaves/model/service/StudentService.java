package com.jdc.leaves.model.service;

import com.jdc.leaves.model.dto.output.StudentListVO;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class StudentService {

	public StudentService() {
	}

	public List<StudentListVO> search(Optional<String> name,
									  Optional<String> phone,
									  Optional<String> email) {
		// TODO implement here
		return List.of();
	}

}