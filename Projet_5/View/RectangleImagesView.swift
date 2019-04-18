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
            firstDisposition.isHidden = false
            secondDisposition.isHidden = true
            thirdDisposition.isHidden = true
        case .second:
            firstDisposition.isHidden = true
            secondDisposition.isHidden = false
            thirdDisposition.isHidden = true
        case .third:
            firstDisposition.isHidden = true
            secondDisposition.isHidden = true
            thirdDisposition.isHidden = false
            
        }
    }
    
    
    func refreshRectangleView() {
        firstDisposition.refreshView()
        secondDisposition.refreshView()
        thirdDisposition.refreshView()
    }
    
    
    
}