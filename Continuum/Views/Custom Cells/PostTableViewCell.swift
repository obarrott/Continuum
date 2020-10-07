//
//  PostTableViewCell.swift
//  Continuum
//
//  Created by Owen Barrott on 10/6/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postCaptionLabel: UILabel!
    @IBOutlet weak var postCommentsLabel: UILabel!
    
    // MARK: - Properties
    var post: Post? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Helper Methods
    func updateViews() {
        guard let post = post else { return }
        postImageView.image = post.photo
        postCaptionLabel.text = post.caption
        postCommentsLabel.text = "Comments: \(post.comments.count)"
    }
}
