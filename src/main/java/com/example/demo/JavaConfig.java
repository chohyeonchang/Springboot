package com.example.demo;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class JavaConfig {
	@Bean(destroyMethod="close")
	public DataSource dataSource() {
		DataSource ds = new DataSource();
		ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
		ds.setUrl("jdbc:mysql://localhost/boarddb?characterEncoding=utf8&&serverTimezone=UTC");
		ds.setUsername("root");
		ds.setPassword("1234");
		ds.setInitialSize(2);
		ds.setMaxActive(10);
		ds.setMinEvictableIdleTimeMillis(10* 1000);
		ds.setTestWhileIdle(true);
		return ds;
	}
	
	@Bean
	public UserDAO userDao() {
		return new UserDAO(dataSource());
	}
	
	@Bean
	public TableDAO tableDao() {
		return new TableDAO(dataSource());
	}
	
	@Bean
	public EiljungDAO eiljungDao() {
		return new EiljungDAO(dataSource());
	}
	
}
