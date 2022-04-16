package com.xiaoxiao.controller;


import com.xiaoxiao.modules.security.security.annotations.AnonymousAccess;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author xiaoxiao
 * @since 2022-04-13
 */
@RestController
@RequestMapping("/class-info")
public class ClassInfoController {
    @GetMapping("/s")
    @PreAuthorize("hasRole('2')")
    public String index() {
        return "后台服务启动成功！";
    }
}
