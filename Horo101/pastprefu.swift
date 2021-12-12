//
//  pastprefu.swift
//  Horo101
//
//  Created by Phumipat Apivansri on 26/11/2563 BE.
//

import UIKit

class pastprefu: UIViewController {
 var tarotppf = [tarotcard]()
 var tarotname = [String]()
 var tarotno = [Int]()
 var tarotmean = [String]()
 var tarotpic = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tarotProvider().loadTasks { tarots in
            self.tarotppf = tarots
        }
        collectdb()
        self.navigationController?.isNavigationBarHidden = true
        self.cardmean.adjustsFontSizeToFitWidth = true
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
        mean.layer.cornerRadius = 30
        mean.layer.shadowColor = UIColor.red.cgColor
        mean.layer.shadowRadius = 20
        mean.layer.shadowOpacity = 0.25
        mean.isHidden = true
        backbtn.imageView?.contentMode = .scaleAspectFit
        backbtn.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        backbtn.imageView?.tintColor = UIColor.systemPink
        cardshow.contentMode = .scaleAspectFit
        close.imageView?.contentMode = .scaleAspectFit
        close.imageEdgeInsets = UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)
        close.tintColor = UIColor(red: 0.99, green: 0.77, blue: 0.70, alpha: 1.00)
        nextpic.imageView?.contentMode = .scaleAspectFit
        nextpic.imageEdgeInsets = UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
        nextpic.tintColor = UIColor(red: 0.99, green: 0.77, blue: 0.70, alpha: 1.00)
        previous.imageView?.contentMode = .scaleAspectFit
        previous.imageEdgeInsets = UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
        previous.tintColor = UIColor(red: 0.99, green: 0.77, blue: 0.70, alpha: 1.00)
        
        // Do any additional setup after loading the view.
    }
    
    func collectdb() {
        for x in 0..<tarotppf.count{
            tarotno.append(tarotppf[x].tarot_id!.intValue)
            tarotname.append(tarotppf[x].tarot_name!)
           tarotpic.append(tarotppf[x].tarot_img!)
            tarotmean.append(tarotppf[x].tarot_norm!)
        }
    }
    var isOpen = false
    var isOpen2 = false
    var isOpen3 = false
    
    @IBOutlet weak var backbtn: UIButton!
    @IBOutlet weak var cardbtn1: UIButton!
    @IBOutlet weak var cardbtn2: UIButton!
    @IBOutlet weak var cardbtn3: UIButton!
    
    @IBOutlet weak var close: UIButton!
    @IBOutlet weak var nextpic: UIButton!
    @IBOutlet weak var previous: UIButton!
    @IBOutlet weak var cardshow: UIImageView!
    @IBOutlet weak var cardname: UILabel!
    @IBOutlet weak var cardmean: UILabel!
    @IBOutlet weak var mean: UIView!
    var img = [UIImage]()
//    var img2 = UIImage()
//    var img3 = UIImage()
    var means = [String]()
    var name = [String]()
    @IBOutlet weak var scenario: UILabel!
    let scene=["อดีต","ปัจจุบัน","อนาคต"]
    @IBAction func previouspic(_ sender: Any) {
        if cardshow.image == img[1] {
            cardshow.image = img[0]
            cardname.text = name[0]
            cardmean.text = means[0]
            scenario.text = scene[0]
            previous.isHidden = true
            nextpic.isHidden = false
            previous.isUserInteractionEnabled = false
            nextpic.isUserInteractionEnabled = true
        }
        
        else if cardshow.image == img[2] {
            cardshow.image = img[1]
            cardname.text = name[1]
            cardmean.text = means[1]
            scenario.text = scene[1]
            previous.isHidden = false
            nextpic.isHidden = false
            previous.isUserInteractionEnabled = true
            nextpic.isUserInteractionEnabled = true
   
        }
     
    }
    @IBAction func nextpicbtn(_ sender: Any) {
        if cardshow.image == img[0] {
            cardshow.image = img[1]
            cardname.text = name[1]
            cardmean.text = means[1]
            scenario.text = scene[1]
            previous.isHidden = false
            nextpic.isHidden = false
            previous.isUserInteractionEnabled = true
            nextpic.isUserInteractionEnabled = true
        }
        else if cardshow.image == img[1] {
            cardshow.image = img[2]
            cardname.text = name[2]
            cardmean.text = means[2]
            scenario.text = scene[2]
            previous.isHidden = false
            nextpic.isHidden = true
            previous.isUserInteractionEnabled = true
            nextpic.isUserInteractionEnabled = false
        }
    }
    @IBAction func closepop(_ sender: Any) {
        mean.isHidden = true
    }
    @IBAction func card1(_ sender: Any) {
        if isOpen { //true
            if mean.isHidden == true {
                view.bringSubviewToFront(mean)
                mean.isHidden = false
                previous.isHidden = true
                nextpic.isHidden = false
                previous.isUserInteractionEnabled = false
                nextpic.isUserInteractionEnabled = true
                cardshow.image = img[0]
                cardname.text = name[0]
                cardmean.text = means[0]
                scenario.text = scene[0]
                
            }
        }else { //false
            flipcard()
             random()
             transition()
           
        }
    }
    @IBAction func card2(_ sender: Any) {
        if isOpen2 {
            if mean.isHidden == true {
                mean.isHidden = false
                view.bringSubviewToFront(mean)
                previous.isHidden = false
                nextpic.isHidden = false
                previous.isUserInteractionEnabled = true
                nextpic.isUserInteractionEnabled = false
                cardshow.image = img[1]
                cardname.text = name[1]
                cardmean.text = means[1]
                scenario.text = scene[1]
                
            }
        }else { //false
            flipcard()
            random()
            transition()
            
        }
    }
    @IBAction func card3(_ sender: Any) {
        if isOpen3 {
            if mean.isHidden == true {
                view.bringSubviewToFront(mean)
                mean.isHidden = false
                previous.isHidden = false
                nextpic.isHidden = true
                previous.isUserInteractionEnabled = true
                nextpic.isUserInteractionEnabled = false
                cardshow.image = img[2]
                cardname.text = name[2]
                cardmean.text = means[2]
                scenario.text = scene[2]
            }
        }else { //false
           flipcard()
            random()
            transition()
           
        }
    }
    func flipcard() {
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
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if touch?.view != self.mean {
            self.mean.isHidden = true
        }
            }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "menu":
            guard let gypsy = segue.destination as? gypsytype else { return }
            gypsy.typeselec = "ทั่วไป"
        default:
            return
        }
    }
}
