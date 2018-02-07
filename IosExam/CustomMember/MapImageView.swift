//
//  MapImageView.swift
//  IosExam
//
//  Created by Beaconyx on 2018. 1. 30..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit
class MapImageView: UIImageView {

 
    //        for(key : model) in dic{
    //            print(model.value.beaconId)
    //        }
    
    //key beaconid ,value button
    //해당 비콘이 반응하면 버튼을 찾아 이미지를 변경 버튼을 생성하기 위한 x,y 좌표
    
    var markerButtons = [UIButton]()
    
    var markerButtonDic = [String : UIButton]()
    var markerModelDic = [String : BeaconModel]()
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
      
    }
    
    func setMarker(beaconModels : [BeaconModel], rootViewWidth : CGFloat ) {
        //모델만큼 버튼을 생성해서 markerButtonDic에 생성된 버튼과 비콘 아이디를 담음
        
      
    
        
    }

    
    override func draw(_ rect: CGRect) {
        print("draw")
        
        
//        for i in 0 ..< markerButtons.count{
//            print("count: \(i)")
//            self.addSubview(markerButtons[i])
//        }
//        for i:Int in 0 ..< 2{
//            let initValue : CGFloat = CGFloat(2 + i)
//
//            self.markerButtons.append(UIButton.init(type: .system))
//
//            let x : CGFloat = rect.size.width / initValue
//            let y : CGFloat = rect.size.height / initValue
//
//            self.markerButtons[i] = UIButton(frame: CGRect(x: x,y: y, width: markerSize, height: markerSize))
//
//            self.markerButtons[i].setImage(UIImage(named: "normal_map_marker"), for: .normal)
//
//            self.markerButtons[i].addTarget(self, action: #selector(self.markerButtonAction(sender:)), for: .touchDown)
//
//            self.addSubview(markerButtons[i])
//        }
//
//        self.isUserInteractionEnabled = true
    }
    
    @objc func markerButtonAction(sender: UIButton!){
        NSLog("button Click")
    }

}
