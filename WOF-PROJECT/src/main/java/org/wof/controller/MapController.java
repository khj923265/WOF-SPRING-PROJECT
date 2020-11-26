package org.wof.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@RequestMapping("/map/*")
@Controller
@AllArgsConstructor
@Log4j
public class MapController {

	@GetMapping("/project_map_manage")
	public void getMap() {
		log.info("map controller");
	}
}
