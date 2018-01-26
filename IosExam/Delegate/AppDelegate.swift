//
//  AppDelegate.swift
//  IosExam
//
//  Created by Beaconyx on 2018. 1. 25..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit
import CoreData
import Parse

//{}접는 단축키 option+command+방향키 <- / ->
//줄맞춤 단축키 control + L
//스마트 드래그 shift + option <- / ->
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var companyDic = [String : CompanyModel]()
    
    var lectureModels = [LectureModel]()
    
    var lectureDic = [String : [LectureModel]]()
    
    var lectureDicKeys = [String]()
    
    let undefined : String = "undefined"
    
    struct TB_Lecture_Ko {
        let TABLENAME : String = "TB_Lecture_Ko"
        let LTE_SECTION : String = "LTE_SECTION"
        let LTE_SECTION_NUMBER : String = "LTE_SECTION_NUMBER"
        let LTE_TITLE : String = "LTE_TITLE"
        let LTE_IDX : String = "LTE_IDX"
    }
    
    struct TB_Company_Ko {
        let TABLENAME : String = "TB_Company_Ko"
        let CPY_BEACON_ID : String = "CPY_BEACON_ID"
        let CPY_TITLE : String = "CPY_TITLE"
        let CPY_HOMEPAGE : String! = "CPY_HOMEPAGE"
        let CPY_CONTACT_NUMBER : String! = "CPY_CONTACT_NUMBER"
        let CPY_REPRESENTATION : String! = "CPY_REPRESENTATION"
        let CPY_IDX : String! = "CPY_IDX"
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        parseInit(launchOptions: launchOptions)
        
        getParseLectureData()
        
        return true
    }
    
    func parseInit(launchOptions : [UIApplicationLaunchOptionsKey : Any]?) {
        Parse.enableLocalDatastore()
        let configuration = ParseClientConfiguration{
            $0.applicationId = "YesdexaAZx4r86eeoyIwwGfdfOLeT2CnQKFcQ1"
            $0.clientKey = "YesdexbeaconyxSwvy38GBFH6i1MZ2JGxfYkt2j4gaROGxy"
            $0.server = "http://www.beaconyx.co.kr:1337/parse"
        }
        
        Parse.initialize(with: configuration)
        PFAnalytics.trackAppOpened(launchOptions: launchOptions)
    }

    func getParseLectureData() {
        
        let table = TB_Lecture_Ko()
        
        let query = PFQuery(className: table.TABLENAME)
        query.order(byAscending: table.LTE_IDX)
        
        query.findObjectsInBackground(block: {(objects: [PFObject]?, error:Error?) in
            if error == nil{
                for object in objects!{
                    let model = LectureModel()
                    
                    let title = object.object(forKey: table.LTE_TITLE) as? String
                    let section = object.object(forKey: table.LTE_SECTION) as? String
                    let sectionNumber = object.object(forKey: table.LTE_SECTION_NUMBER) as? Int
                    
                    if (title != self.undefined && section != self.undefined && sectionNumber != nil) {
                        
                        model.title = title
                        model.section = section
                        model.headerNumber = sectionNumber
                        
                        self.lectureModels.append(model)
        
                    }
                }
            }
            //섹션들을 담을 배열 생성
            var sections = [String]()
            
            for model in self.lectureModels{
                sections.append(model.section!)
            }
            //중복제거
            let keys = Set(sections).sorted()
            
            for key in keys{
                var sectionModel = [LectureModel]()//같은 섹션모델들을 담을 array
                
                for lectureModel in self.lectureModels{
                    if key == lectureModel.section{ // 키와 모델의 섹션과 같다면
                        sectionModel.append(lectureModel)//같은 모델만 append
                    }
                }
                
                self.lectureDic[key] = sectionModel// dictionary에 해당 key와 value 할당
            }
            
        })
        
    }
    
    func getParseCompanyData(){
        
        let query = PFQuery(className: TB_Company_Ko().TABLENAME)
        query.order(byAscending: TB_Company_Ko().CPY_IDX)
        
        query.findObjectsInBackground(block: {(objects: [PFObject]?, error:Error?) in
            if(error == nil){
                
                for object in objects!{
                    let model = CompanyModel()//createContentModel
                    
                    model.beaconId = object.object(forKey: TB_Company_Ko().CPY_BEACON_ID) as? String
                    
                    model.title = object.object(forKey: TB_Company_Ko().CPY_TITLE) as? String
                    
                    //                    model.homePage = object.object(forKey: TB_Company_Ko.CPY_HOMEPAGE) as String
                    //                    model.callNumber = object.object(forKey: TB_Company_Ko.CPY_CONTACT_NUMBER) as String
                    //                    model.ceoName = object.object(forKey: TB_Company_Ko.CPY_REPRESENTATION) as String
                    
                    print(model.beaconId!)
                    
                    
                    self.companyDic[model.beaconId!] = model
                    
                    //강남지팡이 비콘 잡는부분 배열 뒤 두개
                    
                }
            }
            
            NotificationCenter.default.post(name: Notification.Name(rawValue: Key.NotificationNameKey.COMPANYDIC_KEY), object: self.companyDic)
        })
        
        
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "IosExam")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

