//
//  ViewController.swift
//  Projet_5
//
//  Created by Léo NICOLAS on 01/04/2019.
//  Copyright © 2019 Léo NICOLAS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var rectangleImagesView: RectangleImagesView!
    @IBOutlet var imagesView: [UIImageView]!
    
    var imagePicker: UIImagePickerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for imageView in imagesView {
            imageViewRecognizer(imageView: imageView)
        }
    }
    
    func imageViewRecognizer(imageView: UIImageView) {
        imageView.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(choiceImage))
        imageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePicker?.dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        imagesView[0].image = image
        imagesView[0].contentMode = .scaleToFill
        imagePicker?.dismiss(animated: true, completion: nil)
    }
    
    @objc func choiceImage() {
        imagePicker = UIImagePickerController()
        imagePicker?.delegate = self
        
        guard imagePicker != nil else { return }
        imagePicker?.sourceType = .photoLibrary
        self.present(self.imagePicker!, animated: true, completion: nil)
    }

    @IBAction func tapButton1(_ sender: Any) {
        rectangleImagesView.disposition = .first
    }
    
    @IBAction func tapButton2(_ sender: Any) {
        rectangleImagesView.disposition = .second
    }
    
    @IBAction func tapButton3(_ sender: Any) {
        rectangleImagesView.disposition = .third
    }
    

}

