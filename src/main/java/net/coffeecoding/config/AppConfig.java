package net.coffeecoding.config;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.logging.Logger;

@Configuration
public class AppConfig implements WebMvcConfigurer {

    @Autowired
    private Environment env;
    private Logger logger = Logger.getLogger(getClass().getName());

    @Bean(name = "multipartResolver")
    public CommonsMultipartResolver getCommonsMultipartResolver() {
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
        multipartResolver.setMaxUploadSize(20971520); // 20MB
        return multipartResolver;
    }

}