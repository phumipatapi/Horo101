//
//  money.swift
//  Horo101
//
//  Created by Phumipat Apivansri on 29/11/2563 BE.
//

import UIKit

class money: UIViewController {
    var tarot = [tarotcard]()
    var tarotname = [String]()
    var tarotno = [Int]()
    var tarotmean = [String]()
    var tarotpic = [String]()
    override func viewDidLoad() {
        navigationController?.isNavigationBarHidden = true
        super.viewDidLoad()
       
        tarotProvider().loadTasks { tarots in
            self.tarot = tarots
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
        cardbtn4.imageView?.contentMode = .scaleAspectFit
        cardbtn4.layer.shadowColor = UIColor.red.cgColor
        cardbtn4.layer.shadowOffset = CGSize(width: 0, height: 0.3)
        cardbtn4.layer.shadowRadius = 25
        cardbtn4.layer.shadowOpacity = 0.2
        cardbtn4.layer.masksToBounds = false
        cardbtn5.imageView?.contentMode = .scaleAspectFit
        cardbtn5.layer.shadowColor = UIColor.red.cgColor
        cardbtn5.layer.shadowOffset = CGSize(width: 0, height: 0.3)
        cardbtn5.layer.shadowRadius = 25
        cardbtn5.layer.shadowOpacity = 0.2
        cardbtn5.layer.masksToBounds = false
        cardbtn6.imageView?.contentMode = .scaleAspectFit
        cardbtn6.layer.shadowColor = UIColor.red.cgColor
        cardbtn6.layer.shadowOffset = CGSize(width: 0, height: 0.3)
        cardbtn6.layer.shadowRadius = 25
        cardbtn6.layer.shadowOpacity = 0.2
        cardbtn6.layer.masksToBounds = false
       
            mean.layer.cornerRadius = 30
            mean.layer.shadowColor = UIColor.red.cgColor
            mean.layer.shadowRadius = 20
            mean.layer.shadowOpacity = 0.25
            mean.isHidden = true
            backbtn.imageView?.contentMode = .scaleAspectFit
            backbtn.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
            backbtn.imageView?.tintColor = UIColor.systemPink
            cardshow.contentMode = .scaleAspectFit
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
                tarotmean.append(tarot[x].tarot_work!)
            }
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if touch?.view != self.mean {
            self.mean.isHidden = true
        }
            }
    
    
    @IBOutlet weak var backbtn: UIButton!
    @IBOutlet weak var cardbtn1: UIButton!
    @IBOutlet weak var cardbtn2: UIButton!
    @IBOutlet weak var cardbtn3: UIButton!
    @IBOutlet weak var cardbtn4: UIButton!
    @IBOutlet weak var cardbtn5: UIButton!
    @IBOutlet weak var cardbtn6: UIButton!
    
    @IBOutlet weak var mean: UIView!
    @IBOutlet weak var cardshow: UIImageView!
    @IBOutlet weak var cardname: UILabel!
    @IBOutlet weak var closebtn: UIButton!
    @IBOutlet weak var cardmean: UILabel!
    @IBOutlet weak var nextbtn: UIButton!
    @IBOutlet weak var previousbtn: UIButton!
    @IBOutlet weak var descript: UILabel!
    
    @IBAction func card1(_ sender: Any) {
        if isOpen {
            if mean.isHidden == true {
                //view.bringSubviewToFront(mean)
                mean.isHidden = false
                previousbtn.isHidden = true
                nextbtn.isHidden = false
                previousbtn.isUserInteractionEnabled = false
                nextbtn.isUserInteractionEnabled = true
                cardshow.image = img[0]
                cardname.text = name[0]
                cardmean.text = means[0]
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
            if mean.isHidden == true {
                //view.bringSubviewToFront(mean)
                mean.isHidden = false
                previousbtn.isHidden = false
                nextbtn.isHidden = false
                previousbtn.isUserInteractionEnabled = true
                nextbtn.isUserInteractionEnabled = true
                cardshow.image = img[1]
                cardname.text = name[1]
                cardmean.text = means[1]
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
            if mean.isHidden == true {
                //view.bringSubviewToFront(mean)
                mean.isHidden = false
                previousbtn.isHidden = false
                nextbtn.isHidden = false
                previousbtn.isUserInteractionEnabled = true
                nextbtn.isUserInteractionEnabled = true
                cardshow.image = img[2]
                cardname.text = name[2]
                cardmean.text = means[2]
                descript.text = scene[2]
            }
        }else { //false
           opencard()
            random()
            transition()
           
        }
    }
    @IBAction func card4(_ sender: Any) {
        if isOpen4 {
            if mean.isHidden == true {
                //view.bringSubviewToFront(mean)
                mean.isHidden = false
                previousbtn.isHidden = false
                nextbtn.isHidden = false
                previousbtn.isUserInteractionEnabled = true
                nextbtn.isUserInteractionEnabled = true
                cardshow.image = img[3]
                cardname.text = name[3]
                cardmean.text = means[3]
                descript.text = scene[3]
            }
        }else { //false
           opencard()
            random()
            transition()
           
        }
    }
    @IBAction func card5(_ sender: Any) {
        if isOpen5 {
            if mean.isHidden == true {
                //view.bringSubviewToFront(mean)
                mean.isHidden = false
                previousbtn.isHidden = false
                nextbtn.isHidden = false
                previousbtn.isUserInteractionEnabled = true
                nextbtn.isUserInteractionEnabled = true
                cardshow.image = img[4]
                cardname.text = name[4]
                cardmean.text = means[4]
                descript.text = scene[4]
            }
        }else { //false
           opencard()
            random()
            transition()
           
        }
    }
    @IBAction func card6(_ sender: Any) {
        if isOpen6 {
            if mean.isHidden == true {
                //view.bringSubviewToFront(mean)
                mean.isHidden = false
                previousbtn.isHidden = false
                nextbtn.isHidden = true
                previousbtn.isUserInteractionEnabled = true
                nextbtn.isUserInteractionEnabled = false
                cardshow.image = img[5]
                cardname.text = name[5]
                cardmean.text = means[5]
                descript.text = scene[5]
            }
        }else { //false
           opencard()
            random()
            transition()
           
        }
    }
    
    @IBAction func close(_ sender: Any) {
        mean.isHidden = true
    }
    
    @IBAction func nextpic(_ sender: Any) {
        if cardshow.image == img[0] {
            cardshow.image = img[1]
            cardname.text = name[1]
            cardmean.text = means[1]
            descript.text = scene[1]
            previousbtn.isHidden = false
            nextbtn.isHidden = false
            previousbtn.isUserInteractionEnabled = true
            nextbtn.isUserInteractionEnabled = true
        }
        else if cardshow.image == img[1] {
            cardshow.image = img[2]
            cardname.text = name[2]
            cardmean.text = means[2]
            descript.text = scene[2]
            previousbtn.isHidden = false
            nextbtn.isHidden = false
            previousbtn.isUserInteractionEnabled = true
            nextbtn.isUserInteractionEnabled = true
        } else if cardshow.image == img[2] {
            cardshow.image = img[3]
            cardname.text = name[3]
            cardmean.text = means[3]
            descript.text = scene[3]
            previousbtn.isHidden = false
            nextbtn.isHidden = false
            previousbtn.isUserInteractionEnabled = true
            nextbtn.isUserInteractionEnabled = true
        } else if cardshow.image == img[3] {
            cardshow.image = img[4]
            cardname.text = name[4]
            cardmean.text = means[4]
            descript.text = scene[4]
            previousbtn.isHidden = false
            nextbtn.isHidden = false
            previousbtn.isUserInteractionEnabled = true
            nextbtn.isUserInteractionEnabled = true
        } else if cardshow.image == img[4] {
            cardshow.image = img[5]
            cardname.text = name[5]
            cardmean.text = means[5]
            descript.text = scene[5]
            previousbtn.isHidden = false
            nextbtn.isHidden = true
            previousbtn.isUserInteractionEnabled = true
            nextbtn.isUserInteractionEnabled = false
        }
    }
    @IBAction func previous(_ sender: Any) {
        if cardshow.image == img[1] {
            cardshow.image = img[0]
            cardname.text = name[0]
            cardmean.text = means[0]
            descript.text = scene[0]
            previousbtn.isHidden = true
            nextbtn.isHidden = false
            previousbtn.isUserInteractionEnabled = false
            nextbtn.isUserInteractionEnabled = true
        }
        else if cardshow.image == img[2] {
            cardshow.image = img[1]
            cardname.text = name[1]
            cardmean.text = means[1]
            descript.text = scene[1]
            previousbtn.isHidden = false
            nextbtn.isHidden = false
            previousbtn.isUserInteractionEnabled = true
            nextbtn.isUserInteractionEnabled = true
        }
        else if cardshow.image == img[3] {
            cardshow.image = img[2]
            cardname.text = name[2]
            cardmean.text = means[2]
            descript.text = scene[2]
            previousbtn.isHidden = false
            nextbtn.isHidden = false
            previousbtn.isUserInteractionEnabled = true
            nextbtn.isUserInteractionEnabled = true
        } else if cardshow.image == img[4] {
            cardshow.image = img[3]
            cardname.text = name[3]
            cardmean.text = means[3]
            descript.text = scene[3]
            previousbtn.isHidden = false
            nextbtn.isHidden = false
            previousbtn.isUserInteractionEnabled = true
            nextbtn.isUserInteractionEnabled = true
        } else if cardshow.image == img[5] {
            cardshow.image = img[4]
            cardname.text = name[4]
            cardmean.text = means[4]
            descript.text = scene[4]
            previousbtn.isHidden = false
            nextbtn.isHidden = false
            previousbtn.isUserInteractionEnabled = true
            nextbtn.isUserInteractionEnabled = true
    }
    }
    var img = [UIImage]()
    var means = [String]()
    var name = [String]()
    var scene = ["ต้นตอปัญหา","สิ่งที่ทำให้เก็บเงินไม่อยู่","การแก้ไขปัญหา","สิ่งที่ช่วยให้คุณผ่านปัญหาไปได้","ที่มาของความช่วยเหลือ","ผลลัพธ์"]
    var isOpen = false
    var isOpen2 = false
    var isOpen3 = false
    var isOpen4 = false
    var isOpen5 = false
    var isOpen6 = false
  
    
    
    func opencard() {
        isOpen = true
        isOpen2 = true
        isOpen3 = true
        isOpen4 = true
        isOpen5 = true
        isOpen6 = true
        
    }
    func random() {
        let randomid1 = tarotno.randomElement()
        tarotno.removeAll(where: {$0 == randomid1})
        let randomid2 = tarotno.randomElement()
        tarotno.removeAll(where: {$0 == randomid2})
        let randomid3 = tarotno.randomElement()
        tarotno.removeAll(where: {$0 == randomid3})
        let randomid4 = tarotno.randomElement()
        tarotno.removeAll(where: {$0 == randomid4})
        let randomid5 = tarotno.randomElement()
        tarotno.removeAll(where: {$0 == randomid5})
        let randomid6 = tarotno.randomElement()
        tarotno.removeAll(where: {$0 == randomid6})
    
        let imgshow1 = UIImage(named: tarotpic[randomid1!])
        let imgshow2 = UIImage(named: tarotpic[randomid2!])
        let imgshow3 = UIImage(named: tarotpic[randomid3!])
        let imgshow4 = UIImage(named: tarotpic[randomid4!])
        let imgshow5 = UIImage(named: tarotpic[randomid5!])
        let imgshow6 = UIImage(named: tarotpic[randomid6!])
     
        let cardmean1 = tarotmean[randomid1!]
        let cardmean2 = tarotmean[randomid2!]
        
        let cardmean3 = tarotmean[randomid3!]
        let cardmean4 = tarotmean[randomid4!]
        let cardmean5 = tarotmean[randomid5!]
        let cardmean6 = tarotmean[randomid6!]
        let cardname1 = tarotname[randomid1!]
        let cardname2 = tarotname[randomid2!]
        let cardname3 = tarotname[randomid3!]
        let cardname4 = tarotname[randomid4!]
        let cardname5 = tarotname[randomid5!]
        let cardname6 = tarotname[randomid6!]
      
        img.append(contentsOf: [imgshow1!,imgshow2!,imgshow3!,imgshow4!,imgshow5!,imgshow6!])
        means.append(contentsOf: [cardmean1,cardmean2,cardmean3,cardmean4,cardmean5,cardmean6])
        name.append(contentsOf: [cardname1,cardname2,cardname3,cardname4,cardname5,cardname6])
        cardbtn1.setImage(imgshow1, for: .normal)
        cardbtn2.setImage(imgshow2, for: .normal)
        cardbtn3.setImage(imgshow3, for: .normal)
        cardbtn4.setImage(imgshow4, for: .normal)
        cardbtn5.setImage(imgshow5, for: .normal)
        cardbtn6.setImage(imgshow6, for: .normal)
        
    }
    func transition() {
        UIView.transition(with: cardbtn1, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
        UIView.transition(with: cardbtn2, duration: 0.6, options: .transitionFlipFromRight, animations: nil, completion: nil)
        UIView.transition(with: cardbtn3, duration: 0.9, options: .transitionFlipFromRight, animations: nil, completion: nil)
        UIView.transition(with: cardbtn4, duration: 1.2, options: .transitionFlipFromRight, animations: nil, completion: nil)
        UIView.transition(with: cardbtn5, duration: 1.5, options: .transitionFlipFromRight, animations: nil, completion: nil)
        UIView.transition(with: cardbtn6, duration: 1.8, options: .transitionFlipFromRight, animations: nil, completion: nil)
    
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "menu":
            guard let gypsy = segue.destination as? gypsytype else { return }
            gypsy.typeselec = "การงาน"
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

