package com.example.jsonExam.campaign;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CampaignMapper {

    @Insert("INSERT INTO campaign (name, email, message) " +
            "VALUES (#{name}, #{email}, #{message})")
    void insertCampaign(CampaignDTO dto);
}
