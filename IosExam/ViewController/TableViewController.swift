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
    
    var names = ["Vegetables": ["Tomato", "Potato", "Lettuce"], "Fruits": ["Apple", "Banana"]]
    
    @IBOutlet weak var tableView: UITableView!
    
    struct setionItems {
        var sectionName : String!
        var sectionModels : [LectureModel]
    }
    
    var sections = [setionItems]()
    
    //섹션만큼 셀을 만들어서 셀의 헤더에 섹션을 달아줘야함.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let dic = appDelegate.lectureDic

        let sortedKeyDic = dic.sorted(by: {$0.0 < $1.0})
        
        for (key, models) in sortedKeyDic{
            sections.append(setionItems(sectionName: key, sectionModels: models))
        }

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
        
        return cell//cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return sections[section].sectionName
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
