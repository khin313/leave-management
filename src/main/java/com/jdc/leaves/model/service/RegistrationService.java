package com.jdc.leaves.model.service;

import com.jdc.leaves.model.dto.input.RegistrationForm;
import com.jdc.leaves.model.dto.output.RegistrationDetailsVO;
import com.jdc.leaves.model.dto.output.RegistrationListVO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RegistrationService {

	public List<RegistrationListVO> searchByClassId(int id) {
		// TODO implement here
		return List.of();
	}

	public int save(RegistrationForm form) {
		// TODO implement here
		return 0;
	}

	public RegistrationDetailsVO findDetailsById(int id) {
		// TODO implement here
		return null;
	}

    public RegistrationForm getFormById(int id) {
		var form = new RegistrationForm();
		form.setClassId(id);
		return form;
    }
}