package com.example.muvin.controller;

import com.example.muvin.domain.report.Report;
import com.example.muvin.service.ReportService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequiredArgsConstructor
@RestController
public class adminController {
    @Autowired
    private ReportService reportService;

    @GetMapping("/v1/reportAll")
    public List<Report> getReportAll(){
        return reportService.readReportAll();
    }
    @DeleteMapping("/del/report")
    public void delReport(@RequestParam int no){
        reportService.delReportByNo(no);
    }
}
