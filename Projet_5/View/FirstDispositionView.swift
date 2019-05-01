//
//  FirstDispositionView.swift
//  Projet_5
//
//  Created by Léo NICOLAS on 18/04/2019.
//  Copyright © 2019 Léo NICOLAS. All rights reserved.
//

import UIKit

// Class representing the first disposition view
class FirstDispositionView: UIView {

    
    //=================
    // Properties
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    
    // A boolean to know if the view is ready to be shared
    var isReadyToBeShared: Bool {
        if firstImageView.image == UIImage(named: "RectangleCross") || secondImageView.image == UIImage(named: "Cross") || thirdImageView.image == UIImage(named: "Cross") {
            return false
        } else {
            return true
        }
    }
    
    // The imageView selected
    private var imageViewSelected: UIImageView? = nil
    
    
    //=================
    // Overriding
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageViewRecognizer()
    }
    
    
    //=================
    // Methods
    
    // Method which add the gesture recognizer for the imageView
    private func imageViewRecognizer() {
        firstImageView.isUserInteractionEnabled = true
        secondImageView.isUserInteractionEnabled = true
        thirdImageView.isUserInteractionEnabled = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(sendNotification))
        firstImageView.addGestureRecognizer(tapGestureRecognizer)
        
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(sendNotification2))
        secondImageView.addGestureRecognizer(tapGestureRecognizer2)
        
        let tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(sendNotification3))
        thirdImageView.addGestureRecognizer(tapGestureRecognizer3)
        
    }
    
    
    // Method that sends a notification when the first imageView is tapped
    @objc private func sendNotification() {
        let name = Notification.Name("TapGestureRecognizer")
        let notification = Notification(name: name)
        
        NotificationCenter.default.post(notification)
        
        imageViewSelected = firstImageView
    }
    
    // Method that sends a notification when the second imageView is tapped
    @objc private func sendNotification2() {
        let name = Notification.Name("TapGestureRecognizer")
        let notification = Notification(name: name)
        
        NotificationCenter.default.post(notification)
        
        imageViewSelected = secondImageView
    }
    
    // Method that sends a notification when the third imageView is tapped
    @objc private func sendNotification3() {
        let name = Notification.Name("TapGestureRecognizer")
        let notification = Notification(name: name)
        
        NotificationCenter.default.post(notification)
        
        imageViewSelected = thirdImageView
    }
    
    
    // Method which give the image to the selected imageView
    func setImage(image: UIImage) {
        imageViewSelected?.image = image
    }
    
    
    // Method which reset the view
    func resetView() {
        firstImageView.image = UIImage(named: "RectangleCross")
        secondImageView.image = UIImage(named: "Cross")
        thirdImageView.image = UIImage(named: "Cross")
    }

}
