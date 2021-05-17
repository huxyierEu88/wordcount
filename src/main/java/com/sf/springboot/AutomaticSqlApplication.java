package com.sf.springboot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Import;
/**
 * 描述：
 * 
 * <pre>HISTORY
 * ****************************************************************************
 *  ID   DATE           PERSON          REASON
 *  1    2017-09-26      Simba.Hua         Create
 * ****************************************************************************
 * </pre>
 * @author Simba.Hua
 */
@SpringBootApplication
@Import(value = {ApplicationConfig.class})
public class AutomaticSqlApplication {

	public static void main(String[] args) {
		SpringApplication.run(AutomaticSqlApplication.class, args);
	}
}
