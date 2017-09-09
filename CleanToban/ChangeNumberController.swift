//
//  ChangeNumber.swift
//  CleanToban
//
//  Created by KentaroAbe on 2017/05/09.
//  Copyright © 2017年 KentaroAbe. All rights reserved.
//

import UIKit
import Foundation
import SwiftyJSON

class ChangeNumber : UIViewController {
    @IBOutlet weak var NowA: UILabel!
    @IBOutlet weak var NowB: UILabel!
    @IBOutlet weak var NowC: UILabel!
    @IBOutlet weak var NowD: UILabel!
    @IBOutlet weak var NewA_Input: UITextField!
    @IBOutlet weak var NewB_Input: UITextField!
    @IBOutlet weak var NewC_Input: UITextField!
    @IBOutlet weak var NewD_Input: UITextField!
    var ClassName = "値がありません"
    
    var json_no_naha = "Meibo"
    
    var myAp = UIApplication.shared.delegate as! AppDelegate
    
    
    
    let CurrentControllerName = "Controller"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print(myAp.current_a)
        print(myAp.current_b)
        print(myAp.current_c)
        print(myAp.current_d)
        NowA.text = myAp.current_a!
        NowB.text = myAp.current_b!
        NowC.text = myAp.current_c!
        NowD.text = myAp.current_d!
        NewA_Input.text = myAp.current_aNum
        NewB_Input.text = myAp.current_bNum
        NewC_Input.text = myAp.current_cNum
        NewD_Input.text = myAp.current_dNum
        ClassName = myAp.MeClass!
        
    }
    
    @IBAction func Submit(_ sender: Any) {
        myAp.newal_a = NewA_Input.text
        myAp.newal_b = NewB_Input.text
        myAp.newal_c = NewC_Input.text
        myAp.newal_d = NewD_Input.text
        
        myAp.ChangeValue = true
        myAp.MeClass = nil
        if let controller = self.presentingViewController as? HiendClassController {
            controller.JsonDainyu()
        }
        if let controller = self.presentingViewController as? UnityClassController {
            controller.JsonDainyu()
        }
        if let controller = self.presentingViewController as? BasicClassController {
            controller.JsonDainyu()
        }
        if let controller = self.presentingViewController as? MMixClassController {
            controller.JsonDainyu()
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func A_random(_ sender: Any) {
        var Arandom_Int = Int(arc4random_uniform(39))+1
        for i in 1...5{
            if Arandom_Int == Int(myAp.current_bNum) {
                Arandom_Int += 1
            }
            if Arandom_Int == Int(myAp.current_cNum) {
                Arandom_Int += 1
            }
            if Arandom_Int == Int(myAp.current_dNum) {
                Arandom_Int += 1
            }
        }
        NewA_Input.text = String(Arandom_Int)
        let JsonA = JsonGet(fileName: json_no_naha)
        let Arand = String(Arandom_Int)
        NowA.text = String(describing: JsonA[ClassName][Arand]["name"])
    }
  
    
    
    @IBAction func B_random(_ sender: Any) {
        var Brandom_Int = Int(arc4random_uniform(39))+1
        for i in 1...5{
            if Brandom_Int == Int(myAp.current_aNum) {
                Brandom_Int += 1
            }
            if Brandom_Int == Int(myAp.current_cNum) {
                Brandom_Int += 1
            }
            if Brandom_Int == Int(myAp.current_dNum) {
                Brandom_Int += 1
            }
        }
        NewB_Input.text = String(Brandom_Int)
        let JsonB = JsonGet(fileName: json_no_naha)
        let Brand = String(Brandom_Int)
        NowB.text = String(describing: JsonB[ClassName][Brand]["name"])
    }
    
    @IBAction func C_random(_ sender: Any) {
        var Crandom_Int = Int(arc4random_uniform(39))+1
        for i in 1...5{
            if Crandom_Int == Int(myAp.current_aNum) {
                Crandom_Int += 1
            }
            if Crandom_Int == Int(myAp.current_bNum) {
                Crandom_Int += 1
            }
            if Crandom_Int == Int(myAp.current_dNum) {
                Crandom_Int += 1
            }
        }
        NewC_Input.text = String(Crandom_Int)
        let JsonC = JsonGet(fileName: json_no_naha)
        let Crand = String(Crandom_Int)
        NowC.text = String(describing: JsonC[ClassName][Crand]["name"])
    }
    
    @IBAction func D_random(_ sender: Any) {
        var Drandom_Int = Int(arc4random_uniform(39))+1
        for i in 1...5{
            if Drandom_Int == Int(myAp.current_aNum) {
                Drandom_Int += 1
            }
            if Drandom_Int == Int(myAp.current_bNum) {
                Drandom_Int += 1
            }
            if Drandom_Int == Int(myAp.current_cNum) {
                Drandom_Int += 1
            }
        }
        NewD_Input.text = String(Drandom_Int)
        let JsonD = JsonGet(fileName: json_no_naha)
        let Drand = String(Drandom_Int)
        NowD.text = String(describing: JsonD[ClassName][Drand]["name"])
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
    @IBAction func Cancel(_ sender: Any) {
        NowA.text = myAp.current_a!
        NowB.text = myAp.current_b!
        NowC.text = myAp.current_c!
        NowD.text = myAp.current_d!
        NewA_Input.text = myAp.current_aNum
        NewB_Input.text = myAp.current_bNum
        NewC_Input.text = myAp.current_cNum
        NewD_Input.text = myAp.current_dNum
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (self.NewA_Input.isFirstResponder) {
            self.NewA_Input.resignFirstResponder()
        }
        if (self.NewB_Input.isFirstResponder) {
            self.NewB_Input.resignFirstResponder()
        }
        if (self.NewC_Input.isFirstResponder) {
            self.NewC_Input.resignFirstResponder()
        }
        if (self.NewD_Input.isFirstResponder) {
            self.NewD_Input.resignFirstResponder()
        }
    }

    
}
