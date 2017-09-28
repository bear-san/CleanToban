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
import RealmSwift

class regiData: Object{ //メタデータ・権限
    @objc dynamic var ID = 0 //生徒のID
    @objc dynamic var Kurasu = 0 //クラス(0->ハイエンド 1->Unity 2->MM)
}

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var MotomeClass = 0
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.array.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String {
        self.MotomeClass = row
        return array[row]
    }
    
    let array = ["ハイエンドクラス","Unityクラス","メディアミックスクラス"]
    
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var Class: UIPickerView!
    @IBOutlet weak var Seito1: UILabel!
    @IBOutlet weak var SeitoF1: UILabel!
    @IBOutlet weak var Seito2: UILabel!
    @IBOutlet weak var SeitoF2: UILabel!
    @IBOutlet weak var Seito3: UILabel!
    @IBOutlet weak var SeitoF3: UILabel!
    @IBOutlet weak var Seito4: UILabel!
    @IBOutlet weak var SeitoF4: UILabel!
    @IBOutlet weak var Re1: UIButton!
    @IBOutlet weak var Re2: UIButton!
    @IBOutlet weak var Re3: UIButton!
    @IBOutlet weak var Re4: UIButton!
    
    var First = UInt32(0)
    var Second = UInt32(0)
    var Third = UInt32(0)
    var Fourth = UInt32(0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Class.delegate = self
        Class.dataSource = self
        
    }
    
    @IBAction func GetRand(_ sender: Any) {
        Rand()
        
    }
    
    
    @IBAction func DataDelete(_ sender: Any) {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
        
        print("データを削除しました")
        
        let alert = UIAlertController(title: "Alert", message: "データを削除しました", preferredStyle: .alert)
        let OKButton = UIAlertAction(title: "OK", style: .default, handler: { action in
            print("OK")
        })
        alert.addAction(OKButton)
        present(alert, animated: true, completion: nil)
    }
    
    func Rand() {
        
        let JSON = JsonGet(fileName: "Meibo")
        
        var Kurasu = ""
        
        switch self.MotomeClass{
        case 0:
            Kurasu = "Hiend"
            self.First = arc4random_uniform(UInt32(22))
            self.Second = arc4random_uniform(UInt32(22))
            self.Third = arc4random_uniform(UInt32(22))
            self.Fourth = arc4random_uniform(UInt32(22))
            for _ in 1...10{
                if self.First == UInt32(0){
                    self.First = arc4random_uniform(UInt32(22))
                }
                if self.Second == UInt32(0){
                    self.Second = arc4random_uniform(UInt32(22))
                }
                if self.Third == UInt32(0){
                    self.Third = arc4random_uniform(UInt32(22))
                }
                if self.Fourth == UInt32(0){
                    self.Fourth = arc4random_uniform(UInt32(22))
                }
            }
            break
        case 1:
            Kurasu = "Unity"
            self.First = arc4random_uniform(UInt32(30))
            self.Second = arc4random_uniform(UInt32(30))
            self.Third = arc4random_uniform(UInt32(30))
            self.Fourth = arc4random_uniform(UInt32(30))
            for _ in 1...10{
                if self.First == UInt32(0){
                    self.First = arc4random_uniform(UInt32(30))
                }
                if self.Second == UInt32(0){
                    self.Second = arc4random_uniform(UInt32(30))
                }
                if self.Third == UInt32(0){
                    self.Third = arc4random_uniform(UInt32(30))
                }
                if self.Fourth == UInt32(0){
                    self.Fourth = arc4random_uniform(UInt32(30))
                }
            }
            break
        case 2:
            Kurasu = "MediaMix"
            self.First = arc4random_uniform(UInt32(37))
            self.Second = arc4random_uniform(UInt32(37))
            self.Third = arc4random_uniform(UInt32(37))
            self.Fourth = arc4random_uniform(UInt32(37))
            
            for _ in 1...10{
                if self.First == UInt32(0){
                    self.First = arc4random_uniform(UInt32(37))
                }
                if self.Second == UInt32(0){
                    self.Second = arc4random_uniform(UInt32(37))
                }
                if self.Third == UInt32(0){
                    self.Third = arc4random_uniform(UInt32(37))
                }
                if self.Fourth == UInt32(0){
                    self.Fourth = arc4random_uniform(UInt32(37))
                }
            }
            break
        default:
            Kurasu = "error"
            break
        }
        
        print(JSON[Kurasu][String(describing:self.First)]["ID"])
        print(JSON[Kurasu][String(describing:self.Second)]["ID"])
        print(JSON[Kurasu][String(describing:self.Third)]["ID"])
        print(JSON[Kurasu][String(describing:self.Fourth)]["ID"])
        
        
        for _ in 1...10{
            if JSON[Kurasu][String(describing:self.First)]["ID"] != nil{
                self.Seito1.text = String(describing:JSON[Kurasu][String(describing:self.First)]["name"])
                self.SeitoF1.text = String(describing:JSON[Kurasu][String(describing:self.First)]["Hurigana"])
            }else{
                self.First = arc4random_uniform(UInt32(40))
            }
            if JSON[Kurasu][String(describing:Second)]["ID"] != nil{
                self.Seito2.text = String(describing:JSON[Kurasu][String(describing:self.Second)]["name"])
                self.SeitoF2.text = String(describing:JSON[Kurasu][String(describing:self.Second)]["Hurigana"])
            }else{
                self.Second = arc4random_uniform(UInt32(40))
            }
            if JSON[Kurasu][String(describing:Third)]["ID"] != nil{
                self.Seito3.text = String(describing:JSON[Kurasu][String(describing:self.Third)]["name"])
                self.SeitoF3.text = String(describing:JSON[Kurasu][String(describing:self.Third)]["Hurigana"])
            }else{
                self.Third = arc4random_uniform(UInt32(40))
            }
            if JSON[Kurasu][String(describing:Fourth)]["ID"] != nil{
                self.Seito4.text = String(describing:JSON[Kurasu][String(describing:self.Fourth)]["name"])
                self.SeitoF4.text = String(describing:JSON[Kurasu][String(describing:self.Fourth)]["Hurigana"])
            }else{
                self.Fourth = arc4random_uniform(UInt32(40))
            }
        }
    }
    
    
    @IBAction func One(_ sender: Any) {
        rewrite(Num: 1)
    }
    
    @IBAction func Two(_ sender: Any) {
        rewrite(Num: 2)
    }
    
    
    @IBAction func Three(_ sender: Any) {
        rewrite(Num: 3)
    }
    
    
    @IBAction func Four(_ sender: Any) {
        rewrite(Num: 4)
    }
    
    func rewrite(Num:Int){
        let JSON = JsonGet(fileName: "Meibo")
        var Kurasu = ""
        switch self.MotomeClass{
        case 0:
            Kurasu = "Hiend"
            break
        case 1:
            Kurasu = "Unity"
            break
        case 2:
            Kurasu = "MediaMix"
            break
        default:
            Kurasu = "error"
            break
        }
        switch Num{
        case 1:
            self.First = arc4random_uniform(UInt32(40))
            self.Seito1.text = String(describing:JSON[Kurasu][String(describing:self.First)]["name"])
            self.SeitoF1.text = String(describing:JSON[Kurasu][String(describing:self.First)]["Hurigana"])
        case 2:
            self.Second = arc4random_uniform(UInt32(40))
            self.Seito2.text = String(describing:JSON[Kurasu][String(describing:self.Second)]["name"])
            self.SeitoF2.text = String(describing:JSON[Kurasu][String(describing:self.Second)]["Hurigana"])
        case 3:
            self.Third = arc4random_uniform(UInt32(40))
            self.Seito3.text = String(describing:JSON[Kurasu][String(describing:self.Third)]["name"])
            self.SeitoF3.text = String(describing:JSON[Kurasu][String(describing:self.Third)]["Hurigana"])
        case 4:
            self.Fourth = arc4random_uniform(UInt32(40))
            self.Seito4.text = String(describing:JSON[Kurasu][String(describing:self.Fourth)]["name"])
            self.SeitoF4.text = String(describing:JSON[Kurasu][String(describing:self.Fourth)]["Hurigana"])
        default:
            break
        }
    }
    
    @IBAction func DaburiKakunin(_ sender: Any) {
        let DB = try! Realm()
        let database = DB.objects(regiData.self)
        var data = database.sorted(byKeyPath: "ID")
        switch self.MotomeClass{
        case 0:
            data = database.filter("Kurasu == 0")
        case 1:
            data = database.filter("Kurasu == 1")
        case 2:
            data = database.filter("Kurasu == 2")
        default:
            break
        }
        if data.count >= 1{
            for i in 0...data.count-1{
                if data[i].ID == Int(self.First){
                    let alert = UIAlertController.init(title: "Alert", message: "1番の数字が重複しています", preferredStyle: .alert)
                    let OKButton = UIAlertAction(title: "OK", style: .default, handler: {action in
                        print("OK")
                    })
                    
                    alert.addAction(OKButton)
                    present(alert, animated: true, completion: nil)
                    
                }
                if data[i].ID == Int(self.Second){
                    let alert = UIAlertController.init(title: "Alert", message: "2番の数字が重複しています", preferredStyle: .alert)
                    let OKButton = UIAlertAction(title: "OK", style: .default, handler: {action in
                        print("OK")
                    })
                    
                    alert.addAction(OKButton)
                    present(alert, animated: true, completion: nil)
                    
                }
                if data[i].ID == Int(self.Third){
                    let alert = UIAlertController.init(title: "Alert", message: "3番の数字が重複しています", preferredStyle: .alert)
                    let OKButton = UIAlertAction(title: "OK", style: .default, handler: {action in
                        print("OK")
                    })
                    
                    alert.addAction(OKButton)
                    present(alert, animated: true, completion: nil)
                    
                }
                if data[i].ID == Int(self.Fourth){
                    let alert = UIAlertController.init(title: "Alert", message: "4番の数字が重複しています", preferredStyle: .alert)
                    let OKButton = UIAlertAction(title: "OK", style: .default, handler: {action in
                        print("OK")
                    })
                    
                    alert.addAction(OKButton)
                    present(alert, animated: true, completion: nil)
                    
                }
            }
        }else{
            let alert = UIAlertController.init(title: "Alert", message: "データなんてねーよ！！", preferredStyle: .alert)
            let OKButton = UIAlertAction(title: "OK", style: .default, handler: {action in
                print("OK")
            })
            
            alert.addAction(OKButton)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    
    
    @IBAction func Register(_ sender: Any) {
        let DB = try! Realm()
        var RestData = regiData()
        var RestData2 = regiData()
        var RestData3 = regiData()
        var RestData4 = regiData()
        
        RestData.ID = Int(self.First)
        RestData.Kurasu = self.MotomeClass
        RestData2.ID = Int(self.Second)
        RestData2.Kurasu = self.MotomeClass
        RestData3.ID = Int(self.Third)
        RestData3.Kurasu = self.MotomeClass
        RestData4.ID = Int(self.Fourth)
        RestData4.Kurasu = self.MotomeClass
        
        try! DB.write(){
            DB.add(RestData)
            DB.add(RestData2)
            DB.add(RestData3)
            DB.add(RestData4)
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

