//
//  LoadViewController.swift
//  IosExam
//
//  Created by Beaconyx on 2018. 1. 31..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit

class LoadViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appDelegate.getParseBeaconContentData(viewWidth: self.view.frame.width)//파스 데이터를 받아옴
        
        let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "mainVC") as! MainViewController
        
        self.navigationController?.pushViewController(mainVC, animated: true)
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
