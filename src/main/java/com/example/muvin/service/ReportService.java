package com.example.muvin.service;

import com.example.muvin.domain.movie.MovieRepository;
import com.example.muvin.domain.report.Report;
import com.example.muvin.domain.report.ReportDto;
import com.example.muvin.domain.report.ReportRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class ReportService {

    @Autowired
    private ReportRepository repository;

    public List<Report> readReportAll(){
        return repository.findAll();
    }
    public void addReport(Report report){
        repository.save(report);
    }
}