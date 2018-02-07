//
//  ToastMessage.swift
//  IosExam
//
//  Created by Beaconyx on 2018. 1. 30..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit

class ToastMessage {
    
    var toast : UILabel = UILabel()
    
    init(viewWidth: CGFloat, viewHeight: CGFloat) {
        self.toast = UILabel(frame: CGRect(x: 5, y: viewHeight - 120, width: viewWidth - 20, height: 35))
    }
    
    func makeToast(message: String) -> UILabel{
        toast.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        toast.textColor = UIColor.white
        toast.textAlignment = .center
        toast.font = UIFont(name: "Montserrat-Light", size: 12.0)
        
        toast.text = message
        toast.alpha = 1.0
        toast.layer.cornerRadius = 10
        toast.clipsToBounds = true
        
        
        return toast
    }
    

}
