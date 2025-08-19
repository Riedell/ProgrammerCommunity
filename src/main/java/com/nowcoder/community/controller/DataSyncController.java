package com.nowcoder.community.controller;

import com.nowcoder.community.entity.DiscussPost;
import com.nowcoder.community.service.DiscussPostService;
import com.nowcoder.community.service.ElasticsearchService;
import com.nowcoder.community.util.CommunityUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/data")
public class DataSyncController {

    private static final Logger logger = LoggerFactory.getLogger(DataSyncController.class);

    @Autowired
    private DiscussPostService discussPostService;

    @Autowired
    private ElasticsearchService elasticsearchService;

    /**
     * 全量同步数据库中的帖子到Elasticsearch
     * @return 同步结果
     */
    @RequestMapping(path = "/sync/posts", method = RequestMethod.GET)
    @ResponseBody
    @PreAuthorize("hasAnyAuthority('admin')")// SecurityConfig中配置的路径权限高于注解，即使去掉注解也会被SecurityConfig中配置的路径权限所拦截
    public String syncPosts() {
        try {
            // 获取所有帖子数据
            List<DiscussPost> posts = discussPostService.findDiscussPosts(0, 0, Integer.MAX_VALUE, 0);
            
            // 同步到Elasticsearch
            elasticsearchService.bulkSaveDiscussPost(posts);
            
            logger.info("成功同步 {} 条帖子数据到Elasticsearch", posts.size());
            return CommunityUtil.getJSONString(0, "成功同步 " + posts.size() + " 条帖子数据到Elasticsearch");
        } catch (Exception e) {
            logger.error("同步帖子数据到Elasticsearch失败: ", e);
            return CommunityUtil.getJSONString(1, "同步失败: " + e.getMessage());
        }
    }
}