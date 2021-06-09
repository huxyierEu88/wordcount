package com.sf.wc.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
		
		String text = "海纳百川，有容乃大；壁立千仞，无欲则刚...";
		Map<Character,Integer> counter = new HashMap<>();
		for(int i = 0; i < text.length(); i++){
			char ch = text.charAt(i);
			if(ch < 0x4E00 || ch > 0x9FA5)
				continue;
			counter.put(ch, counter.get(ch) == null ? 0 : counter.get(ch) + 1);			
		}
		
		List<Map.Entry<Character,Integer>> list = new ArrayList<>(counter.entrySet());
		list.sort((o1,o2) -> o1.getValue() - o2.getValue());
		list.subList(0, 9);		
		
		mv.addObject("list", list);
		return mv;
	}
}
