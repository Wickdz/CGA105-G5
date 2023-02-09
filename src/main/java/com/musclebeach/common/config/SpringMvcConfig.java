package com.musclebeach.common.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@ComponentScan({"com.musclebeach.*.controller"})
@Import({SpringMvcSupport.class})
//@EnableWebMvc
public class SpringMvcConfig {
}

//@Configuration
//@ComponentScan({"com.musclebeach.common.controller", "com.musclebeach.course.controller"})
//@EnableWebMvc
//public class SpringMvcConfig implements WebMvcConfigurer {
//    @Resource
//    private ProjectInterceptor projectInterceptor;
//
//    @Override
//    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//        // 當訪問靜態資源時，不經由mvc。
//        registry.addResourceHandler("/front-end/**").addResourceLocations("/front-end/");
//        registry.addResourceHandler("/back-end/**").addResourceLocations("/back-end/");
//    }
//
//    @Override
//    public void addInterceptors(InterceptorRegistry registry) {
//        registry.addInterceptor(projectInterceptor).addPathPatterns("/teamClasses/**");
//    }
//}
