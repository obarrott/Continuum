//
//  Post.swift
//  Continuum
//
//  Created by Owen Barrott on 10/6/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import Foundation
import UIKit

class Post {
    
    var photoData: Data?
    var timestamp: Date
    var caption: String
    var comments: [Comment]
    var photo: UIImage? {
        get {
            guard let photoData = photoData else { return nil }
            return UIImage(data: photoData)
        }
        set {
            photoData = newValue?.jpegData(compressionQuality: 0.5)
        }
    }
    
    init(caption: String, timestamp: Date = Date(), comments: [Comment] = [], photo: UIImage?) {
        
        self.caption = caption
        self.timestamp = timestamp
        self.comments = comments
        self.photo = photo
    }
}
