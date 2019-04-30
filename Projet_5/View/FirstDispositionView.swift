//
//  FirstDispositionView.swift
//  Projet_5
//
//  Created by Léo NICOLAS on 18/04/2019.
//  Copyright © 2019 Léo NICOLAS. All rights reserved.
//

import UIKit

class FirstDispositionView: UIView {

    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    
    
    var imageViewSelected: UIImageView? = nil
    
    var isReadyToBeShared: Bool {
        if firstImageView.image == UIImage(named: "RectangleCross") || secondImageView.image == UIImage(named: "Cross") || thirdImageView.image == UIImage(named: "Cross") {
            return false
        } else {
            return true
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageViewRecognizer()
    }
    
    
    func imageViewRecognizer() {
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
    
    
    @objc func sendNotification() {
        let name = Notification.Name("TapGestureRecognizer")
        let notification = Notification(name: name)
        
        NotificationCenter.default.post(notification)
        
        imageViewSelected = firstImageView
    }
    
    @objc func sendNotification2() {
        let name = Notification.Name("TapGestureRecognizer")
        let notification = Notification(name: name)
        
        NotificationCenter.default.post(notification)
        
        imageViewSelected = secondImageView
    }
    
    @objc func sendNotification3() {
        let name = Notification.Name("TapGestureRecognizer")
        let notification = Notification(name: name)
        
        NotificationCenter.default.post(notification)
        
        imageViewSelected = thirdImageView
    }
    
    
    func getImage(image: UIImage) {
        imageViewSelected?.image = image
    }
    
    
    func refreshView() {
        firstImageView.image = UIImage(named: "RectangleCross")
        secondImageView.image = UIImage(named: "Cross")
        thirdImageView.image = UIImage(named: "Cross")
    }

}
