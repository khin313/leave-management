package com.jdc.leaves.model.service;

import com.jdc.leaves.model.dto.input.LeaveForm;
import com.jdc.leaves.model.dto.output.LeaveListVO;
import com.jdc.leaves.model.dto.output.LeaveSummaryVO;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
public class LeaveService {

    public LeaveService() {
    }

    public List<LeaveListVO> search(Optional<Integer> classId,
                                    Optional<String> studentName,
                                    Optional<LocalDate> from,
                                    Optional<LocalDate> to) {
        // TODO implement here
        return List.of();
    }

    public LeaveForm findById(int id) {
        // TODO implement here
        return null;
    }

    public int save(LeaveForm form) {
        // TODO implement here
        return 0;
    }

    public List<LeaveSummaryVO> searchSummary(Optional<LocalDate> target) {
        // TODO implement here
        return null;
    }

}