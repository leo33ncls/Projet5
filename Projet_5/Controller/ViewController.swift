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
    
    var imagePicker: UIImagePickerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rectangleImagesView.firstDisposition.imageViewRecognizer()
        rectangleImagesView.secondDisposition.imageViewRecognizer()
        rectangleImagesView.thirdDisposition.imageViewRecognizer()
        
        
        swipeGestureRecognizer()
        
        
        let name = Notification.Name(rawValue: "TapGestureRecognizer")
        NotificationCenter.default.addObserver(
            self, selector: #selector(choiceImage),
            name: name, object: nil)
        
    }
    
    
    func swipeGestureRecognizer() {
        if UIDevice.current.orientation == .portrait {
            let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(shareView))
            swipeGestureRecognizer.direction = .up
            rectangleImagesView.addGestureRecognizer(swipeGestureRecognizer)
        } else {
            let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(shareView))
            swipeGestureRecognizer.direction = .left
            rectangleImagesView.addGestureRecognizer(swipeGestureRecognizer)
        }
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePicker?.dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
        if rectangleImagesView.disposition == .first {
            rectangleImagesView.firstDisposition.imageViewSelected!.image = image
        } else if rectangleImagesView.disposition == .second {
            rectangleImagesView.secondDisposition.imageViewSelected!.image = image
        } else {
            rectangleImagesView.thirdDisposition.imageViewSelected!.image = image
        }
        
        imagePicker?.dismiss(animated: true, completion: nil)
    }
    
    
    @objc func choiceImage() {
        imagePicker = UIImagePickerController()
        imagePicker?.delegate = self
        
        guard imagePicker != nil else { return }
        imagePicker?.sourceType = .photoLibrary
        self.present(self.imagePicker!, animated: true, completion: nil)
    }
    
    
    @objc func shareView(_ sender: UISwipeGestureRecognizer) {
        
        UIView.animate(withDuration: 0.3, animations: {
            if sender.direction == .up {
                self.rectangleImagesView.transform = CGAffineTransform(translationX: 0, y: -self.view.frame.height)
            } else if sender.direction == .left {
                self.rectangleImagesView.transform = CGAffineTransform(translationX: self.view.frame.width, y: 0)
            }
            
        }, completion: { (success) in
            if success {
                if self.rectangleImagesView.currentViewCanBeShared() {
                    self.shareContent()
                } else {
                    let alert = UIAlertController(title: "Share unavailable", message: "Missing image", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    self.rectangleImagesView.transform = .identity
                }
            }
        })
    }
    
    
    func shareContent() {
        var sharedContent: [Any] = []
        sharedContent.append(rectangleImagesView)
        
        let activityViewController = UIActivityViewController(activityItems: sharedContent, applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
        
        refresh()
    }
    
    
    func refresh() {
        rectangleImagesView.transform = .identity
        rectangleImagesView.refreshRectangleView()
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

