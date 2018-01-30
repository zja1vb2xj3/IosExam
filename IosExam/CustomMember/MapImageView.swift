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
        self.markerButton.append(UIButton.init(type: .system))
        self.markerButton[0] = UIButton(frame: CGRect(x: rect.size.width/2, y: rect.size.height/2, width: 50, height: 50))
        
        
        self.markerButton[0].setImage(UIImage(named: "normal_map_marker"), for: .normal)
        
        
        self.addSubview(markerButton[0])
    }

}
