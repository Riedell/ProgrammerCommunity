package com.nowcoder.community.dao;

import com.nowcoder.community.entity.Comment;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CommentMapper {

    List<Comment> selectCommentsByEntity(int entityType, int entityId, int offset, int limit);

    int selectCountByEntity(int entityType, int entityId);

    int insertComment(Comment comment);

    Comment selectCommentById(int id);

    // 根据用户ID查询其评论过的帖子ID列表
    List<Integer> selectDiscussPostIdsByUserId(int userId, int offset, int limit);

    // 根据用户ID查询其评论过的帖子总数
    int selectDiscussPostCountByUserId(int userId);
}
