//
//  PhotoMapViewController.swift
//  InstaPath
//
//  Created by Bhavesh on 9/23/18.
//  Copyright © 2018 Bhavesh. All rights reserved.
//

import UIKit

class PhotoMapViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var sharePostImageView: UIImageView!
    @IBOutlet weak var postTextField: UITextField!
    
    var postImage: UIImage! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = .photoLibrary
        
        self.present(vc, animated: true, completion: nil)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onShare(_ sender: Any) {
        Post.postUserImage(image: self.postImage, withCaption: postTextField.text) { (success: Bool , error:Error?) in
        }
        dismiss(animated:true, completion: nil)
    }
    
    @IBAction func onCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        // Get the image captured by the UIImagePickerController
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
        sharePostImageView.image = editedImage
        
        self.postImage = editedImage
        
        // Do something with the images (based on your use case)
        
        // Dismiss UIImagePickerController to go back to your original view controller
        self.dismiss(animated: true, completion: nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
