package com.example.jsonExam.information;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class InformationController {

	@GetMapping("/information")
    public String campaignPage() {
        return "information"; // campaign.jsp로 forward
    }
}
