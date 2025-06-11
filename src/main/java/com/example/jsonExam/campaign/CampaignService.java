package com.example.jsonExam.campaign;

import org.springframework.stereotype.Service;

@Service
public class CampaignService {

	private final CampaignMapper campaignMapper;
	
	public CampaignService(CampaignMapper campaignMapper) {
        this.campaignMapper = campaignMapper;
    }

    public void joinCampaign(CampaignDTO dto) {
        campaignMapper.insertCampaign(dto);
    }
}
