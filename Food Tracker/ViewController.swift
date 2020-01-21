//
//  ViewController.swift
//  Food Tracker
//
//  Created by Erin Beachkofski on 1/6/20.
//  Copyright © 2020 Erin Beachkofski. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var setDefaultLabelText: UIButton!
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//         Do any additional setup after loading the view.
        mealNameLabel.text = "Default Text"
        nameTextField.delegate = self
    }


    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
//        Hide keyboard
        nameTextField.resignFirstResponder()
//        Instantiate a view controller that allows user to choose images from their library
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
//        let's the image picker know when user picks an image
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        Dismiss picker if user canceled
        dismiss(animated: true, completion: nil)

        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        use the original image, not representations of image
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            else {
            fatalError("Expected a dictionary containing an image, but was provided with the following: \(info)")
        }
//        Set photoImageView to display the selected image
        photoImageView.image = selectedImage
//        Dismiss imagePicker
        dismiss(animated: true, completion: nil)
    }
}
