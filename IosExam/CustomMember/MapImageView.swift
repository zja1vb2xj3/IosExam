//
//  MapImageView.swift
//  IosExam
//
//  Created by Beaconyx on 2018. 1. 30..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit
class MapImageView: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var markerButton = [UIButton]()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let mapImageViewSize = self.frame.size
        
        let rect = CGRect(x: 0, y: 0, width: mapImageViewSize.width, height: mapImageViewSize.height)
        draw(rect)
    }
    
    override func draw(_ rect: CGRect) {
        
        for i:Int in 0 ..< 2{
            let initValue : CGFloat = CGFloat(2 + i)
            
            self.markerButton.append(UIButton.init(type: .system))
            
            self.markerButton[i] = UIButton(frame: CGRect(x: rect.size.width / initValue, y: rect.size.height / initValue, width: 50, height: 50))
            
            self.markerButton[i].setImage(UIImage(named: "normal_map_marker"), for: .normal)
            
            self.markerButton[i].addTarget(self, action: #selector(self.markerButtonAction(sender:)), for: .touchDown)
            
            self.addSubview(markerButton[i])
        }
        
        self.isUserInteractionEnabled = true
    }
    
    @objc func markerButtonAction(sender: UIButton!){
        NSLog("button Click")
    }

}
