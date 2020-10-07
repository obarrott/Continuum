//
//  PostDetailTableViewController.swift
//  Continuum
//
//  Created by Owen Barrott on 10/6/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import UIKit

class PostDetailTableViewController: UITableViewController {

    // MARK: - Outlets
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    // MARK: - Properties
    // Landing pad for segue.
    var post: Post? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    // MARK: - Actions
    @IBAction func commentButtonTapped(_ sender: Any) {
        presentCommentAlert()
    }
    
    @IBAction func shareButtonTapped(_ sender: Any) {
    }
    
    @IBAction func followButtonTapped(_ sender: Any) {
    }
    
    // MARK: - Helper Methods
    
    func presentCommentAlert() {
        let alertController = UIAlertController(title: "Comment", message: "Share your oh-so important feelings about this post.", preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Comment..."
            textField.autocorrectionType = .yes
            textField.autocapitalizationType = .sentences
        }
        
        let addCommentAction = UIAlertAction(title: "Ok", style: .default) { (_) in
            guard let text = alertController.textFields?.first?.text, !text.isEmpty, let post = self.post else { return }
            
            PostController.shared.addComment(text: text, post: post) { (result) in
                switch result {
                case .success(_):
                    self.tableView.reloadData()
                }
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style:.cancel)
        
        alertController.addAction(cancelAction)
        alertController.addAction(addCommentAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    func updateViews() {
        guard let post = post else { return }
        photoImageView.image = post.photo
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let post = post else { return 0 }
        return post.comments.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentsCell", for: indexPath)
        let post = self.post
        cell.textLabel?.text = post?.comments[indexPath.row].text
        cell.detailTextLabel?.text = post?.comments[indexPath.row].timestamp.formatDate()
        
        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
