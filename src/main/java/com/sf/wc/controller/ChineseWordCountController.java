package com.sf.wc.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 描述：
 * 
 * <pre>HISTORY
 * ****************************************************************************
 *  ID   DATE           PERSON          REASON
 *  1    2017年12月5日      Simba.Hua         Create
 * ****************************************************************************
 * </pre>
 * @author Simba.Hua
 */
@Controller
public class ChineseWordCountController {
	@Autowired
	@RequestMapping("/index")
	public ModelAndView index(){
		ModelAndView mv = new ModelAndView();
		Map<String,Integer> wordMap = new HashMap<>();
		wordMap.put("你", 10);
		wordMap.put("好", 20);
		mv.addObject("wordMap", "wordMap");
		mv.setViewName("index");
		return mv;
	}
}
