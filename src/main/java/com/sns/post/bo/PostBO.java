package com.sns.post.bo;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sns.comment.bo.CommentBO;
import com.sns.common.FileManagerService;
import com.sns.like.bo.LikeBO;
import com.sns.post.dao.PostDAO;
import com.sns.post.model.Post;

@Service
public class PostBO {
	private Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private LikeBO likeBO;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private FileManagerService fileManagerService;
	
	public int addPost(int userId, String userLoginId,
			String content, MultipartFile file) {
		
		String imagePath = null;
		if (file != null) {
			imagePath = fileManagerService.saveFile(userLoginId, file);
		}
		
		// db insert
		return postDAO.insertPost(userId, content, imagePath);
	}
	
	public List<Post> getPostList() {
		return postDAO.selectPostList();
	}
	
	public Post getPostByPostId(int postId) {
		return postDAO.selectPostByPostId(postId);
	}
	
	public int deletePostByPostIdUserId(int postId, int userId) {
		// 기존글 가져오기
		Post post = getPostByPostId(postId);
		if (post == null) {
			log.warn("[delete post] 삭제할 게시글이 없습니다. postId:{}, userId:{}", postId, userId);
			return 0;
		}
		
		// 이미지 있으면 이미지 삭제
		if (post.getImagePath() != null) {
			fileManagerService.deleteFile(post.getImagePath());
		}
		
		// 좋아요들 삭제
		likeBO.deleteLikeByPostId(postId);
		
		// 댓글들 삭제
		commentBO.deleteCommentByPostId(postId);
		
		// 글 삭제
		return postDAO.deletePostByPostIdUserId(postId, userId);
	}
}
