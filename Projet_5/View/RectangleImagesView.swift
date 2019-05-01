//
//  RectangleImagesView.swift
//  Projet_5
//
//  Created by Léo NICOLAS on 03/04/2019.
//  Copyright © 2019 Léo NICOLAS. All rights reserved.
//

import UIKit

// Class which represents the view with the 3 dispositions
class RectangleImagesView: UIView {
    
    
    //=============================
    //Properties
    
    @IBOutlet weak var firstDisposition: FirstDispositionView!
    @IBOutlet weak var secondDisposition: SecondDispositionView!
    @IBOutlet weak var thirdDisposition: ThirdDispositionView!
    
    
    // Enumeration of the 3 dispositions
    enum Disposition {
        case first, second, third
    }
    
    // The current dispostion view
    private var disposition: Disposition = .second {
        didSet {
            setDisposition(disposition: disposition)
        }
    }
    
    
    //============================
    //Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        notificationObserver()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        notificationObserver()
    }

    
    //============================
    // Methods
    
    // Method which displays the good disposition
    private func setDisposition (disposition: Disposition) {
        switch disposition {
        case .first :
            self.transform = CGAffineTransform(translationX: UIScreen.main.bounds.minX - frame.maxX, y: 0)
            UIView.animate(withDuration: 0.4, animations: { self.transform = .identity })
            firstDisposition.isHidden = false
            secondDisposition.isHidden = true
            thirdDisposition.isHidden = true
        case .second:
            self.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            UIView.animate(withDuration: 0.4, animations: { self.transform = .identity })
            firstDisposition.isHidden = true
            secondDisposition.isHidden = false
            thirdDisposition.isHidden = true
        case .third:
            self.transform = CGAffineTransform(translationX: UIScreen.main.bounds.maxX, y: 0)
            UIView.animate(withDuration: 0.4, animations: { self.transform = .identity })
            firstDisposition.isHidden = true
            secondDisposition.isHidden = true
            thirdDisposition.isHidden = false
            
        }
    }
    
    // Method which observes the notification
    private func notificationObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(setFirstDispo), name: NSNotification.Name(rawValue: "Button1Recognizer"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(setSecondDispo), name: NSNotification.Name(rawValue: "Button2Recognizer"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(setThirdDispo), name: NSNotification.Name(rawValue: "Button3Recognizer"), object: nil)
    }
    
    
    // Method which sets the first dispostion as the current view
    @objc private func setFirstDispo() {
        disposition = .first
    }
    
    // Method which sets the second dispostion as the current view
    @objc private func setSecondDispo() {
        disposition = .second
    }
    
    // Method which sets the third dispostion as the current view
    @objc private func setThirdDispo() {
        disposition = .third
    }
    
    
    // Method which receives an image and give it to the current disposition
    func receiveImage(image: UIImage) {
        if disposition == .first {
            firstDisposition.setImage(image: image)
        } else if disposition == .second {
            secondDisposition.setImage(image: image)
        } else {
            thirdDisposition.setImage(image: image)
        }
    }
    
    
    // Method which resets the rectangle view
    func resetRectangleView() {
        firstDisposition.resetView()
        secondDisposition.resetView()
        thirdDisposition.resetView()
    }
    
    
    // Method which returns if the current view can be shared
    func currentViewCanBeShared() -> Bool {
        if disposition == .first && firstDisposition.isReadyToBeShared {
            return true
        } else if disposition == .second && secondDisposition.isReadyToBeShared {
            return true
        } else if disposition == .third && thirdDisposition.isReadyToBeShared {
            return true
        } else {
            return false
        }
    }
    
}
