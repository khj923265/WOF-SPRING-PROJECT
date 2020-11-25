package org.wof.domain;

import lombok.Data;

import java.util.List;

@Data
public class MemberVO {
    private String member_no;
    private String userid;
    private String userpw;
    private String real_name;
    private String userphone;
    private String auth;
    private String status;
    private String register_date;
    private String login_date;
    private String dorment_date;
    private String signout_date;
    private int total_point;
    private double total_evaluate;

    private List<AuthVO> authList;
}
