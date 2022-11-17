package com.example.muvin.domain.place_review;



import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Id;
import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Place_reviewDto {
    @Id
    private long no; // pk
    private Date visit_date;
    private String pr_nickname;
    private String title;
    private String content;
    private double score;
}
