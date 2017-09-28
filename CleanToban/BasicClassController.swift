//
//  BasicClassController.swift
//  CleanToban
//
//  Created by KentaroAbe on 2017/05/08.
//  Copyright © 2017年 KentaroAbe. All rights reserved.
//

import UIKit
import Foundation
import SwiftyJSON
import NCMB

class BasicClassController : UIViewController {
    
    
    var BaRanIntA = 0
    var BaRanIntB = 0
    var BaRanIntC = 0
    var BaRanIntD = 0
    var BaRanStrA = "0"
    var BaRanStrB = "0"
    var BaRanStrC = "0"
    var BaRanStrD = "0"
    var BaRawJSA :JSON = "値がありません"
    var BaRawJSB :JSON = "値がありません"
    var BaRawJSC :JSON = "値がありません"
    var BaRawJSD :JSON = "値がありません"
    var BaStrJSA :String = "値がありません"
    var BaStrJSB :String = "値がありません"
    var BaStrJSC :String = "値がありません"
    var BaStrJSD :String = "値がありません"
    var BaFRawJSA :JSON = "値がありません"
    var BaFRawJSB :JSON = "値がありません"
    var BaFRawJSC :JSON = "値がありません"
    var BaFRawJSD :JSON = "値がありません"
    var BaFStrJA :String = "値がありません"
    var BaFStrJB :String = "値がありません"
    var BaFStrJC :String = "値がありません"
    var BaFStrJD :String = "値がありません"
    
    @IBOutlet weak var BaNameA: UILabel!
    @IBOutlet weak var BaNameB: UILabel!
    @IBOutlet weak var BaNameC: UILabel!
    @IBOutlet weak var BaNameD: UILabel!
    @IBOutlet weak var BafA: UILabel!
    @IBOutlet weak var BafB: UILabel!
    @IBOutlet weak var BafC: UILabel!
    @IBOutlet weak var BafD: UILabel!
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
        BaRanIntA = Int(arc4random_uniform(39))+1
        BaRanIntB = Int(arc4random_uniform(39))+1
        BaRanIntC = Int(arc4random_uniform(39))+1
        BaRanIntD = Int(arc4random_uniform(39))+1
        
        for i in 1...5 {
            if BaRanIntA == BaRanIntB {
                BaRanIntB += 1
            }
            if BaRanIntA == BaRanIntC {
                BaRanIntC += 1
            }
            if BaRanIntA == BaRanIntD {
                BaRanIntD += 1
            }
            if BaRanIntB == BaRanIntC {
                BaRanIntC += 1
            }
            if BaRanIntB == BaRanIntD {
                BaRanIntD += 1
            }
            if BaRanIntC == BaRanIntD {
                BaRanIntD += 1
            }
        }
        
        SujiDainyu()
    }
    @IBAction func StartButton(_ sender: Any) {
        print("処理に入りました")
        BaRanIntA = 0
        BaRanIntB = 0
        BaRanIntC = 0
        BaRanIntD = 0
        BaRanStrA = "0"
        BaRanStrB = "0"
        BaRanStrC = "0"
        BaRanStrD = "0"
        BaRawJSA = "値がありません"
        BaRawJSB = "値がありません"
        BaRawJSC = "値がありません"
        BaRawJSD = "値がありません"
        BaStrJSA = "値がありません"
        BaStrJSB = "値がありません"
        BaStrJSC = "値がありません"
        BaStrJSD = "値がありません"
        BaFRawJSA = "値がありません"
        BaFRawJSB = "値がありません"
        BaFRawJSC = "値がありません"
        BaFRawJSD = "値がありません"
        BaFStrJA = "値がありません"
        BaFStrJB = "値がありません"
        BaFStrJC = "値がありません"
        BaFStrJD = "値がありません"
        
        SujiMotome()
    }
    
    
    func SujiDainyu() {
        print(BaRanIntA)
        print(BaRanIntB)
        print(BaRanIntC)
        print(BaRanIntD)
        
        BaRanStrA = String(BaRanIntA)
        BaRanStrB = String(BaRanIntB)
        BaRanStrC = String(BaRanIntC)
        BaRanStrD = String(BaRanIntD)
        
        JsonDainyu()
    }
    
    func JsonDainyu() {
        
        let JsonData = JsonGet(fileName: "Meibo")
        
        if myAp.ChangeValue == true {
            BaRanStrA = myAp.newal_a!
            BaRanStrB = myAp.newal_b!
            BaRanStrC = myAp.newal_c!
            BaRanStrD = myAp.newal_d!
        }
        BaRawJSA = JsonData["Basic_Class"][BaRanStrA]["name"]
        BaRawJSB = JsonData["Basic_Class"][BaRanStrB]["name"]
        BaRawJSC = JsonData["Basic_Class"][BaRanStrC]["name"]
        BaRawJSD = JsonData["Basic_Class"][BaRanStrD]["name"]
        BaFRawJSA = JsonData["Basic_Class"][BaRanStrA]["Hurigana"]
        BaFRawJSB = JsonData["Basic_Class"][BaRanStrB]["Hurigana"]
        BaFRawJSC = JsonData["Basic_Class"][BaRanStrC]["Hurigana"]
        BaFRawJSD = JsonData["Basic_Class"][BaRanStrD]["Hurigana"]
        
        BaStrJSA = String(describing: BaRawJSA)
        BaStrJSB = String(describing: BaRawJSB)
        BaStrJSC = String(describing: BaRawJSC)
        BaStrJSD = String(describing: BaRawJSD)
        BaFStrJA = String(describing: BaFRawJSA)
        BaFStrJB = String(describing: BaFRawJSB)
        BaFStrJC = String(describing: BaFRawJSC)
        BaFStrJD = String(describing: BaFRawJSD)
        
        if BaStrJSA == "Empty"{
            SujiMotome()
        }
        if BaStrJSB == "Empty"{
            SujiMotome()
        }
        if BaStrJSC == "Empty"{
            SujiMotome()
        }
        if BaStrJSD == "Empty"{
            SujiMotome()
        }
        
        print(BaStrJSA)
        print(BaStrJSB)
        print(BaStrJSC)
        print(BaStrJSD)
        
        
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
        
        let query1 = NCMBQuery(className: "CurrentSoji_Basic")
        let query2 = NCMBQuery(className: "CurrentSoji_Basic")
        let query3 = NCMBQuery(className: "CurrentSoji_Basic")
        let query4 = NCMBQuery(className: "CurrentSoji_Basic")
        let query5 = NCMBQuery(className: "CurrentSoji_Basic")
        /** 条件を入れる場合はここに書きます **/
        query1?.whereKey("Name", equalTo: BaStrJSA)
        query2?.whereKey("Name", equalTo: BaStrJSB)
        query3?.whereKey("Name", equalTo: BaStrJSC)
        query4?.whereKey("Name", equalTo: BaStrJSD)
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
        BaNameA.text = BaStrJSA
        BaNameB.text = BaStrJSB
        BaNameC.text = BaStrJSC
        BaNameD.text = BaStrJSD
        BafA.text = BaFStrJA
        BafB.text = BaFStrJB
        BafC.text = BaFStrJC
        BafD.text = BaFStrJD
        
    }
    @IBAction func ChangeValue(_ sender: Any) {
        var myAp = UIApplication.shared.delegate as! AppDelegate                                //現在のデータをデリゲートに引き渡し
        myAp.current_a = BaStrJSA
        myAp.current_b = BaStrJSB
        myAp.current_c = BaStrJSC
        myAp.current_d = BaStrJSD
        myAp.current_aNum = BaRanStrA
        myAp.current_bNum = BaRanStrB
        myAp.current_cNum = BaRanStrC
        myAp.current_dNum = BaRanStrD
        myAp.MeClass = "Basic_Class"
        myAp.ClassName = "BasicClass"
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
        let obj1 = NCMBObject(className: "CurrentSoji_Basic")
        print(today)
        // オブジェクトに値を設定
        /** 文字列 **/
        obj1?.setObject(BaStrJSA, forKey: "Name")
        obj1?.setObject(today, forKey: "Date")
        obj1?.saveInBackground({ (error) in
            if error != nil {
                print("error")
            }else{
                print("保存に成功しました")
            }
        })
        let obj2 = NCMBObject(className: "CurrentSoji_Basic")
        // オブジェクトに値を設定
        /** 文字列 **/
        obj2?.setObject(BaStrJSB, forKey: "Name")
        obj2?.setObject(today, forKey: "Date")
        obj2?.saveInBackground({ (error) in
            if error != nil {
                print("error")
            }else{
                print("保存に成功しました")
            }
        })
        let obj3 = NCMBObject(className: "CurrentSoji_Basic")
        // オブジェクトに値を設定
        /** 文字列 **/
        obj3?.setObject(BaStrJSC, forKey: "Name")
        obj3?.setObject(today, forKey: "Date")
        obj3?.saveInBackground({ (error) in
            if error != nil {
                print("error")
            }else{
                print("保存に成功しました")
            }
        })
        let obj4 = NCMBObject(className: "CurrentSoji_Basic")
        // オブジェクトに値を設定
        /** 文字列 **/
        obj4?.setObject(BaStrJSD, forKey: "Name")
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
