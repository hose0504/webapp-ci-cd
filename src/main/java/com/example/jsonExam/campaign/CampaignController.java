package com.example.jsonExam.campaign;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;


@Controller
@RequestMapping("/campaign")
public class CampaignController {

    private final CampaignService campaignService;

    public CampaignController(CampaignService campaignService) {
        this.campaignService = campaignService;
    }

    // 캠페인 참여 페이지 표시
    @GetMapping
    public String showJoinForm() {
        return "campaign"; // campaign.jsp (이게 META-INF/resources/WEB-INF/campaign.jsp를 의미)
    }

    
    // 참여 POST 처리
    @PostMapping("/join")
    @ResponseStatus(HttpStatus.OK)
    public void submitJoinForm(@ModelAttribute CampaignDTO dto) {
        campaignService.joinCampaign(dto);
    }
}
