//
//  UnController.swift
//  CleanToban
//
//  Created by KentaroAbe on 2017/05/08.
//  Copyright © 2017年 KentaroAbe. All rights reserved.
//

import UIKit
import Foundation
import SwiftyJSON
import NCMB

class UnityClassController : UIViewController {
    
    var UnRanIntA = 0
    var UnRanIntB = 0
    var UnRanIntC = 0
    var UnRanIntD = 0
    var UnRanStrA = "0"
    var UnRanStrB = "0"
    var UnRanStrC = "0"
    var UnRanStrD = "0"
    var UnRawJSA :JSON = "値がありません"
    var UnRawJSB :JSON = "値がありません"
    var UnRawJSC :JSON = "値がありません"
    var UnRawJSD :JSON = "値がありません"
    var UnStrJSA :String = "値がありません"
    var UnStrJSB :String = "値がありません"
    var UnStrJSC :String = "値がありません"
    var UnStrJSD :String = "値がありません"
    var UnFRawJSA :JSON = "値がありません"
    var UnFRawJSB :JSON = "値がありません"
    var UnFRawJSC :JSON = "値がありません"
    var UnFRawJSD :JSON = "値がありません"
    var UnFStrJA :String = "値がありません"
    var UnFStrJB :String = "値がありません"
    var UnFStrJC :String = "値がありません"
    var UnFStrJD :String = "値がありません"
    var standby = 0
    var isSearched = false
    var isSearched2 = false
    
    @IBOutlet weak var UnNameA: UILabel!
    @IBOutlet weak var UnNameB: UILabel!
    @IBOutlet weak var UnNameC: UILabel!
    @IBOutlet weak var UnNameD: UILabel!
    @IBOutlet weak var UnfA: UILabel!
    @IBOutlet weak var UnfB: UILabel!
    @IBOutlet weak var UnfC: UILabel!
    @IBOutlet weak var UnfD: UILabel!
    var myAp = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func SujiMotome() {
        myAp.ChangeValue = false
        UnRanIntA = Int(arc4random_uniform(39))+1
        UnRanIntB = Int(arc4random_uniform(39))+1
        UnRanIntC = Int(arc4random_uniform(39))+1
        UnRanIntD = Int(arc4random_uniform(39))+1
        
        for _ in 1...5 {
            if UnRanIntA == UnRanIntB {
                UnRanIntB += 1
            }
            if UnRanIntA == UnRanIntC {
                UnRanIntC += 1
            }
            if UnRanIntA == UnRanIntD {
                UnRanIntD += 1
            }
            if UnRanIntB == UnRanIntC {
                UnRanIntC += 1
            }
            if UnRanIntB == UnRanIntD {
                UnRanIntD += 1
            }
            if UnRanIntC == UnRanIntD {
                UnRanIntD += 1
            }
        }
        
        SujiDainyu()
    }
    @IBAction func StartButton(_ sender: Any) {
        print("処理に入りました")
        UnRanIntA = 0
        UnRanIntB = 0
        UnRanIntC = 0
        UnRanIntD = 0
        UnRanStrA = "0"
        UnRanStrB = "0"
        UnRanStrC = "0"
        UnRanStrD = "0"
        UnRawJSA = "値がありません"
        UnRawJSB = "値がありません"
        UnRawJSC = "値がありません"
        UnRawJSD = "値がありません"
        UnStrJSA = "値がありません"
        UnStrJSB = "値がありません"
        UnStrJSC = "値がありません"
        UnStrJSD = "値がありません"
        UnFRawJSA = "値がありません"
        UnFRawJSB = "値がありません"
        UnFRawJSC = "値がありません"
        UnFRawJSD = "値がありません"
        UnFStrJA = "値がありません"
        UnFStrJB = "値がありません"
        UnFStrJC = "値がありません"
        UnFStrJD = "値がありません"
        
        SujiMotome()
    }
    
    
    func SujiDainyu() {
        print(UnRanIntA)
        print(UnRanIntB)
        print(UnRanIntC)
        print(UnRanIntD)
        
        UnRanStrA = String(UnRanIntA)
        UnRanStrB = String(UnRanIntB)
        UnRanStrC = String(UnRanIntC)
        UnRanStrD = String(UnRanIntD)
        
        JsonDainyu()
    }
    
    func JsonDainyu() {
        
        let JsonData = JsonGet(fileName: "Meibo")
        
        if myAp.ChangeValue == true {
            UnRanStrA = myAp.newal_a!
            UnRanStrB = myAp.newal_b!
            UnRanStrC = myAp.newal_c!
            UnRanStrD = myAp.newal_d!
        }
        UnRawJSA = JsonData["Unity_Class"][UnRanStrA]["name"]
        UnRawJSB = JsonData["Unity_Class"][UnRanStrB]["name"]
        UnRawJSC = JsonData["Unity_Class"][UnRanStrC]["name"]
        UnRawJSD = JsonData["Unity_Class"][UnRanStrD]["name"]
        UnFRawJSA = JsonData["Unity_Class"][UnRanStrA]["Hurigana"]
        UnFRawJSB = JsonData["Unity_Class"][UnRanStrB]["Hurigana"]
        UnFRawJSC = JsonData["Unity_Class"][UnRanStrC]["Hurigana"]
        UnFRawJSD = JsonData["Unity_Class"][UnRanStrD]["Hurigana"]
        
        UnStrJSA = String(describing: UnRawJSA)
        UnStrJSB = String(describing: UnRawJSB)
        UnStrJSC = String(describing: UnRawJSC)
        UnStrJSD = String(describing: UnRawJSD)
        UnFStrJA = String(describing: UnFRawJSA)
        UnFStrJB = String(describing: UnFRawJSB)
        UnFStrJC = String(describing: UnFRawJSC)
        UnFStrJD = String(describing: UnFRawJSD)
        
        if UnStrJSA == "Empty"{
            SujiMotome()
        }
        if UnStrJSB == "Empty"{
            SujiMotome()
        }
        if UnStrJSC == "Empty"{
            SujiMotome()
        }
        if UnStrJSD == "Empty"{
            SujiMotome()
        }
        
        print(UnStrJSA)
        print(UnStrJSB)
        print(UnStrJSC)
        print(UnStrJSD)
        
        
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
        
        let query1 = NCMBQuery(className: "CurrentSoji_Unity")
        let query2 = NCMBQuery(className: "CurrentSoji_Unity")
        let query3 = NCMBQuery(className: "CurrentSoji_Unity")
        let query4 = NCMBQuery(className: "CurrentSoji_Unity")
        let query5 = NCMBQuery(className: "CurrentSoji_Unity")
        /** 条件を入れる場合はここに書きます **/
        query1?.whereKey("Name", equalTo: UnStrJSA)
        query2?.whereKey("Name", equalTo: UnStrJSB)
        query3?.whereKey("Name", equalTo: UnStrJSC)
        query4?.whereKey("Name", equalTo: UnStrJSD)
        // データストアの検索を実施
        let query = NCMBQuery.orQuery(withSubqueries: [query1!,query2!,query3!,query4!])
        query5?.whereKey("Date", equalTo: yesterday!)
        query5?.findObjectsInBackground({(objects, error) in
            if (error != nil){
                // 検索失敗時の処理
            }else{
                // 検索成功時の処理
                print("検索完了しました")
                self.isSearched = false
                //print(objects! as! [NCMBObject]) // (例)検索結果を表示する
                let Kekka = objects! as! [NCMBObject]
                let KekkaCount = String(Kekka.count)
                
                print("重複件数" + KekkaCount + "件")
                //if self.isSearched == true{
                    
                    
                if Kekka.count > 0{
                    print("氏名検索を行います")
                    query?.findObjectsInBackground({(twodata, error) in
                        if (error != nil){
                            // 検索失敗時の処理
                        }else{
                            // 検索成功時の処理
                            
                            let Kekka2 = twodata! as! [NCMBObject]
                            self.isSearched2 = true
                            let KekkaCount2 = String(twodata!.count)
                            self.wait( { return self.isSearched2 == false } ){
                            if Kekka2.count > 0 {
                                print("氏名の重複が確認されました")
                                print("重複件数" + KekkaCount2 + "件")
                                //self.SujiMotome()
                                
                            }else {
                                print("氏名の重複が確認されませんでした")
                                print("重複件数" + KekkaCount2 + "件")
                                
                            }
                            }
                            
                            //print(objects! as! [NCMBObject]) // (例)検索結果を表示する
                            
                        } })
                }else{
                    print("日付の重複が確認されませんでした")
                }
            }
           // }
        } )
        
        
        UnNameA.text = UnStrJSA
        UnNameB.text = UnStrJSB
        UnNameC.text = UnStrJSC
        UnNameD.text = UnStrJSD
        UnfA.text = UnFStrJA
        UnfB.text = UnFStrJB
        UnfC.text = UnFStrJC
        UnfD.text = UnFStrJD
        
        standby = 1
        //alert()
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
        let obj1 = NCMBObject(className: "CurrentSoji_Unity")
        print(today)
        // オブジェクトに値を設定
        /** 文字列 **/
        obj1?.setObject(UnStrJSA, forKey: "Name")
        obj1?.setObject(today, forKey: "Date")
        obj1?.saveInBackground({ (error) in
            if error != nil {
                print("error")
            }else{
                print("保存に成功しました")
            }
        })
        let obj2 = NCMBObject(className: "CurrentSoji_Unity")
        // オブジェクトに値を設定
        /** 文字列 **/
        obj2?.setObject(UnStrJSB, forKey: "Name")
        obj2?.setObject(today, forKey: "Date")
        obj2?.saveInBackground({ (error) in
            if error != nil {
                print("error")
            }else{
                print("保存に成功しました")
            }
        })
        let obj3 = NCMBObject(className: "CurrentSoji_Unity")
        // オブジェクトに値を設定
        /** 文字列 **/
        obj3?.setObject(UnStrJSC, forKey: "Name")
        obj3?.setObject(today, forKey: "Date")
        obj3?.saveInBackground({ (error) in
            if error != nil {
                print("error")
            }else{
                print("保存に成功しました")
            }
        })
        let obj4 = NCMBObject(className: "CurrentSoji_Unity")
        // オブジェクトに値を設定
        /** 文字列 **/
        obj4?.setObject(UnStrJSD, forKey: "Name")
        obj4?.setObject(today, forKey: "Date")
        obj4?.saveInBackground({ (error) in
            if error != nil {
                print("error")
            }else{
                print("保存に成功しました")
            }
        })
    }
    @IBAction func ChangeValue(_ sender: Any) {
        var myAp = UIApplication.shared.delegate as! AppDelegate                                //現在のデータをデリゲートに引き渡し
        myAp.current_a = UnStrJSA
        myAp.current_b = UnStrJSB
        myAp.current_c = UnStrJSC
        myAp.current_d = UnStrJSD
        myAp.current_aNum = UnRanStrA
        myAp.current_bNum = UnRanStrB
        myAp.current_cNum = UnRanStrC
        myAp.current_dNum = UnRanStrD
        myAp.MeClass = "Unity_Class"
        myAp.ClassName = "Un"
        myAp.ChangeValue = true                                                                 //数字調整フラグ有効化（戻ってきた時用）
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "dataKakikae") as! ChangeNumber
        self.present(nextView, animated: true, completion: nil)
        
    }
    
    func JsonGet(fileName :String) -> JSON {
        let path = Bundle.main.path(forResource: fileName, ofType: "json")
        print(path)
        
        do{
            let jsonStr = try String(contentsOfFile: path!)
           // print(jsonStr)
            
            let json = JSON.parse(jsonStr)
            
            return json
        } catch {
            return nil
        }
        
    }
    
    
}
