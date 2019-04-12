//
//  ViewController.swift
//  Projet_5
//
//  Created by Léo NICOLAS on 01/04/2019.
//  Copyright © 2019 Léo NICOLAS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rectangleImagesView: RectangleImagesView!
    @IBOutlet var imagesView: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for imageView in imagesView {
            imageViewRecognizer(imageView: imageView)
        }
    }
    
    func imageViewRecognizer(imageView: UIImageView) {
        imageView.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(choiceImage))
        imageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func choiceImage() {
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

