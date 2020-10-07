//
//  PostController.swift
//  Continuum
//
//  Created by Owen Barrott on 10/6/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import Foundation
import UIKit

class PostController {
    
    //Singleton / Shared Instance of PostController
    static let shared = PostController()
    
    //Source of Truth
    var posts: [Post] = []
    
    // MARK: - CRUD Functions
    
    //Add Comment
    func addComment(text: String, post: Post, completion: @escaping (Result<Comment, PostError>) -> Void) {
        let newComment = Comment(text: text, post: post)
        post.comments.append(newComment)
        //CloudKit Integration
    }
    
    //Create Post
    func createPostWith(image: UIImage, caption: String, completion: @escaping (Result<Post?,PostError>) -> Void) {
        let newPost = Post(caption: caption, photo: image)
        posts.append(newPost)
        //CloudKit Integration
    }
}
