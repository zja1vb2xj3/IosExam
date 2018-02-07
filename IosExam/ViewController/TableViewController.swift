//
//  TableViewController.swift
//  IosExam
//
//  Created by Beaconyx on 2018. 1. 25..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit

class TableViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var tableView: UITableView!
    
    struct setionItems {
        var sectionName : String!
        var sectionModels : [LectureModel]
    }
    
    var sections = [setionItems]()
    
    //섹션만큼 셀을 만들어서 셀의 헤더에 섹션을 달아줘야함.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNavigationItem()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let dic = appDelegate.lectureDic

        let sortedKeyDic = dic.sorted(by: {$0.0 < $1.0})
        
        for (key, models) in sortedKeyDic{
            //섹션이름과 해당 모델을 대입
            sections.append(setionItems(sectionName: key, sectionModels: models))
        }

    }

    
    func initNavigationItem(){
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        self.navigationController?.navigationBar.barTintColor = UIColor.red
        
       
//        self.navigationItem.titleView = label
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sections[section].sectionModels.count //count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_ID") as! TableViewCell
        
        cell.textView.text = sections[indexPath.section].sectionModels[indexPath.row].title
        
        //터치 색상 없애기
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        return cell//cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return sections[section].sectionName
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowHeight : CGFloat = 100
        
        return rowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let title : String = sections[indexPath.section].sectionModels[indexPath.row].title as String!
        
        NSLog("title \(title)")
        
        //토스트 메세지 생성
        let toastMessage = ToastMessage(viewWidth: self.view.frame.width, viewHeight: self.view.frame.height)
        
        let toast : UILabel = toastMessage.makeToast(message: title)
        
        self.view.addSubview(toast)
        
        UIView.animate(withDuration:4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toast.alpha = 0.0
        }, completion:{(isCompleted) in
            toast.removeFromSuperview()
        })
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
