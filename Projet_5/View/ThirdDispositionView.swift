//
//  ThirdDispositionView.swift
//  Projet_5
//
//  Created by Léo NICOLAS on 18/04/2019.
//  Copyright © 2019 Léo NICOLAS. All rights reserved.
//

import UIKit

class ThirdDispositionView: UIView {
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    @IBOutlet weak var fourthImageView: UIImageView!
    
    
    var isReadyToBeShared: Bool {
        if firstImageView.image == UIImage(named: "Cross") || secondImageView.image == UIImage(named: "Cross") || thirdImageView.image == UIImage(named: "Cross") || fourthImageView.image == UIImage(named: "Cross") {
            return false
        } else {
            return true
        }
    }
    
    private var imageViewSelected: UIImageView?
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageViewRecognizer()
    }
    
    private func imageViewRecognizer() {
        firstImageView.isUserInteractionEnabled = true
        secondImageView.isUserInteractionEnabled = true
        thirdImageView.isUserInteractionEnabled = true
        fourthImageView.isUserInteractionEnabled = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(sendNotification))
        firstImageView.addGestureRecognizer(tapGestureRecognizer)
        
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(sendNotification2))
        secondImageView.addGestureRecognizer(tapGestureRecognizer2)
        
        let tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(sendNotification3))
        thirdImageView.addGestureRecognizer(tapGestureRecognizer3)
        
        let tapGestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(sendNotification4))
        fourthImageView.addGestureRecognizer(tapGestureRecognizer4)
    
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
    
    @objc private func sendNotification4() {
        let name = Notification.Name("TapGestureRecognizer")
        let notification = Notification(name: name)
        
        NotificationCenter.default.post(notification)
        
        imageViewSelected = fourthImageView
    }
    
    
    func setImage(image: UIImage) {
        imageViewSelected?.image = image
    }
    
    
    func resetView() {
        firstImageView.image = UIImage(named: "Cross")
        secondImageView.image = UIImage(named: "Cross")
        thirdImageView.image = UIImage(named: "Cross")
        fourthImageView.image = UIImage(named: "Cross")
    }
    

  
}
