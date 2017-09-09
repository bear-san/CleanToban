//
//  ViewController.swift
//  CleanToban
//
//  Created by KentaroAbe on 2017/05/08.
//  Copyright © 2017年 KentaroAbe. All rights reserved.
//

//掃除当番決めプログラム
//名簿ファイルはJSONファイルであることを必須とします
//ATS（AppTransportSecurity）により、全ての通信はHTTPS通信を推奨されます

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    let currentVersion :Float = 1.1;

    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("https://dc.akbart.net/clean_toban/version.json").responseJSON { response in
            debugPrint(response)
            guard let object = response.result.value else {
                return
            }
            
            let json = JSON(object)
            print(json)
            let newest_AppVersion_InJson = json["Newest_Version"]["Version"]
            let newest_VersionStr = String(describing: newest_AppVersion_InJson)
            print(newest_VersionStr)
            let Newest_Version = Float(newest_VersionStr)
            print(self.currentVersion)
            if Newest_Version! > self.currentVersion {
                var alertController = UIAlertController(title: "Update", message: "最新版にアップデートを行ってください", preferredStyle: .alert)
                let otherAction = UIAlertAction(title: "Update", style: .default, handler: {action in
                    let url = NSURL(string:"https://dc.akbart.net/clean_toban/soji_dl.html")
                    let app:UIApplication = UIApplication.shared
                    app.openURL(url as! URL)
                })
                let cancelAction = UIAlertAction(
                    title: "Cancel", style: .default, handler: {action in
                        print("Update has Cancelled")
                }
            )
                alertController.addAction(otherAction)
                alertController.addAction(cancelAction)
                
                self.present(alertController, animated: true, completion: nil)
            }
        }
        
        
    }
    
    @IBAction func JsonView(_ sender: Any) {
        let url = NSURL(string: "https://dc.akbart.net/clean_toban/Meibo.json")
        if UIApplication.shared.canOpenURL(url! as URL){
            UIApplication.shared.openURL(url! as URL)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // APIへリクエストを送信

    @IBAction func returnToMe(segue: UIStoryboardSegue) { }
}

