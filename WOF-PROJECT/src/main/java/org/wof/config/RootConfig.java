package org.wof.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@ComponentScan(basePackages={"org.wof.service"})
@EnableAspectJAutoProxy
@EnableScheduling
@EnableTransactionManagement

@MapperScan(basePackages = {"org.wof.mapper"})
public class RootConfig {

}
