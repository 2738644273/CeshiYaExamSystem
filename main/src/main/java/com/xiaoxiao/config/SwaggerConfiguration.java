package com.xiaoxiao.config;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * Swagger配置类
 */
@Configuration
@EnableSwagger2
public class SwaggerConfiguration {

    @Value("${swagger.title}")
    private String title;

    @Value("${swagger.description}")
    private String description;

    @Value("${swagger.version}")
    private String version;

    @Value("${swagger.url}")
    private String url;

    @Value("${swagger.name}")
    private String name;

    @Value("${swagger.concat}")
    private String concat;


    @Configuration
    @EnableSwagger2
    public class Swagger2Config {

        @Bean
        public Docket webApiConfig(){

            return new Docket(DocumentationType.SWAGGER_2)
                    .groupName("webApi")
                    .apiInfo(webApiInfo())
                    .select()

                    .build();
        }

        @Bean
        public Docket adminApiConfig(){

            return new Docket(DocumentationType.SWAGGER_2)
                    .groupName("adminApi")
                    .apiInfo(adminApiInfo())
                    .select()

                    .build();

        }

        private ApiInfo webApiInfo(){

            return new ApiInfoBuilder()
                    .title(title)
                    .description(description)
                    .version(version)
                    .contact(new Contact(name, url, concat))
                    .build();
        }

        private ApiInfo adminApiInfo(){

            return new ApiInfoBuilder()
                    .title(title)
                    .description(description)
                    .version(version)
                    .contact(new Contact(name, url, concat))
                    .build();
        }
    }
}
