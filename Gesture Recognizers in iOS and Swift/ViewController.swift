//
//  ViewController.swift
//  Gesture Recognizers in iOS and Swift
//
//  Created by Ilija Mihajlovic on 9/19/17.
//  Copyright © 2017 Ilija Mihajlovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var myImageView = UIImageView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        myImageView = UIImageView(image: UIImage(named: "football"))
        myImageView.frame = CGRect(x: 50 , y: 50 , width: 80, height: 80)
        myImageView.isUserInteractionEnabled = true
        view.addSubview(myImageView)
        
        //MARK: - Call Methods
        tapGestureRecognizer()
        swipeLeftGestureRecognizer()
        panGestureRecognizer()
        addBackground()
    }
    
    
    //MARK: - Methods
    func tapGestureRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapOccured))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tap)
    }
    
    func swipeLeftGestureRecognizer() {
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeftOccured))
        swipeLeft.direction = .left
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(swipeLeft)
    }
    
    func panGestureRecognizer() {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(myPanAction))
        panGestureRecognizer.minimumNumberOfTouches = 1
        panGestureRecognizer.maximumNumberOfTouches = 1
        myImageView.addGestureRecognizer(panGestureRecognizer)
    }
    
    func addBackground() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "footballField")
        backgroundImage.contentMode = .scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
    }
    
  
    @objc func tapOccured(_ sender: UITapGestureRecognizer) {
        print("Screen Tapped")
    }
    
    @objc func swipeLeftOccured(_ sender: UISwipeGestureRecognizerDirection) {
        print("Swiped Left")
    }
    
    
   @objc func myPanAction(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        if let myView = recognizer.view {
            myView.center = CGPoint(x: myView.center.x + translation.x, y: myView.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint(x: 0, y: 0), in: self.view)
    }
}




