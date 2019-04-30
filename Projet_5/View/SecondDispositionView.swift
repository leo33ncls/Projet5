//
//  SecondDispositionView.swift
//  Projet_5
//
//  Created by Léo NICOLAS on 18/04/2019.
//  Copyright © 2019 Léo NICOLAS. All rights reserved.
//

import UIKit

class SecondDispositionView: UIView {

    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    
    
    var isReadyToBeShared: Bool {
        if firstImageView.image == UIImage(named: "Cross") || secondImageView.image == UIImage(named: "Cross") || thirdImageView.image == UIImage(named: "RectangleCross") {
            return false
        } else {
            return true
        }
    }
    
    private var imageViewSelected: UIImageView? = nil
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageViewRecognizer()
    }
    
    
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
    
    
    @objc private func sendNotification() {
        let name = Notification.Name("TapGestureRecognizer")
        let notification = Notification(name: name)
        
        NotificationCenter.default.post(notification)
        
        imageViewSelected = firstImageView
    }
    
    @objc private func sendNotification2() {
        let name = Notification.Name("TapGestureRecognizer")
        let notification = Notification(name: name)
        
        NotificationCenter.default.post(notification)
        
        imageViewSelected = secondImageView
    }
    
    @objc private func sendNotification3() {
        let name = Notification.Name("TapGestureRecognizer")
        let notification = Notification(name: name)
        
        NotificationCenter.default.post(notification)
        
        imageViewSelected = thirdImageView
    }
    
    func setImage(image: UIImage) {
        imageViewSelected?.contentMode = .scaleToFill
        imageViewSelected?.image = image
    }

    
    func resetView() {
        firstImageView.image = UIImage(named: "Cross")
        secondImageView.image = UIImage(named: "Cross")
        thirdImageView.image = UIImage(named: "RectangleCross")
    }

}
