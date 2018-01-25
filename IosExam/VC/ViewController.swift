//
//  ViewController.swift
//  IosExam
//
//  Created by Beaconyx on 2018. 1. 25..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //뷰컨트롤러 클래스가 생성 될 때
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ////
    }
    
    //화면에 나타난 직후
    override func viewDidAppear(_ animated: Bool){
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //뷰 컨트롤러가 사라지기 직전에 호출
    }
    
//    @objc func bringCompanyModels(notification: NSNotification){
//        let companyModelDic = notification.object as! [String : CompanyModel]
    
        
        //        let resultModel = companyModelDic["m51_1"] as? CompanyModel
        //
        //        if resultModel != nil{
        //            let title = resultModel?.title
        //            print(title!)
        //
        //            let homepage = resultModel?.homePage
        //            print(homepage!)
        //
        //        }
//    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

