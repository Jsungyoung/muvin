package com.example.muvin.domain.report;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ReportDto {

    private int no;
    private String category;
    private int placeNo;
    private int reportCode;
    private String content;
}
