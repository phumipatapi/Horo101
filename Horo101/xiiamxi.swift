//
//  xiiamxi.swift
//  Horo101
//
//  Created by Phumipat Apivansri on 17/11/2563 BE.
//

import UIKit
import AudioToolbox


class xiiamxi: UIViewController {
    var xiamxi = [xiamsi]()
    var xiamxino = [Int]()
    var xiamxiluck = [String]()
    @IBOutlet weak var shakebutton: UIButton!
    @IBOutlet weak var luckshow: UIView!
    @IBAction func shakebtn(_ sender: Any) {
        UIDevice.vibrate()
        let randomno = xiamxino.randomElement()
        
        nolb.text = String(xiamxino[randomno!-1])
        lucklb.text = xiamxiluck[randomno!-1]
        luckshow.isHidden = false
        luckshow.isUserInteractionEnabled = true
    }
    
    @IBOutlet weak var iconpic: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        luckshow.layer.cornerRadius = 30
        luckshow.isHidden = true
        // Do any additional setup after loading the view.
        xiiamsiprovide().loadsiiamsi{ xiiamsi in
            self.xiamxi = xiiamsi
        }
        collectdata()
        iconpic.layer.cornerRadius = 30
        
        self.lucklb.adjustsFontSizeToFitWidth = true
        self.lucklb.minimumScaleFactor = 0.5
        closebtn.imageView?.contentMode = .scaleAspectFit
        closebtn.imageEdgeInsets = UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)
        closebtn.tintColor = UIColor(red: 0.99, green: 0.77, blue: 0.70, alpha: 1.00)
        back.imageView?.contentMode = .scaleAspectFit
        back.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        back.imageView?.tintColor = UIColor.systemPink
    }
    @IBOutlet weak var back: UIButton!
    func collectdata() {
        for x in 0..<xiamxi.count{
            xiamxino.append(xiamxi[x].siiamsi_no!.intValue
            
            )
            xiamxiluck.append(xiamxi[x].siiamsi_fortune!)
        }
    }
    
 

    @IBOutlet weak var closebtn: UIButton!
    @IBAction func close(_ sender: Any) {
        luckshow.isHidden = true
    }
    @IBOutlet weak var lucklb: UILabel!
    @IBOutlet weak var nolb: UILabel!
    // Enable detection of shake motion
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            let randomno = xiamxino.randomElement()
            nolb.text = String(xiamxino[randomno!-1])
            lucklb.text = xiamxiluck[randomno!-1]
            UIDevice.vibrate()
            luckshow.isHidden = false
        }
    }
}
extension UIDevice {
    static func vibrate() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
}
