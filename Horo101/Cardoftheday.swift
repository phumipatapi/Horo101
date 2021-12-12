//
//  Cardoftheday.swift
//  Horo101
//
//  Created by Phumipat Apivansri on 17/11/2563 BE.
//

import UIKit
class Cardoftheday: UIViewController {
   
   var tarot = [tarotcard]()
   var tarotno = [Int]()
    var tarotname = [String]()
    var tarotnorm = [String]()
    var tarotpic = [String]()
    
    @IBOutlet weak var close: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
            // Do any additional setup after loading the view.
        
        tarotProvider().loadTasks { tarots in
            self.tarot = tarots
        }
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
        close.imageView?.contentMode = .scaleAspectFit
        close.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        close.imageView?.tintColor = UIColor.systemPink
        cardimgpop.contentMode = .scaleAspectFit
        closepopup.imageView?.contentMode = .scaleAspectFit
        closepopup.imageEdgeInsets = UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)
        closepopup.tintColor = UIColor(red: 0.99, green: 0.77, blue: 0.70, alpha: 1.00)
        collectdb()
    }
    @IBOutlet weak var cardbtn: UIButton!
    var isopen = false
    
    func collectdb(){
        for x in 0..<tarot.count{
            tarotno.append(tarot[x].tarot_id!.intValue)
            tarotname.append(tarot[x].tarot_name!)
           tarotpic.append(tarot[x].tarot_img!)
            tarotnorm.append(tarot[x].tarot_norm!)
        }
    }

    @IBAction func closepop(_ sender: Any) {
        meaning.isHidden = true
    }
    @IBOutlet weak var closepopup: UIButton!
    @IBOutlet weak var cardmeanpop: UILabel!
    @IBOutlet weak var cardimgpop: UIImageView!
    @IBOutlet weak var cardnamepop: UILabel!
    @IBOutlet weak var meaning: UIView!
    @IBAction func but(_ sender: Any) {
        
        if isopen {
            if meaning.isHidden == true {
                meaning.isHidden = false
            }
        }else {
            isopen = true
            let randomid = tarotno.randomElement()
            let imgshow = UIImage(named: tarotpic[randomid!])
            let cardmean = tarotnorm[randomid!]
            let cardname = tarotname[randomid!]
            cardimgpop.image = imgshow
            cardmeanpop.text = cardmean
            cardnamepop.text = cardname
            cardbtn.setImage(imgshow, for: .normal)
            UIView.transition(with: cardbtn, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if touch?.view != self.meaning {
            self.meaning.isHidden = true
        }
            }
}
