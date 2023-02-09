package com.musclebeach.common.config;

import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

public class SpringMvcSupport extends WebMvcConfigurationSupport {

//    @Resource
//    private ProjectInterceptor projectInterceptor;

    @Override
    protected void addResourceHandlers(ResourceHandlerRegistry registry) {
        // 當訪問靜態資源時，不經由mvc。
        registry.addResourceHandler("/front-end/**").addResourceLocations("/front-end/");
        registry.addResourceHandler("/back-end/**").addResourceLocations("/back-end/");
    }

//    @Override
//    protected void addInterceptors(InterceptorRegistry registry) {
//        registry.addInterceptor(projectInterceptor).addPathPatterns("/teamClasses/**");
//    }
}
