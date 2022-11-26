package com.example.muvin.controller;

import com.example.muvin.domain.report.Report;
import com.example.muvin.domain.report.ReportDto;
import com.example.muvin.service.ReportService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RequiredArgsConstructor
public class ReportController {

    @Autowired
    private ReportService reportService;

    @GetMapping("/manager")
    public String manager(){
        return "/manager";
    }

    @RequestMapping("/add/report")
    public void addReport(ReportDto reportDto){
        Report report = new Report(reportDto);
        reportService.addReport(report);
    }

    @GetMapping("/report")
    public String myTvList(@RequestParam String contentData) {
        return "report";
    }
}
