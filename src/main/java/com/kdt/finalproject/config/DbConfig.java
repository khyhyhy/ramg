package com.kdt.finalproject.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

@Configuration
@MapperScan(basePackages = "com.kdt.finalproject.mapper")
public class DbConfig {

    @Bean
    public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
        SqlSessionFactoryBean factory = new SqlSessionFactoryBean();

        // 비어있는 factory에 DB정보객체를 넣어 인식 시킨다.
        factory.setDataSource(dataSource);

        // SQL문장인 mapper들 (bbs.xml, mem.xml,....) 인식 시키기
        PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();

        factory.setMapperLocations(resolver.getResources(
                "classpath:mapper/**/*.xml"));

        return factory.getObject();
    }

    @Bean
    public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sessionFactory) {
        return new SqlSessionTemplate(sessionFactory);
    }

}
