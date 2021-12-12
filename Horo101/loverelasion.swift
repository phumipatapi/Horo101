//
//  loverelasion.swift
//  Horo101
//
//  Created by Phumipat Apivansri on 27/11/2563 BE.
//

import UIKit

class loverelasion: UIViewController {
var tarot = [tarotcard]()
    var tarotname = [String]()
    var tarotno = [Int]()
    var tarotmean = [String]()
    var tarotpic = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tarotProvider().loadTasks { tarots in
            self.tarot = tarots
        }
        collectdb()
        self.navigationController?.isNavigationBarHidden = true
        self.mean.adjustsFontSizeToFitWidth = true
        cardbtn1.imageView?.contentMode = .scaleAspectFit
        cardbtn1.layer.shadowColor = UIColor.red.cgColor
        cardbtn1.layer.shadowOffset = CGSize(width: 0, height: 0.3)
        cardbtn1.layer.shadowRadius = 25
        cardbtn1.layer.shadowOpacity = 0.2
        cardbtn1.layer.masksToBounds = false
        cardbtn2.imageView?.contentMode = .scaleAspectFit
        cardbtn2.layer.shadowColor = UIColor.red.cgColor
        cardbtn2.layer.shadowOffset = CGSize(width: 0, height: 0.3)
        cardbtn2.layer.shadowRadius = 25
        cardbtn2.layer.shadowOpacity = 0.2
        cardbtn2.layer.masksToBounds = false
        cardbtn3.imageView?.contentMode = .scaleAspectFit
        cardbtn3.layer.shadowColor = UIColor.red.cgColor
        cardbtn3.layer.shadowOffset = CGSize(width: 0, height: 0.3)
        cardbtn3.layer.shadowRadius = 25
        cardbtn3.layer.shadowOpacity = 0.2
        cardbtn3.layer.masksToBounds = false
        meaning.layer.cornerRadius = 30
        meaning.layer.shadowColor = UIColor.red.cgColor
        meaning.layer.shadowRadius = 20
        meaning.layer.shadowOpacity = 0.25
        meaning.isHidden = true
        backbtn.imageView?.contentMode = .scaleAspectFit
        backbtn.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        backbtn.imageView?.tintColor = UIColor.systemPink
        cardimg.contentMode = .scaleAspectFit
        closebtn.imageView?.contentMode = .scaleAspectFit
        closebtn.imageEdgeInsets = UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)
        closebtn.tintColor = UIColor(red: 0.99, green: 0.77, blue: 0.70, alpha: 1.00)
        nextbtn.imageView?.contentMode = .scaleAspectFit
        nextbtn.imageEdgeInsets = UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
        nextbtn.tintColor = UIColor(red: 0.99, green: 0.77, blue: 0.70, alpha: 1.00)
        previousbtn.imageView?.contentMode = .scaleAspectFit
        previousbtn.imageEdgeInsets = UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
        previousbtn.tintColor = UIColor(red: 0.99, green: 0.77, blue: 0.70, alpha: 1.00)
        
        // Do any additional setup after loading the view.
    }
    func collectdb() {
        for x in 0..<tarot.count{
            tarotno.append(tarot[x].tarot_id!.intValue)
            tarotname.append(tarot[x].tarot_name!)
           tarotpic.append(tarot[x].tarot_img!)
            tarotmean.append(tarot[x].tarot_love!)
        }
    }
    @IBOutlet weak var backbtn: UIButton!
  
    @IBOutlet weak var cardbtn1: UIButton!
    @IBOutlet weak var cardbtn2: UIButton!
    @IBOutlet weak var cardbtn3: UIButton!
    @IBAction func card1(_ sender: Any) {
        if isOpen { //true
            if meaning.isHidden == true {
                //view.bringSubviewToFront(mean)
                meaning.isHidden = false
                previousbtn.isHidden = true
                nextbtn.isHidden = false
                previousbtn.isUserInteractionEnabled = false
                nextbtn.isUserInteractionEnabled = true
                cardimg.image = img[0]
                cardnamelb.text = name[0]
                mean.text = means[0]
                descript.text = scene[0]
               
                
            }
        }else { //false
            opencard()
             random()
             transition()
           
        }
    }
    @IBAction func card2(_ sender: Any) {
        if isOpen2 {
            if meaning.isHidden == true {
                meaning.isHidden = false
               
                previousbtn.isHidden = false
                previousbtn.isUserInteractionEnabled = true
                nextbtn.isUserInteractionEnabled = true
                nextbtn.isHidden = false
                cardimg.image = img[1]
                cardnamelb.text = name[1]
                mean.text = means[1]
                descript.text = scene[1]
               
            }
        }else { //false
            opencard()
            random()
            transition()
            
        }
    }
    @IBAction func card3(_ sender: Any) {
        if isOpen3 {
            if meaning.isHidden == true {
                //view.bringSubviewToFront(mean)
                meaning.isHidden = false
                previousbtn.isHidden = false
                previousbtn.isUserInteractionEnabled = true
                nextbtn.isUserInteractionEnabled = true
                nextbtn.isHidden = true
                cardimg.image = img[2]
                cardnamelb.text = name[2]
                mean.text = means[2]
                descript.text = scene[2]
            
            }
        }else { //false
           opencard()
            random()
            transition()
           
        }
    }
    @IBOutlet weak var meaning: UIView!
    @IBOutlet weak var closebtn: UIButton!
    @IBAction func close(_ sender: Any) {
        meaning.isHidden = true
    }
    @IBOutlet weak var cardimg: UIImageView!
    @IBOutlet weak var cardnamelb: UILabel!
    @IBOutlet weak var descript: UILabel!
    @IBOutlet weak var previousbtn: UIButton!
    @IBOutlet weak var nextbtn: UIButton!
    @IBOutlet weak var mean: UILabel!
    let scene=["สถานะของคุณในความสัมพันธ์นี้","ความสัมพันธ์จะเป็นไปในทิศทางไหน","เขาคิดอย่างไรกับคุณ"]
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if touch?.view != self.meaning {
            self.meaning.isHidden = true
        }
            }
    
    
    
    @IBAction func previous(_ sender: Any) {
        if cardimg.image == img[1] {
            cardimg.image = img[0]
            cardnamelb.text = name[0]
            mean.text = means[0]
            descript.text = scene[0]
            previousbtn.isHidden = true
            nextbtn.isHidden = false
            previousbtn.isUserInteractionEnabled = false
            nextbtn.isUserInteractionEnabled = true
        }
        else if cardimg.image == img[2] {
            cardimg.image = img[1]
            cardnamelb.text = name[1]
            mean.text = means[1]
            descript.text = scene[1]
            previousbtn.isHidden = false
            nextbtn.isHidden = false
            previousbtn.isUserInteractionEnabled = true
            nextbtn.isUserInteractionEnabled = true
   
        }
     
    }
    @IBAction func nextpic(_ sender: Any) {
        if cardimg.image == img[0] {
            cardimg.image = img[1]
            cardnamelb.text = name[1]
            mean.text = means[1]
            descript.text = scene[1]
            previousbtn.isHidden = false
            nextbtn.isHidden = false
            previousbtn.isUserInteractionEnabled = true
            nextbtn.isUserInteractionEnabled = true
        }
        else if cardimg.image == img[1] {
            cardimg.image = img[2]
            cardnamelb.text = name[2]
            mean.text = means[2]
            descript.text = scene[2]
            previousbtn.isHidden = false
            nextbtn.isHidden = true
            previousbtn.isUserInteractionEnabled = true
            nextbtn.isUserInteractionEnabled = false
        }
    }
    var img = [UIImage]()
    var means = [String]()
    var name = [String]()
    var isOpen = false
    var isOpen2 = false
    var isOpen3 = false
    
    func opencard() {
        isOpen = true
        isOpen2 = true
        isOpen3 = true
    }
    func random() {
        let randomid1 = tarotno.randomElement()
        tarotno.removeAll(where: {$0 == randomid1})
        let randomid2 = tarotno.randomElement()
        tarotno.removeAll(where: {$0 == randomid2})
        let randomid3 = tarotno.randomElement()
        tarotno.removeAll(where: {$0 == randomid3})
        let imgshow1 = UIImage(named: tarotpic[randomid1!])
        let imgshow2 = UIImage(named: tarotpic[randomid2!])
        let imgshow3 = UIImage(named: tarotpic[randomid3!])
        let cardmean1 = tarotmean[randomid1!]
        let cardmean2 = tarotmean[randomid2!]
        let cardmean3 = tarotmean[randomid3!]
        let cardname1 = tarotname[randomid1!]
        let cardname2 = tarotname[randomid2!]
        let cardname3 = tarotname[randomid3!]
        img.append(contentsOf: [imgshow1!,imgshow2!,imgshow3!])
        means.append(contentsOf: [cardmean1,cardmean2,cardmean3])
        name.append(contentsOf: [cardname1,cardname2,cardname3])
        cardbtn1.setImage(imgshow1, for: .normal)
        cardbtn2.setImage(imgshow2, for: .normal)
        cardbtn3.setImage(imgshow3, for: .normal)
    }
    func transition() {
        UIView.transition(with: cardbtn1, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
        UIView.transition(with: cardbtn2, duration: 0.4, options: .transitionFlipFromRight, animations: nil, completion: nil)
        UIView.transition(with: cardbtn3, duration: 0.5, options: .transitionFlipFromRight, animations: nil, completion: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "menu":
            guard let gypsy = segue.destination as? gypsytype else { return }
            gypsy.typeselec = "ความรัก"
        default:
            return
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
