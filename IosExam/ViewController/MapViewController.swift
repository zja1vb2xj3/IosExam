//
//  MapViewController.swift
//  IosExam
//
//  Created by Beaconyx on 2018. 1. 30..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var mapImageView: MapImageView!
    @IBOutlet weak var pinchView: UIScrollView!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNavigationItem()
        
        mapImageView.image = UIImage(named: "map_img.png")
        drawMarker()
//        mapImageView.setMarker(beaconModels: appDelegate.beaconModels, rootViewWidth: self.view.frame.width)
//        mapImageViewOnDraw()

        print("viewSize : \(self.view.frame.height)")
        
        //아이폰 X 812
        //아이폰 6플러스 736

        self.pinchView.delegate = self
        self.pinchView.zoomScale = 1.0
        self.pinchView.maximumZoomScale = 4.0
        
        
    }
    
//    func mapImageViewOnDraw() {
//        self.mapImageView.draw(self.mapImageView.frame)
//    }
    

    func drawMarker(){
        let beaconModels = self.appDelegate.beaconModels
        
        var markerSize : CGFloat = 0
        
        switch self.view.frame.width {
        case 320:
            markerSize = 6
            print(320)
            break
        case 375:
            markerSize = 8
            print(375)
            break
        case 414:
            markerSize = 8
            print(414)
            break
        default:
            break
        }
        
        for model in beaconModels{
            //positionX가 nil이 아닌 모델만 버튼 생성
            
            var button = UIButton.init(type: .system)
            
            button = UIButton.init(frame: CGRect(x: model.positionX, y: model.positionY, width: markerSize, height: markerSize))
            
            if model.type == "n"{
                button.setImage(UIImage(named: "normal_map_marker"), for: .normal)
            }else{
                button.setImage(UIImage(named: "marker_1"), for: .normal)
            }
            
            
            
            self.mapImageView.addSubview(button)
            
            
        }//end for
    }

    
    func initNavigationItem(){
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.barTintColor = UIColor.blue
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.mapImageView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
