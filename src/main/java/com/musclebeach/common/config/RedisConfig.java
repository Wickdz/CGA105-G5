package com.musclebeach.common.config;

import com.musclebeach.product.model.entity.Product;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.connection.RedisStandaloneConfiguration;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.GenericJackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;


public class RedisConfig {
    @Value("${redis.host}")
    private String host;
    @Value("${redis.port}")
    private Integer port;
    @Value("${redis.password}")
    private String password;

    @Bean
    public JedisConnectionFactory redisConnectionFactory() {
        RedisStandaloneConfiguration config = new RedisStandaloneConfiguration(host, port);
        config.setPassword(password);
        return new JedisConnectionFactory(config);
    }

    @Bean
    RedisTemplate<Integer, Product> redisTemplate(RedisConnectionFactory redisConnectionFactory) {
        RedisTemplate<Integer, Product> template = new RedisTemplate<>();
        template.setConnectionFactory(redisConnectionFactory);

        GenericJackson2JsonRedisSerializer serializer = new GenericJackson2JsonRedisSerializer();
        Jackson2JsonRedisSerializer<Product> productSerializer = new Jackson2JsonRedisSerializer<>(Product.class);
        template.setKeySerializer(serializer);
        template.setHashKeySerializer(productSerializer);
        template.setHashValueSerializer(serializer);
        return template;
    }

    @Bean
    public HashOperations<Integer, Product, Integer> hashOperations(RedisTemplate<Integer, Product> redisTemplate) {
        return redisTemplate.opsForHash();
    }
}
