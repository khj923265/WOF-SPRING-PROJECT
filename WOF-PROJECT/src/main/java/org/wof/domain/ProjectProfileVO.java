package org.wof.domain;

import java.time.LocalDate;
import lombok.Data;

@Data
public class ProjectProfileVO {
    String no;
    String userid;
    String name;
    String skill;
    String field;
    String responsibilities;
    String startdate;
    String enddate;
    String profile;
    LocalDate startDateFormat;
    LocalDate endDateFormat;
}
