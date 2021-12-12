//
//  Onecardnorm.swift
//  Horo101
//
//  Created by Phumipat Apivansri on 24/11/2563 BE.
//

import UIKit

class Onecardnorm: UIViewController {
    var typeselected = ""
    var normtarot = [tarotcard]()
    var tarotno = [Int]()
    var tarotname = [String]()
    var tarotpic = [String]()
    var tarotnorm = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
        tarotProvider().loadTasks { tarots in
            self.normtarot = tarots
        }
        collectdb()
        
        cardbtn.imageView?.contentMode = .scaleAspectFit
        cardbtn.layer.shadowColor = UIColor.red.cgColor
        cardbtn.layer.shadowOffset = CGSize(width: 0, height: 0.3)
        cardbtn.layer.shadowRadius = 25
        cardbtn.layer.shadowOpacity = 0.25
        cardbtn.layer.masksToBounds = false
        meaning.layer.cornerRadius = 30
        meaning.layer.shadowColor = UIColor.red.cgColor
        meaning.layer.shadowRadius = 20
        meaning.layer.shadowOpacity = 0.25
        meaning.isHidden = true
        backbtn.imageView?.contentMode = .scaleAspectFit
        backbtn.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        backbtn.imageView?.tintColor = UIColor.systemPink
        cardpic.contentMode = .scaleAspectFit
        close.imageView?.contentMode = .scaleAspectFit
        close.imageEdgeInsets = UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)
        close.tintColor = UIColor(red: 0.99, green: 0.77, blue: 0.70, alpha: 1.00)
    }
    @IBOutlet weak var cardbtn: UIButton!
    
    @IBOutlet weak var close: UIButton!
    @IBAction func closepop(_ sender: Any) {
        meaning.isHidden = true
    }
    @IBOutlet weak var cardmeaning: UILabel!
    @IBOutlet weak var cardnamed: UILabel!
    @IBOutlet weak var cardpic: UIImageView!
    @IBOutlet weak var backbtn: UIButton!
    @IBOutlet weak var meaning: UIView!
    func collectdb(){
        for x in 0..<normtarot.count{
            tarotno.append(normtarot[x].tarot_id!.intValue)
            tarotname.append(normtarot[x].tarot_name!)
           tarotpic.append(normtarot[x].tarot_img!)
            tarotnorm.append(normtarot[x].tarot_norm!)
        }
        
    }
    var isOpen = false
    
    @IBAction func cardbut(_ sender: Any) {
        if isOpen {
            if meaning.isHidden == true {
                meaning.isHidden = false
            }
            
        }else {
            isOpen = true
            let randomid = tarotno.randomElement()
            let imgshow = UIImage(named: tarotpic[randomid!])
            let cardmean = tarotnorm[randomid!]
            let cardname = tarotname[randomid!]
            cardpic.image = imgshow
            cardmeaning.text = cardmean
            cardnamed.text = cardname
            cardbtn.setImage(imgshow, for: .normal)
            UIView.transition(with: cardbtn, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
        }}
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if touch?.view != self.meaning {
            self.meaning.isHidden = true
        }
            }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "menu":
            
            guard let gypsy = segue.destination as? gypsytype else { return }
            gypsy.typeselec = "ทั่วไป"
            
        default : return
    }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
