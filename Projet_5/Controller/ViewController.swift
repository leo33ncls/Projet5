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
    @IBOutlet weak var swipeImageView: UIImageView!
    @IBOutlet weak var swipeLabel: UILabel!
    
    var imagePicker: UIImagePickerController?
    
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
    
    func swipeGestureRecognizer() {
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
                self.rectangleImagesView.transform = CGAffineTransform(translationX: -self.view.frame.width, y: 0)
            }
            
        }, completion: { (success) in
            if success {
                if self.rectangleImagesView.currentViewCanBeShared() {
                    self.shareContent()
                } else {
                    let alert = UIAlertController(title: "Share unavailable", message: "Missing image", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    UIView.animate(withDuration: 0.3, animations: {
                        self.rectangleImagesView.transform = .identity
                    })
                }
            }
        })
    }
    
    
    func shareContent() {
        var sharedContent: [Any] = []
        
        let renderer = UIGraphicsImageRenderer(size: rectangleImagesView.bounds.size)
        let image = renderer.image(actions: { (contexte) in
            view.drawHierarchy(in: rectangleImagesView.bounds, afterScreenUpdates: true)
        })
        sharedContent.append(image)
        
        let activityViewController = UIActivityViewController(activityItems: sharedContent, applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
        
        refresh()
    }
    
    
    func refresh() {
        UIView.animate(withDuration: 0.3, animations: {
            self.rectangleImagesView.transform = .identity
        })
        rectangleImagesView.refreshRectangleView()
    }

    
    @IBAction func tapResetButton(_ sender: Any) {
        refresh()
    }
    

}

