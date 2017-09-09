//
//  HiendClassController.swift
//  CleanToban
//
//  Created by KentaroAbe on 2017/05/08.
//  Copyright © 2017年 KentaroAbe. All rights reserved.
//

import UIKit
import Foundation
import SwiftyJSON
import NCMB

class HiendClassController: UIViewController {

    var HiendRanIntA = 0
    var HiendRanIntB = 0
    var HiendRanIntC = 0
    var HiendRanIntD = 0
    var HiendRanStrA = "0"
    var HiendRanStrB = "0"
    var HiendRanStrC = "0"
    var HiendRanStrD = "0"
    var HiendRawJSA :JSON = "値がありません"
    var HiendRawJSB :JSON = "値がありません"
    var HiendRawJSC :JSON = "値がありません"
    var HiendRawJSD :JSON = "値がありません"
    var HiendStrJSA :String = "値がありません"
    var HiendStrJSB :String = "値がありません"
    var HiendStrJSC :String = "値がありません"
    var HiendStrJSD :String = "値がありません"
    var HiendFRawJSA :JSON = "値がありません"
    var HiendFRawJSB :JSON = "値がありません"
    var HiendFRawJSC :JSON = "値がありません"
    var HiendFRawJSD :JSON = "値がありません"
    var HiendFStrJA :String = "値がありません"
    var HiendFStrJB :String = "値がありません"
    var HiendFStrJC :String = "値がありません"
    var HiendFStrJD :String = "値がありません"
    var hadUploaded = false
    
    @IBOutlet weak var HiNameA: UILabel!
    @IBOutlet weak var HiNameB: UILabel!
    @IBOutlet weak var HiNameC: UILabel!
    @IBOutlet weak var HiNameD: UILabel!
    @IBOutlet weak var HifA: UILabel!
    @IBOutlet weak var HifB: UILabel!
    @IBOutlet weak var HifC: UILabel!
    @IBOutlet weak var HifD: UILabel!
    var myAp = UIApplication.shared.delegate as! AppDelegate
    
    
    override func viewDidLoad() {
                super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("表示されました")
        
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func SujiMotome() {
        if self.hadUploaded == false{
            
            myAp.ChangeValue = false
            HiendRanIntA = Int(arc4random_uniform(39))+1
            HiendRanIntB = Int(arc4random_uniform(39))+1
            HiendRanIntC = Int(arc4random_uniform(39))+1
            HiendRanIntD = Int(arc4random_uniform(39))+1
            
            for i in 1...5 {
                if HiendRanIntA == HiendRanIntB {
                    HiendRanIntB += 1
                }
                if HiendRanIntA == HiendRanIntC {
                    HiendRanIntC += 1
                }
                if HiendRanIntA == HiendRanIntD {
                    HiendRanIntD += 1
                }
                if HiendRanIntB == HiendRanIntC {
                    HiendRanIntC += 1
                }
                if HiendRanIntB == HiendRanIntD {
                    HiendRanIntD += 1
                }
                if HiendRanIntC == HiendRanIntD {
                    HiendRanIntD += 1
                }
            }
            
            SujiDainyu()
        }
    }
    @IBAction func StartButton(_ sender: Any) {
        print("処理に入りました")
        HiendRanIntA = 0
        HiendRanIntB = 0
        HiendRanIntC = 0
        HiendRanIntD = 0
        HiendRanStrA = "0"
        HiendRanStrB = "0"
        HiendRanStrC = "0"
        HiendRanStrD = "0"
        HiendRawJSA = "値がありません"
        HiendRawJSB = "値がありません"
        HiendRawJSC = "値がありません"
        HiendRawJSD = "値がありません"
        HiendStrJSA = "値がありません"
        HiendStrJSB = "値がありません"
        HiendStrJSC = "値がありません"
        HiendStrJSD = "値がありません"
        HiendFRawJSA = "値がありません"
        HiendFRawJSB = "値がありません"
        HiendFRawJSC = "値がありません"
        HiendFRawJSD = "値がありません"
        HiendFStrJA = "値がありません"
        HiendFStrJB = "値がありません"
        HiendFStrJC = "値がありません"
        HiendFStrJD = "値がありません"

        SujiMotome()
    }
    
    
    func SujiDainyu() {
        print(HiendRanIntA)
        print(HiendRanIntB)
        print(HiendRanIntC)
        print(HiendRanIntD)

        HiendRanStrA = String(HiendRanIntA)
        HiendRanStrB = String(HiendRanIntB)
        HiendRanStrC = String(HiendRanIntC)
        HiendRanStrD = String(HiendRanIntD)
        
        JsonDainyu()
    }
    
    func JsonDainyu() {
        
        let JsonData = JsonGet(fileName: "Meibo")
        
        if myAp.ChangeValue == true {
            HiendRanStrA = myAp.newal_a!
            HiendRanStrB = myAp.newal_b!
            HiendRanStrC = myAp.newal_c!
            HiendRanStrD = myAp.newal_d!
        }
        HiendRawJSA = JsonData["Hiend_Class"][HiendRanStrA]["name"]
        HiendRawJSB = JsonData["Hiend_Class"][HiendRanStrB]["name"]
        HiendRawJSC = JsonData["Hiend_Class"][HiendRanStrC]["name"]
        HiendRawJSD = JsonData["Hiend_Class"][HiendRanStrD]["name"]
        HiendFRawJSA = JsonData["Hiend_Class"][HiendRanStrA]["Hurigana"]
        HiendFRawJSB = JsonData["Hiend_Class"][HiendRanStrB]["Hurigana"]
        HiendFRawJSC = JsonData["Hiend_Class"][HiendRanStrC]["Hurigana"]
        HiendFRawJSD = JsonData["Hiend_Class"][HiendRanStrD]["Hurigana"]
        
        HiendStrJSA = String(describing: HiendRawJSA)
        HiendStrJSB = String(describing: HiendRawJSB)
        HiendStrJSC = String(describing: HiendRawJSC)
        HiendStrJSD = String(describing: HiendRawJSD)
        HiendFStrJA = String(describing: HiendFRawJSA)
        HiendFStrJB = String(describing: HiendFRawJSB)
        HiendFStrJC = String(describing: HiendFRawJSC)
        HiendFStrJD = String(describing: HiendFRawJSD)
        
        if HiendStrJSA == "Empty"{
            SujiMotome()
        }
        if HiendStrJSB == "Empty"{
            SujiMotome()
        }
        if HiendStrJSC == "Empty"{
            SujiMotome()
        }
        if HiendStrJSD == "Empty"{
            SujiMotome()
        }
        
        print(HiendStrJSA)
        print(HiendStrJSB)
        print(HiendStrJSC)
        print(HiendStrJSD)
        
       
        
        Display()

    }
    
    func Display() {
        let date = Date()
        
        let dateFormatter = DateFormatter()
        //表示のためにフォーマット設定
        dateFormatter.dateFormat = "yyyy-MM-dd" // 日付フォーマットの設定
        var time = date.timeIntervalSince1970
        time += -60*60*24 //２４時間後の時間を加算(６０秒*６０分*２４時間)
        
        //新しく日時取得
        let newDate:Date = Date.init(timeIntervalSince1970:time)
        let today = String(dateFormatter.string(from:date))
        let yesterday = String(dateFormatter.string(from:newDate))
        
        print("今日："+today!+"です、そして"+"昨日は"+yesterday!+"です")
        
        // TestClassクラスを検索するNCMBQueryを作成
        let query1 = NCMBQuery(className: "CurrentSoji_Hiend")
        let query2 = NCMBQuery(className: "CurrentSoji_Hiend")
        let query3 = NCMBQuery(className: "CurrentSoji_Hiend")
        let query4 = NCMBQuery(className: "CurrentSoji_Hiend")
        let query5 = NCMBQuery(className: "CurrentSoji_Hiend")
        /** 条件を入れる場合はここに書きます **/
        query1?.whereKey("Name", equalTo: HiendStrJSA)
        query2?.whereKey("Name", equalTo: HiendStrJSB)
        query3?.whereKey("Name", equalTo: HiendStrJSC)
        query4?.whereKey("Name", equalTo: HiendStrJSD)
        // データストアの検索を実施
        let query = NCMBQuery.orQuery(withSubqueries: [query1!,query2!,query3!,query4!])
            query?.findObjectsInBackground({(objects, error) in
            if (error != nil){
                // 検索失敗時の処理
            }else{
                // 検索成功時の処理
                print("次点検索を行います")
                print("昨日は:" + yesterday!)
                query5?.whereKey("Date", equalTo: yesterday!)
                query5?.findObjectsInBackground({(objects2, error) in
                    if (error != nil){
                        // 検索失敗時の処理
                    }else{
                        // 検索成功時の処理
                        print("検索完了しました")
                        query5?.whereKey("Date", equalTo:yesterday!)
                        
                        //print(objects! as! [NCMBObject]) // (例)検索結果を表示する
                        let Kekka = objects2! as! [NCMBObject]
                        
                        if Kekka.count > 0 {
                            print("重複が確認されました")
                            let KekkaCount = String(Kekka.count)
                            print("重複件数" + KekkaCount + "件")
                            //self.SujiMotome()
                            
                        }else {
                            let KekkaCount = String(Kekka.count)
                            print("重複が確認されませんでした")
                            print("重複件数" + KekkaCount + "件")
                        }
                        
                    } })
                //print(objects! as! [NCMBObject]) // (例)検索結果を表示する
                
            } })
        
            
       
        HiNameA.text = HiendStrJSA
        HiNameB.text = HiendStrJSB
        HiNameC.text = HiendStrJSC
        HiNameD.text = HiendStrJSD
        HifA.text = HiendFStrJA
        HifB.text = HiendFStrJB
        HifC.text = HiendFStrJC
        HifD.text = HiendFStrJD
        
        
    }
    func DidMaked() {
        print("Error!!")
        viewDidLoad()
    }
    @IBAction func ChangeValue(_ sender: Any) {
        var myAp = UIApplication.shared.delegate as! AppDelegate                                //現在のデータをデリゲートに引き渡し
        myAp.current_a = HiendStrJSA
        myAp.current_b = HiendStrJSB
        myAp.current_c = HiendStrJSC
        myAp.current_d = HiendStrJSD
        myAp.current_aNum = HiendRanStrA
        myAp.current_bNum = HiendRanStrB
        myAp.current_cNum = HiendRanStrC
        myAp.current_dNum = HiendRanStrD
        myAp.MeClass = "Hiend_Class"
        myAp.ClassName = "HiendClass"
        myAp.ChangeValue = true                                                                 //数字調整フラグ有効化（戻ってきた時用）
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "dataKakikae") as! ChangeNumber
        self.present(nextView, animated: true, completion: nil)
        
    }
    
    @IBAction func Quit_Save(_ sender: Any) {
        // クラスのNCMBObjectを作成
        let date = Date()
        
        let dateFormatter = DateFormatter()
        //表示のためにフォーマット設定
        dateFormatter.dateFormat = "yyyy-MM-dd" // 日付フォーマットの設定
        var time = date.timeIntervalSince1970
        time += -60*60*24 //２４時間後の時間を加算(６０秒*６０分*２４時間)
        
        //新しく日時取得
        let newDate:Date = Date.init(timeIntervalSince1970:time)
        let today = String(dateFormatter.string(from:date))
        let obj1 = NCMBObject(className: "CurrentSoji_Hiend")
        print(today)
        // オブジェクトに値を設定
        /** 文字列 **/
        obj1?.setObject(HiendStrJSA, forKey: "Name")
        obj1?.setObject(today, forKey: "Date")
        obj1?.saveInBackground({ (error) in
            if error != nil {
                print("error")
            }else{
                print("保存に成功しました")
            }
        })
        let obj2 = NCMBObject(className: "CurrentSoji_Hiend")
        // オブジェクトに値を設定
        /** 文字列 **/
        obj2?.setObject(HiendStrJSB, forKey: "Name")
        obj2?.setObject(today, forKey: "Date")
        obj2?.saveInBackground({ (error) in
            if error != nil {
                print("error")
            }else{
                print("保存に成功しました")
            }
        })
        let obj3 = NCMBObject(className: "CurrentSoji_Hiend")
        // オブジェクトに値を設定
        /** 文字列 **/
        obj3?.setObject(HiendStrJSC, forKey: "Name")
        obj3?.setObject(today, forKey: "Date")
        obj3?.saveInBackground({ (error) in
            if error != nil {
                print("error")
            }else{
                print("保存に成功しました")
            }
        })
        let obj4 = NCMBObject(className: "CurrentSoji_Hiend")
        // オブジェクトに値を設定
        /** 文字列 **/
        obj4?.setObject(HiendStrJSD, forKey: "Name")
        obj4?.setObject(today, forKey: "Date")
        obj4?.saveInBackground({ (error) in
            if error != nil {
                print("error")
            }else{
                print("保存に成功しました")
            }
        })
        
        self.hadUploaded = true
        self.dismiss(animated: true, completion: nil)
    }
    func JsonGet(fileName :String) -> JSON {
        let path = Bundle.main.path(forResource: fileName, ofType: "json")
        print(path)
        
        do{
            let jsonStr = try String(contentsOfFile: path!)
            print(jsonStr)
            
            let json = JSON.parse(jsonStr)
            
            return json
        } catch {
            return nil
        }
        
    }
    
    func wait(_ waitContinuation: @escaping (()->Bool), compleation: @escaping (()->Void)) {
        var wait = waitContinuation()
        // 0.01秒周期で待機条件をクリアするまで待ちます。
        let semaphore = DispatchSemaphore(value: 0)
        DispatchQueue.global().async {
            while wait {
                DispatchQueue.main.async {
                    wait = waitContinuation()
                    semaphore.signal()
                }
                semaphore.wait()
                Thread.sleep(forTimeInterval: 0.01)
            }
            // 待機条件をクリアしたので通過後の処理を行います。
            DispatchQueue.main.async {
                compleation()
            }
        }
    }
    
    
}
