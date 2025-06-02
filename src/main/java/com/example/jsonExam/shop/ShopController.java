package com.example.jsonExam.shop;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ShopController {

	 @GetMapping("/shop")
	    public String shop() {
	        return "shop"; // → /jsp/shop.jsp
	    }
}
