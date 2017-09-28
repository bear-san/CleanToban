//
//  MMixClassController.swift
//  CleanToban
//
//  Created by KentaroAbe on 2017/05/08.
//  Copyright © 2017年 KentaroAbe. All rights reserved.
//

import UIKit
import Foundation
import SwiftyJSON
import NCMB

class MMixClassController : UIViewController {
    
    
    var MMixRanIntA = 0
    var MMixRanIntB = 0
    var MMixRanIntC = 0
    var MMixRanIntD = 0
    var MMixRanStrA = "0"
    var MMixRanStrB = "0"
    var MMixRanStrC = "0"
    var MMixRanStrD = "0"
    var MMixRawJSA :JSON = "値がありません"
    var MMixRawJSB :JSON = "値がありません"
    var MMixRawJSC :JSON = "値がありません"
    var MMixRawJSD :JSON = "値がありません"
    var MMixStrJSA :String = "値がありません"
    var MMixStrJSB :String = "値がありません"
    var MMixStrJSC :String = "値がありません"
    var MMixStrJSD :String = "値がありません"
    var MMixFRawJSA :JSON = "値がありません"
    var MMixFRawJSB :JSON = "値がありません"
    var MMixFRawJSC :JSON = "値がありません"
    var MMixFRawJSD :JSON = "値がありません"
    var MMixFStrJA :String = "値がありません"
    var MMixFStrJB :String = "値がありません"
    var MMixFStrJC :String = "値がありません"
    var MMixFStrJD :String = "値がありません"
    
    @IBOutlet weak var MMNameA: UILabel!
    @IBOutlet weak var MMNameB: UILabel!
    @IBOutlet weak var MMNameC: UILabel!
    @IBOutlet weak var MMNameD: UILabel!
    @IBOutlet weak var MMfA: UILabel!
    @IBOutlet weak var MMfB: UILabel!
    @IBOutlet weak var MMfC: UILabel!
    @IBOutlet weak var MMfD: UILabel!
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
        myAp.ChangeValue = false
        MMixRanIntA = Int(arc4random_uniform(39))+1
        MMixRanIntB = Int(arc4random_uniform(39))+1
        MMixRanIntC = Int(arc4random_uniform(39))+1
        MMixRanIntD = Int(arc4random_uniform(39))+1
        
        for i in 1...5 {
            if MMixRanIntA == MMixRanIntB {
                MMixRanIntB += 1
            }
            if MMixRanIntA == MMixRanIntC {
                MMixRanIntC += 1
            }
            if MMixRanIntA == MMixRanIntD {
                MMixRanIntD += 1
            }
            if MMixRanIntB == MMixRanIntC {
                MMixRanIntC += 1
            }
            if MMixRanIntB == MMixRanIntD {
                MMixRanIntD += 1
            }
            if MMixRanIntC == MMixRanIntD {
                MMixRanIntD += 1
            }
        }
        
        SujiDainyu()
    }
    @IBAction func StartButton(_ sender: Any) {
        print("処理に入りました")
        MMixRanIntA = 0
        MMixRanIntB = 0
        MMixRanIntC = 0
        MMixRanIntD = 0
        MMixRanStrA = "0"
        MMixRanStrB = "0"
        MMixRanStrC = "0"
        MMixRanStrD = "0"
        MMixRawJSA = "値がありません"
        MMixRawJSB = "値がありません"
        MMixRawJSC = "値がありません"
        MMixRawJSD = "値がありません"
        MMixStrJSA = "値がありません"
        MMixStrJSB = "値がありません"
        MMixStrJSC = "値がありません"
        MMixStrJSD = "値がありません"
        MMixFRawJSA = "値がありません"
        MMixFRawJSB = "値がありません"
        MMixFRawJSC = "値がありません"
        MMixFRawJSD = "値がありません"
        MMixFStrJA = "値がありません"
        MMixFStrJB = "値がありません"
        MMixFStrJC = "値がありません"
        MMixFStrJD = "値がありません"
        
        SujiMotome()
    }
    
    
    func SujiDainyu() {
        print(MMixRanIntA)
        print(MMixRanIntB)
        print(MMixRanIntC)
        print(MMixRanIntD)
        
        MMixRanStrA = String(MMixRanIntA)
        MMixRanStrB = String(MMixRanIntB)
        MMixRanStrC = String(MMixRanIntC)
        MMixRanStrD = String(MMixRanIntD)
        
        JsonDainyu()
    }
    
    func JsonDainyu() {
        
        let JsonData = JsonGet(fileName: "Meibo")
        
        if myAp.ChangeValue == true {
            MMixRanStrA = myAp.newal_a!
            MMixRanStrB = myAp.newal_b!
            MMixRanStrC = myAp.newal_c!
            MMixRanStrD = myAp.newal_d!
        }
        MMixRawJSA = JsonData["MMix_Class"][MMixRanStrA]["name"]
        MMixRawJSB = JsonData["MMix_Class"][MMixRanStrB]["name"]
        MMixRawJSC = JsonData["MMix_Class"][MMixRanStrC]["name"]
        MMixRawJSD = JsonData["MMix_Class"][MMixRanStrD]["name"]
        MMixFRawJSA = JsonData["MMix_Class"][MMixRanStrA]["Hurigana"]
        MMixFRawJSB = JsonData["MMix_Class"][MMixRanStrB]["Hurigana"]
        MMixFRawJSC = JsonData["MMix_Class"][MMixRanStrC]["Hurigana"]
        MMixFRawJSD = JsonData["MMix_Class"][MMixRanStrD]["Hurigana"]
        
        MMixStrJSA = String(describing: MMixRawJSA)
        MMixStrJSB = String(describing: MMixRawJSB)
        MMixStrJSC = String(describing: MMixRawJSC)
        MMixStrJSD = String(describing: MMixRawJSD)
        MMixFStrJA = String(describing: MMixFRawJSA)
        MMixFStrJB = String(describing: MMixFRawJSB)
        MMixFStrJC = String(describing: MMixFRawJSC)
        MMixFStrJD = String(describing: MMixFRawJSD)
        
        if MMixStrJSA == "Empty"{
            SujiMotome()
        }
        if MMixStrJSB == "Empty"{
            SujiMotome()
        }
        if MMixStrJSC == "Empty"{
            SujiMotome()
        }
        if MMixStrJSD == "Empty"{
            SujiMotome()
        }
        
        print(MMixStrJSA)
        print(MMixStrJSB)
        print(MMixStrJSC)
        print(MMixStrJSD)
        
        
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
        
        print("今日："+today!+"です、そして"+"昨日："+yesterday!+"です")
        
        let query1 = NCMBQuery(className: "CurrentSoji_MMix")
        let query2 = NCMBQuery(className: "CurrentSoji_MMix")
        let query3 = NCMBQuery(className: "CurrentSoji_MMix")
        let query4 = NCMBQuery(className: "CurrentSoji_MMix")
        let query5 = NCMBQuery(className: "CurrentSoji_MMix")
        /** 条件を入れる場合はここに書きます **/
        query1?.whereKey("Name", equalTo: MMixStrJSA)
        query2?.whereKey("Name", equalTo: MMixStrJSB)
        query3?.whereKey("Name", equalTo: MMixStrJSC)
        query4?.whereKey("Name", equalTo: MMixStrJSD)
        // データストアの検索を実施
        let query = NCMBQuery.orQuery(withSubqueries: [query1!,query2!,query3!,query4!])
        query?.findObjectsInBackground({(objects, error) in
            if (error != nil){
                // 検索失敗時の処理
            }else{
                // 検索成功時の処理
                
                print("次点検索を行います")
                print("今日は：" + yesterday!)
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
                            //self.SujiMotome()
                            
                        }else {
                            let KekkaCount = String(Kekka.count)
                            print("重複が確認されませんでした")
                            print("重複件数" + KekkaCount + "件")
                        }
                        
                    } })
                //print(objects! as! [NCMBObject]) // (例)検索結果を表示する
                
            } })
        MMNameA.text = MMixStrJSA
        MMNameB.text = MMixStrJSB
        MMNameC.text = MMixStrJSC
        MMNameD.text = MMixStrJSD
        MMfA.text = MMixFStrJA
        MMfB.text = MMixFStrJB
        MMfC.text = MMixFStrJC
        MMfD.text = MMixFStrJD
        
    }
    @IBAction func ChangeValue(_ sender: Any) {
        var myAp = UIApplication.shared.delegate as! AppDelegate                                //現在のデータをデリゲートに引き渡し
        myAp.current_a = MMixStrJSA
        myAp.current_b = MMixStrJSB
        myAp.current_c = MMixStrJSC
        myAp.current_d = MMixStrJSD
        myAp.current_aNum = MMixRanStrA
        myAp.current_bNum = MMixRanStrB
        myAp.current_cNum = MMixRanStrC
        myAp.current_dNum = MMixRanStrD
        myAp.MeClass = "MMix_Class"
        myAp.ClassName = "MMixClass"
        myAp.ChangeValue = true                                                                 //数字調整フラグ有効化（戻ってきた時用）
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "dataKakikae") as! ChangeNumber
        self.present(nextView, animated: true, completion: nil)
        
    }
    @IBAction func Quit_Save(_ sender: Any) {
        // クラスのNCMBObjectを作成
        let date = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        let str_year = String(year)
        let str_month = String(month)
        let str_day = String(day)
        let today = str_year+"-"+str_month+"-"+str_day
        let obj1 = NCMBObject(className: "CurrentSoji_MMix")
        print(today)
        // オブジェクトに値を設定
        /** 文字列 **/
        obj1?.setObject(MMixStrJSA, forKey: "Name")
        obj1?.setObject(today, forKey: "Date")
        obj1?.saveInBackground({ (error) in
            if error != nil {
                print("error")
            }else{
                print("保存に成功しました")
            }
        })
        let obj2 = NCMBObject(className: "CurrentSoji_MMix")
        // オブジェクトに値を設定
        /** 文字列 **/
        obj2?.setObject(MMixStrJSB, forKey: "Name")
        obj2?.setObject(today, forKey: "Date")
        obj2?.saveInBackground({ (error) in
            if error != nil {
                print("error")
            }else{
                print("保存に成功しました")
            }
        })
        let obj3 = NCMBObject(className: "CurrentSoji_MMix")
        // オブジェクトに値を設定
        /** 文字列 **/
        obj3?.setObject(MMixStrJSC, forKey: "Name")
        obj3?.setObject(today, forKey: "Date")
        obj3?.saveInBackground({ (error) in
            if error != nil {
                print("error")
            }else{
                print("保存に成功しました")
            }
        })
        let obj4 = NCMBObject(className: "CurrentSoji_MMix")
        // オブジェクトに値を設定
        /** 文字列 **/
        obj4?.setObject(MMixStrJSD, forKey: "Name")
        obj4?.setObject(today, forKey: "Date")
        obj4?.saveInBackground({ (error) in
            if error != nil {
                print("error")
            }else{
                print("保存に成功しました")
            }
        })
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
    
    

}
