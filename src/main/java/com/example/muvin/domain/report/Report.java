package com.example.muvin.domain.report;

import com.example.muvin.util.Timestamp;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "report")
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Getter
public class Report extends Timestamp {

    @Id
    private int no;
    private String category;
    private int placeNo;
    private int reportCode;
    private String content;

    public Report(ReportDto reportDto){
        this.category = reportDto.getCategory();
        this.placeNo = reportDto.getPlaceNo();
        this.reportCode = reportDto.getReportCode();
        this.content = reportDto.getContent();
    }
}
