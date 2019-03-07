//
//  UploadViewController.swift
//  ProjectA
//
//  Created by Lawrence Bang on 8/11/18.
//  Copyright © 2018 Lawrence Bang. All rights reserved.
//

import UIKit

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var travels = [Travel]()
    
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var pictureView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // rounding corner
        pictureView.layer.cornerRadius = pictureView.frame.height/2
        
    }

    @IBAction func addButton(_ sender: UIButton) {
        let name = nameTextField.text!;
        let address = addressTextField.text!;
        let description = descriptionTextField.text!;
        let image = pictureView.image
        let t = Travel(name: name, address: address, ds: description, pic: image!)
        travels.append(t);
        print("Added")
        // NSKeyedArchiver = import and fetch the data
        let compressedData = NSKeyedArchiver.archivedData(withRootObject: travels)
        UserDefaults.standard.set(compressedData, forKey: "data")
        print("Saved")
    }
    
    @IBAction func uploadImage(_ sender: UITapGestureRecognizer) {
    let picker = UIImagePickerController()
        picker.sourceType = UIImagePickerController.SourceType.photoLibrary
        //if we use camera
        //picker.sourceType = UIImagePickerController.SourceType.camera
        picker.allowsEditing = false
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    // didFinishPickingMediaWithInfo : 카메라뷰가 떠있는 상태에서 찍은것이 성공하고 use photo를 눌렀을 때 발생되는 함수
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        pictureView.image = image
        dismiss(animated: true, completion: nil)
    }
}
