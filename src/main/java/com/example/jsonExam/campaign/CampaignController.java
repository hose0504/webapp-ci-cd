package com.example.jsonExam.campaign;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CampaignController {

    @GetMapping("/campaign")
    public String campaignPage() {
        return "campaign"; // campaign.jsp로 forward
    }
}