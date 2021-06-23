package com.levart.hibernate.utils;

import org.springframework.context.annotation.Configuration;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class MailConfig {
	@Bean
	public JavaMailSender getMailSender() {
		JavaMailSenderImpl mailSender=new JavaMailSenderImpl();
		//Using gmail
		mailSender.setHost("smtp.gmail.com");
		mailSender.setPort(587);
		mailSender.setUsername("thomnd131200@gmail.com");
		mailSender.setPassword("pastwent12345");
		
		Properties props = new Properties();
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.trust","smtp.gmail.com	");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.debug", "true");
		mailSender.setJavaMailProperties(props);
		return mailSender;
	}

}
