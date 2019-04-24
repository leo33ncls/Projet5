//
//  RectangleImagesView.swift
//  Projet_5
//
//  Created by Léo NICOLAS on 03/04/2019.
//  Copyright © 2019 Léo NICOLAS. All rights reserved.
//

import UIKit

class RectangleImagesView: UIView {
    
    @IBOutlet weak var firstDisposition: FirstDispositionView!
    @IBOutlet weak var secondDisposition: SecondDispositionView!
    @IBOutlet weak var thirdDisposition: ThirdDispositionView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        notificationObserver()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        notificationObserver()
    }
    
    
    
    enum Disposition {
        case first, second, third
    }
    
    var disposition: Disposition = .second {
        didSet {
            setDisposition(disposition: disposition)
        }
    }
    
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
    
    
    private func notificationObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(setFirstDispo), name: NSNotification.Name(rawValue: "Button1Recognizer"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(setSecondDispo), name: NSNotification.Name(rawValue: "Button2Recognizer"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(setThirdDispo), name: NSNotification.Name(rawValue: "Button3Recognizer"), object: nil)
    }
    
    
    @objc private func setFirstDispo() {
        disposition = .first
    }
    
    @objc private func setSecondDispo() {
        disposition = .second
    }
    
    @objc private func setThirdDispo() {
        disposition = .third
    }
    
    
    func receiveImage(image: UIImage) {
        if disposition == .first {
            firstDisposition.getImage(image: image)
        } else if disposition == .second {
            secondDisposition.getImage(image: image)
        } else {
            thirdDisposition.getImage(image: image)
        }
    }
    
    
    func refreshRectangleView() {
        firstDisposition.refreshView()
        secondDisposition.refreshView()
        thirdDisposition.refreshView()
    }
    
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
