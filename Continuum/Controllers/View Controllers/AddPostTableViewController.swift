//
//  AddPostTableViewController.swift
//  Continuum
//
//  Created by Owen Barrott on 10/6/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import UIKit

class AddPostTableViewController: UITableViewController {

    // MARK: - Outlets
    @IBOutlet weak var addPostImageView: UIImageView!
    @IBOutlet weak var selectImageButton: UIButton!
    @IBOutlet weak var captionTextField: UITextField!
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        addPostImageView.image = nil
        selectImageButton.setTitle("Select Image", for: .normal)
    }
    
    // MARK: - Actions
    @IBAction func selectImageButtonTapped(_ sender: Any) {
        addPostImageView.image = UIImage(contentsOfFile: "spaceEmptyState")
        selectImageButton.setTitle("", for: .normal)
    }
    
    @IBAction func addPostButtonTapped(_ sender: Any) {
        guard let text = captionTextField.text, !text.isEmpty,
            let image = addPostImageView.image else { return }
        
        PostController.shared.createPostWith(image: image, caption: text) { (_) in
            //To Fill in later
        }
        self.tabBarController?.selectedIndex = 0
    }

    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.tabBarController?.selectedIndex = 0
    }
}
