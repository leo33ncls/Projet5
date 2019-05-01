//
//  ViewController.swift
//  Projet_5
//
//  Created by Léo NICOLAS on 01/04/2019.
//  Copyright © 2019 Léo NICOLAS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //====================
    //Properties
    
    @IBOutlet weak var rectangleImagesView: RectangleImagesView!
    @IBOutlet weak var swipeImageView: UIImageView!
    @IBOutlet weak var swipeLabel: UILabel!
    
    // The image picker controller
    private var imagePicker: UIImagePickerController?
    
    
    //===================
    //Overriding
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipeGestureRecognizer()
        
        
        let name = Notification.Name(rawValue: "TapGestureRecognizer")
        NotificationCenter.default.addObserver(
            self, selector: #selector(choiceImage),
            name: name, object: nil)
        
    }
    
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        swipeGestureRecognizer()
    }
    
    
    //====================
    // Methods
    
    // Method which add the swipe gesture recognizer for the rectangle view
    private func swipeGestureRecognizer() {
        switch UIDevice.current.orientation {
        case .portrait,.unknown:
            rectangleImagesView.gestureRecognizers?.removeAll()
            let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(shareView))
            swipeGestureRecognizer.direction = .up
            rectangleImagesView.addGestureRecognizer(swipeGestureRecognizer)
            swipeImageView.image = UIImage(named: "SwipeUp")
            swipeLabel.text = "Swipe up to share"
        case .landscapeLeft,.landscapeRight:
            rectangleImagesView.gestureRecognizers?.removeAll()
            let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(shareView))
            swipeGestureRecognizer.direction = .left
            rectangleImagesView.addGestureRecognizer(swipeGestureRecognizer)
            swipeImageView.image = UIImage(named: "SwipeLeft")
            swipeLabel.text = "Swipe left to share"
        default:
            break
        }
    }
    
    // Method allowing to choice an image in the Photo library
    @objc private func choiceImage() {
        imagePicker = UIImagePickerController()
        imagePicker?.delegate = self
        
        guard imagePicker != nil else { return }
        imagePicker?.sourceType = .photoLibrary
        self.present(self.imagePicker!, animated: true, completion: nil)
    }


    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePicker?.dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
        if let picture = image {
            rectangleImagesView.receiveImage(image: picture)
        }
        
        imagePicker?.dismiss(animated: true, completion: nil)
    }
    
    
    // Method allowing to share the rectangleView
    @objc private func shareView(_ sender: UISwipeGestureRecognizer) {
        
        UIView.animate(withDuration: 0.3, animations: {
            if sender.direction == .up {
                self.rectangleImagesView.transform = CGAffineTransform(translationX: 0, y: -self.view.frame.height)
            } else if sender.direction == .left {
                self.rectangleImagesView.transform = CGAffineTransform(translationX: -self.view.frame.width, y: 0)
            }
            
        }, completion: { (success) in
            if success {
                self.shareViewCompletion()
            }
        })
    }
    
    
    // The shareView completion
    private func shareViewCompletion() {
        if rectangleImagesView.currentViewCanBeShared() {
            shareContent()
        } else {
            let alert = UIAlertController(title: "Share unavailable", message: "Missing image", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            UIView.animate(withDuration: 0.3, animations: {
                self.rectangleImagesView.transform = .identity
            })
        }
    }
    
    
    // Method allowing to share the content of the rectangleView
    private func shareContent() {
        var sharedContent: [Any] = []
        
        let renderer = UIGraphicsImageRenderer(size: rectangleImagesView.bounds.size)
        let image = renderer.image(actions: { (contexte) in
            view.drawHierarchy(in: rectangleImagesView.bounds, afterScreenUpdates: true)
        })
        sharedContent.append(image)
        
        let activityViewController = UIActivityViewController(activityItems: sharedContent, applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
        
        reset()
    }
    
    
    // Method which reset the view
    private func reset() {
        UIView.animate(withDuration: 0.3, animations: {
            self.rectangleImagesView.transform = .identity
        })
        rectangleImagesView.resetRectangleView()
    }

    
    // Method that reset the view when the resetButton is pressed
    @IBAction func tapResetButton(_ sender: Any) {
        reset()
    }
    

}

