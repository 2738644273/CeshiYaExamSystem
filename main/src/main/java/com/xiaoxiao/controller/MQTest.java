package com.xiaoxiao.controller;

import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;
import com.rabbitmq.client.impl.AMQImpl;

import java.io.IOException;
import java.util.concurrent.TimeoutException;

/**
 * MQ测试
 */

public class MQTest {

    public  static void main(String[] args) throws IOException, TimeoutException {
        //1.创建连接工厂
        ConnectionFactory factory = new ConnectionFactory();
        //2.设置参数
        factory.setHost("127.0.0.1");
        factory.setPort(5672);
        factory.setVirtualHost("/dev"); //虚拟机默认 /
        factory.setUsername("xiaoxiao");
        factory.setPassword("123456");
        //3.创建连接 Connection
        Connection connection = factory.newConnection();
        //4.创建Channel
      Channel channel = connection.createChannel();
        //5.创建Queue
        channel.queueDeclare("hello-queue",true,false,false,null);
        //6.发送消息
        String body = "Hello";
        channel.basicPublish("","hello-queue",null,body.getBytes());
        //7.释放
        channel.close();
        connection.close();
    }
}
