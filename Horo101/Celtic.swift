//
//  Celtic.swift
//  Horo101
//
//  Created by Phumipat Apivansri on 26/11/2563 BE.
//

import UIKit

class Celtic: UIViewController {
    var tarotceltic = [tarotcard]()
    var tarotno = [Int]()
    var tarotname = [String]()
    var tarotpic = [String]()
    var tarotmean = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tarotProvider().loadTasks{tarots in
            self.tarotceltic = tarots
        }
        self.navigationController?.isNavigationBarHidden = true
        self.cardmean.adjustsFontSizeToFitWidth = true
        self.describe.adjustsFontSizeToFitWidth = true
      
        card1.imageView?.contentMode = .scaleAspectFit
        card1.layer.shadowColor = UIColor.red.cgColor
        card1.layer.shadowOffset = CGSize(width: 0, height: 0.3)
        card1.layer.shadowRadius = 25
        card1.layer.shadowOpacity = 0.2
        card1.layer.masksToBounds = false
        card2.imageView?.contentMode = .scaleAspectFit
        card2.layer.shadowColor = UIColor.red.cgColor
        card2.layer.shadowOffset = CGSize(width: 0, height: 0.3)
        card2.layer.shadowRadius = 25
        card2.layer.shadowOpacity = 0.2
        card2.layer.masksToBounds = false
        card3.imageView?.contentMode = .scaleAspectFit
        card3.layer.shadowColor = UIColor.red.cgColor
        card3.layer.shadowOffset = CGSize(width: 0, height: 0.3)
        card3.layer.shadowRadius = 25
        card3.layer.shadowOpacity = 0.2
        card3.layer.masksToBounds = false
        card4.imageView?.contentMode = .scaleAspectFit
        card4.layer.shadowColor = UIColor.red.cgColor
        card4.layer.shadowOffset = CGSize(width: 0, height: 0.3)
        card4.layer.shadowRadius = 25
        card4.layer.shadowOpacity = 0.2
        card4.layer.masksToBounds = false
        card5.imageView?.contentMode = .scaleAspectFit
        card5.layer.shadowColor = UIColor.red.cgColor
        card5.layer.shadowOffset = CGSize(width: 0, height: 0.3)
        card5.layer.shadowRadius = 25
        card5.layer.shadowOpacity = 0.2
        card5.layer.masksToBounds = false
        card6.imageView?.contentMode = .scaleAspectFit
        card6.layer.shadowColor = UIColor.red.cgColor
        card6.layer.shadowOffset = CGSize(width: 0, height: 0.3)
        card6.layer.shadowRadius = 25
        card6.layer.shadowOpacity = 0.2
        card6.layer.masksToBounds = false
        card7.imageView?.contentMode = .scaleAspectFit
        card7.layer.shadowColor = UIColor.red.cgColor
        card7.layer.shadowOffset = CGSize(width: 0, height: 0.3)
        card7.layer.shadowRadius = 25
        card7.layer.shadowOpacity = 0.2
        card7.layer.masksToBounds = false
        card8.imageView?.contentMode = .scaleAspectFit
        card8.layer.shadowColor = UIColor.red.cgColor
        card8.layer.shadowOffset = CGSize(width: 0, height: 0.3)
        card8.layer.shadowRadius = 25
        card8.layer.shadowOpacity = 0.2
        card8.layer.masksToBounds = false
        card9.imageView?.contentMode = .scaleAspectFit
        card9.layer.shadowColor = UIColor.red.cgColor
        card9.layer.shadowOffset = CGSize(width: 0, height: 0.3)
        card9.layer.shadowRadius = 25
        card9.layer.shadowOpacity = 0.2
        card9.layer.masksToBounds = false
        card10.imageView?.contentMode = .scaleAspectFit
        card10.layer.shadowColor = UIColor.red.cgColor
        card10.layer.shadowOffset = CGSize(width: 0, height: 0.3)
        card10.layer.shadowRadius = 25
        card10.layer.shadowOpacity = 0.2
        card10.layer.masksToBounds = false
   
        closepop.imageView?.contentMode = .scaleAspectFit
        closepop.imageEdgeInsets = UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)
        closepop.tintColor = UIColor(red: 0.99, green: 0.77, blue: 0.70, alpha: 1.00)
        nextpic.imageView?.contentMode = .scaleAspectFit
        nextpic.imageEdgeInsets = UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
        nextpic.tintColor = UIColor(red: 0.99, green: 0.77, blue: 0.70, alpha: 1.00)
        previous.imageView?.contentMode = .scaleAspectFit
        previous.imageEdgeInsets = UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
        previous.tintColor = UIColor(red: 0.99, green: 0.77, blue: 0.70, alpha: 1.00)
        cardimg.contentMode = .scaleAspectFit
        backbtn.imageView?.contentMode = .scaleAspectFit
        backbtn.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        backbtn.imageView?.tintColor = UIColor.systemPink
        meanpop.layer.cornerRadius = 30
        meanpop.layer.shadowColor = UIColor.red.cgColor
        meanpop.layer.shadowRadius = 20
        meanpop.layer.shadowOpacity = 0.25
        meanpop.isHidden = true
        collectdb()
        
    }
    func collectdb() {
        for x in 0..<tarotceltic.count{
            tarotno.append(tarotceltic[x].tarot_id!.intValue)
            tarotname.append(tarotceltic[x].tarot_name!)
           tarotpic.append(tarotceltic[x].tarot_img!)
            tarotmean.append(tarotceltic[x].tarot_norm!)
        }
    }
    
    @IBOutlet weak var backbtn: UIButton!
    @IBOutlet weak var card1: UIButton!
    @IBOutlet weak var card2: UIButton!
    @IBOutlet weak var card3: UIButton!
    @IBOutlet weak var card4: UIButton!
    @IBOutlet weak var card5: UIButton!
    @IBOutlet weak var card6: UIButton!
    @IBOutlet weak var card7: UIButton!
    @IBOutlet weak var card8: UIButton!
    @IBOutlet weak var card9: UIButton!
    @IBOutlet weak var card10: UIButton!
    
    @IBOutlet weak var cardimg: UIImageView!
    @IBOutlet weak var cardname: UILabel!
    @IBOutlet weak var closepop: UIButton!
    @IBOutlet weak var cardmean: UILabel!
    
    @IBOutlet weak var nextpic: UIButton!
    @IBOutlet weak var previous: UIButton!
    @IBOutlet weak var describe: UILabel!
    var isOpen = false
    var isOpen2 = false
    var isOpen3 = false
    var isOpen4 = false
    var isOpen5 = false
    var isOpen6 = false
    var isOpen7 = false
    var isOpen8 = false
    var isOpen9 = false
    var isOpen10 = false
    var img = [UIImage]()
    var name = [String]()
    var mean = [String]()
    var desc = ["หัวใจของสถานการณ์ทั้งหมด","อุปสรรคที่ขัดขวางอยู่","คุณคิดยังไงกับเหตุการณ์ที่เกิดขึ้น","เหตุการณ์ในอดีตที่ทำให้เกิดสถานการณ์นี้","คุณมองสถานการณ์ตรงหน้านี้อย่างไร","สิ่งที่เกิดขึ้นในอนาคตอันใกล้","สิ่งที่คุณคาดว่าจะเกิดขึ้น","สภาพแวดล้อมรอบตัว","สิ่งที่คุณคาดหวัง","ผลสรุป"]
    @IBAction func cardbtn1(_ sender: Any) {
        if isOpen { //true
            if meanpop.isHidden == true {
                meanpop.isHidden = false
                previous.isHidden = true
                nextpic.isHidden = false
                previous.isUserInteractionEnabled = false
                nextpic.isUserInteractionEnabled = true
                cardimg.image = img[0]
                cardname.text = name[0]
                cardmean.text = mean[0]
                describe.text = desc[0]
            }
        }else { //false
            flipcard()
            random()
            transition()
        }
    }
    
    @IBAction func cardbtn2(_ sender: Any) {
        if isOpen2 { //true
            if meanpop.isHidden == true {
                meanpop.isHidden = false
                previous.isHidden = false
                nextpic.isHidden = false
                previous.isUserInteractionEnabled = true
                nextpic.isUserInteractionEnabled = true
                cardimg.image = img[1]
                cardname.text = name[1]
                cardmean.text = mean[1]
                describe.text = desc[1]
            }
        }else { //false
            flipcard()
            random()
            transition()
        }
    }
    @IBAction func cardbtn3(_ sender: Any) {
        if isOpen3 { //true
            if meanpop.isHidden == true {
                meanpop.isHidden = false
                previous.isHidden = false
                nextpic.isHidden = false
                previous.isUserInteractionEnabled = true
                nextpic.isUserInteractionEnabled = true
                cardimg.image = img[2]
                cardname.text = name[2]
                cardmean.text = mean[2]
                describe.text = desc[2]
            }
        }else { //false
            flipcard()
            random()
            transition()
        }
    }
    @IBAction func cardbtn4(_ sender: Any) {
        if isOpen4 { //true
            if meanpop.isHidden == true {
                meanpop.isHidden = false
                previous.isHidden = false
                nextpic.isHidden = false
                previous.isUserInteractionEnabled = true
                nextpic.isUserInteractionEnabled = true
                cardimg.image = img[3]
                cardname.text = name[3]
                cardmean.text = mean[3]
                describe.text = desc[3]
            }
        }else { //false
            flipcard()
            random()
            transition()
        }
    }
    @IBAction func cardbtn5(_ sender: Any) {
        if isOpen5 { //true
            if meanpop.isHidden == true {
                meanpop.isHidden = false
                previous.isHidden = false
                nextpic.isHidden = false
                previous.isUserInteractionEnabled = true
                nextpic.isUserInteractionEnabled = true
                cardimg.image = img[4]
                cardname.text = name[4]
                cardmean.text = mean[4]
                describe.text = desc[4]
            }
        }else { //false
            flipcard()
            random()
            transition()
        }
    }
    @IBAction func cardbtn6(_ sender: Any) {
        if isOpen6 { //true
            if meanpop.isHidden == true {
                meanpop.isHidden = false
                previous.isHidden = false
                nextpic.isHidden = false
                previous.isUserInteractionEnabled = true
                nextpic.isUserInteractionEnabled = true
                cardimg.image = img[5]
                cardname.text = name[5]
                cardmean.text = mean[5]
                describe.text = desc[5]
            }
        }else { //false
            flipcard()
            random()
            transition()
        }
    }
    @IBAction func cardbtn7(_ sender: Any) {
        if isOpen7 { //true
            if meanpop.isHidden == true {
                meanpop.isHidden = false
                previous.isHidden = false
                nextpic.isHidden = false
                previous.isUserInteractionEnabled = true
                nextpic.isUserInteractionEnabled = true
                cardimg.image = img[6]
                cardname.text = name[6]
                cardmean.text = mean[6]
                describe.text = desc[6]
            }
        }else { //false
            flipcard()
            random()
            transition()
        }
    }
    @IBAction func cardbtn8(_ sender: Any) {
        if isOpen8 { //true
            if meanpop.isHidden == true {
                meanpop.isHidden = false
                previous.isHidden = false
                nextpic.isHidden = false
                previous.isUserInteractionEnabled = true
                nextpic.isUserInteractionEnabled = true
                cardimg.image = img[7]
                cardname.text = name[7]
                cardmean.text = mean[7]
                describe.text = desc[7]
            }
        }else { //false
            flipcard()
            random()
            transition()
        }
    }
    @IBAction func cardbtn9(_ sender: Any) {
        if isOpen9 { //true
            if meanpop.isHidden == true {
                meanpop.isHidden = false
                previous.isHidden = false
                nextpic.isHidden = false
                previous.isUserInteractionEnabled = true
                nextpic.isUserInteractionEnabled = true
                cardimg.image = img[8]
                cardname.text = name[8]
                cardmean.text = mean[8]
                describe.text = desc[8]
            }
        }else { //false
            flipcard()
            random()
            transition()
        }
    }
    @IBAction func cardbtn10(_ sender: Any) {
        if isOpen10 { //true
            if meanpop.isHidden == true {
                meanpop.isHidden = false
                previous.isHidden = false
                nextpic.isHidden = false
                previous.isUserInteractionEnabled = true
                nextpic.isUserInteractionEnabled = true
                cardimg.image = img[9]
                cardname.text = name[9]
                cardmean.text = mean[9]
                describe.text = desc[9]
            }
        }else { //false
            flipcard()
            random()
            transition()
        }
    }
    
    @IBAction func closebtn(_ sender: Any) {
        meanpop.isHidden =  true
    }
    
    @IBAction func previousbtn(_ sender: Any) {
        if cardimg.image == img[1] {
            cardimg.image = img[0]
            cardname.text = name[0]
            cardmean.text = mean[0]
            describe.text = desc[0]
            previous.isHidden = true
            nextpic.isHidden = false
            previous.isUserInteractionEnabled = false
            nextpic.isUserInteractionEnabled = true
        }
        else if cardimg.image == img[2] {
            cardimg.image = img[1]
            cardname.text = name[1]
            cardmean.text = mean[1]
            describe.text = desc[1]
            previous.isHidden = false
            nextpic.isHidden = false
            previous.isUserInteractionEnabled = true
            nextpic.isUserInteractionEnabled = true
        }
        else if cardimg.image == img[3] {
            cardimg.image = img[2]
            cardname.text = name[2]
            cardmean.text = mean[2]
            describe.text = desc[2]
            previous.isHidden = false
            nextpic.isHidden = false
            previous.isUserInteractionEnabled = true
            nextpic.isUserInteractionEnabled = true
        } else if cardimg.image == img[4] {
            cardimg.image = img[3]
            cardname.text = name[3]
            cardmean.text = mean[3]
            describe.text = desc[3]
            previous.isHidden = false
            nextpic.isHidden = false
            previous.isUserInteractionEnabled = true
            nextpic.isUserInteractionEnabled = true
        } else if cardimg.image == img[5] {
            cardimg.image = img[4]
            cardname.text = name[4]
            cardmean.text = mean[4]
            describe.text = desc[4]
            previous.isHidden = false
            nextpic.isHidden = false
            previous.isUserInteractionEnabled = true
            nextpic.isUserInteractionEnabled = true
        } else if cardimg.image == img[6] {
            cardimg.image = img[5]
            cardname.text = name[5]
            cardmean.text = mean[5]
            describe.text = desc[5]
            previous.isHidden = false
            nextpic.isHidden = false
            previous.isUserInteractionEnabled = true
            nextpic.isUserInteractionEnabled = true
        } else if cardimg.image == img[7] {
            cardimg.image = img[6]
            cardname.text = name[6]
            cardmean.text = mean[6]
            describe.text = desc[6]
            previous.isHidden = false
            nextpic.isHidden = false
            previous.isUserInteractionEnabled = true
            nextpic.isUserInteractionEnabled = true
        } else if cardimg.image == img[8] {
            cardimg.image = img[7]
            cardname.text = name[7]
            cardmean.text = mean[7]
            describe.text = desc[7]
            previous.isHidden = false
            nextpic.isHidden = false
            previous.isUserInteractionEnabled = true
            nextpic.isUserInteractionEnabled = true
        } else if cardimg.image == img[9] {
            cardimg.image = img[8]
            cardname.text = name[8]
            cardmean.text = mean[8]
            describe.text = desc[8]
            previous.isHidden = false
            nextpic.isHidden = false
            previous.isUserInteractionEnabled = true
            nextpic.isUserInteractionEnabled = true
        }
    }
    
    
    @IBAction func nextbtn(_ sender: Any) {
        
        
        if cardimg.image == img[0] {
            cardimg.image = img[1]
            cardname.text = name[1]
            cardmean.text = mean[1]
            describe.text = desc[1]
            previous.isHidden = false
            nextpic.isHidden = false
            previous.isUserInteractionEnabled = true
            nextpic.isUserInteractionEnabled = true
        }
        else if cardimg.image == img[1] {
            cardimg.image = img[2]
            cardname.text = name[2]
            cardmean.text = mean[2]
            describe.text = desc[2]
            previous.isHidden = false
            nextpic.isHidden = false
            previous.isUserInteractionEnabled = true
            nextpic.isUserInteractionEnabled = true
        } else if cardimg.image == img[2] {
            cardimg.image = img[3]
            cardname.text = name[3]
            cardmean.text = mean[3]
            describe.text = desc[3]
            previous.isHidden = false
            nextpic.isHidden = false
            previous.isUserInteractionEnabled = true
            nextpic.isUserInteractionEnabled = true
        } else if cardimg.image == img[3] {
            cardimg.image = img[4]
            cardname.text = name[4]
            cardmean.text = mean[4]
            describe.text = desc[4]
            previous.isHidden = false
            nextpic.isHidden = false
            previous.isUserInteractionEnabled = true
            nextpic.isUserInteractionEnabled = true
        } else if cardimg.image == img[4] {
            cardimg.image = img[5]
            cardname.text = name[5]
            cardmean.text = mean[5]
            describe.text = desc[5]
            previous.isHidden = false
            nextpic.isHidden = false
            previous.isUserInteractionEnabled = true
            nextpic.isUserInteractionEnabled = true
        } else if cardimg.image == img[5] {
            cardimg.image = img[6]
            cardname.text = name[6]
            cardmean.text = mean[6]
            describe.text = desc[6]
            previous.isHidden = false
            nextpic.isHidden = false
            previous.isUserInteractionEnabled = true
            nextpic.isUserInteractionEnabled = true
        } else if cardimg.image == img[6] {
            cardimg.image = img[7]
            cardname.text = name[7]
            cardmean.text = mean[7]
            describe.text = desc[7]
            previous.isHidden = false
            nextpic.isHidden = false
            previous.isUserInteractionEnabled = true
            nextpic.isUserInteractionEnabled = true
        } else if cardimg.image == img[7] {
            cardimg.image = img[8]
            cardname.text = name[8]
            cardmean.text = mean[8]
            describe.text = desc[8]
            previous.isHidden = false
            nextpic.isHidden = false
            previous.isUserInteractionEnabled = true
            nextpic.isUserInteractionEnabled = true
        }
        else if cardimg.image == img[8] {
            cardimg.image = img[9]
            cardname.text = name[9]
            cardmean.text = mean[9]
            describe.text = desc[9]
            previous.isHidden = false
            nextpic.isHidden = true
            previous.isUserInteractionEnabled = true
            nextpic.isUserInteractionEnabled = false
        }
    }
    
    @IBOutlet weak var meanpop: UIView!
    func transition() {
        UIView.transition(with: card1, duration: 0.5, options: .transitionFlipFromRight, animations: nil, completion: nil)
        UIView.transition(with: card2, duration: 0.6, options: .transitionFlipFromRight, animations: nil, completion: nil)
        UIView.transition(with: card3, duration: 0.7, options: .transitionFlipFromRight, animations: nil, completion: nil)
        UIView.transition(with: card4, duration: 0.8, options: .transitionFlipFromRight, animations: nil, completion: nil)
        UIView.transition(with: card5, duration: 0.9, options: .transitionFlipFromRight, animations: nil, completion: nil)
        UIView.transition(with: card6, duration: 1, options: .transitionFlipFromRight, animations: nil, completion: nil)
        UIView.transition(with: card7, duration: 1.1, options: .transitionFlipFromRight, animations: nil, completion: nil)
        UIView.transition(with: card8, duration: 1.2, options: .transitionFlipFromRight, animations: nil, completion: nil)
        UIView.transition(with: card9, duration: 1.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
        UIView.transition(with: card10, duration: 1.4, options: .transitionFlipFromRight, animations: nil, completion: nil)
        
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
        let randomid7 = tarotno.randomElement()
        tarotno.removeAll(where: {$0 == randomid7})
        let randomid8 = tarotno.randomElement()
        tarotno.removeAll(where: {$0 == randomid8})
        let randomid9 = tarotno.randomElement()
        tarotno.removeAll(where: {$0 == randomid9})
        let randomid10 = tarotno.randomElement()
        tarotno.removeAll(where: {$0 == randomid10
        })
//        print(randomid1,randomid2,randomid3,randomid4,randomid5,randomid6,randomid7,randomid8,randomid9,randomid10)
        let imgshow1 = UIImage(named: tarotpic[randomid1!])
        let imgshow2 = UIImage(named: tarotpic[randomid2!])
        let imgshow2rot = imgshow2?.rotate(radians: .pi/2)
        let imgshow3 = UIImage(named: tarotpic[randomid3!])
        let imgshow4 = UIImage(named: tarotpic[randomid4!])
        let imgshow5 = UIImage(named: tarotpic[randomid5!])
        let imgshow6 = UIImage(named: tarotpic[randomid6!])
        let imgshow7 = UIImage(named: tarotpic[randomid7!])
        let imgshow8 = UIImage(named: tarotpic[randomid8!])
        let imgshow9 = UIImage(named: tarotpic[randomid9!])
        let imgshow10 = UIImage(named: tarotpic[randomid10!])
        let cardmean1 = tarotmean[randomid1!]
        let cardmean2 = tarotmean[randomid2!]
        let cardmean3 = tarotmean[randomid3!]
        let cardmean4 = tarotmean[randomid4!]
        let cardmean5 = tarotmean[randomid5!]
        let cardmean6 = tarotmean[randomid6!]
        let cardmean7 = tarotmean[randomid7!]
        let cardmean8 = tarotmean[randomid8!]
        let cardmean9 = tarotmean[randomid9!]
        let cardmean10 = tarotmean[randomid10!]
        let cardname1 = tarotname[randomid1!]
        let cardname2 = tarotname[randomid2!]
        let cardname3 = tarotname[randomid3!]
        let cardname4 = tarotname[randomid4!]
        let cardname5 = tarotname[randomid5!]
        let cardname6 = tarotname[randomid6!]
        let cardname7 = tarotname[randomid7!]
        let cardname8 = tarotname[randomid8!]
        let cardname9 = tarotname[randomid9!]
        let cardname10 = tarotname[randomid10!]
        
        card1.setImage(imgshow1, for: .normal)
        card2.setImage(imgshow2rot, for: .normal)
        card3.setImage(imgshow3, for: .normal)
        card4.setImage(imgshow4, for: .normal)
        card5.setImage(imgshow5, for: .normal)
        card6.setImage(imgshow6, for: .normal)
        card7.setImage(imgshow7, for: .normal)
        card8.setImage(imgshow8, for: .normal)
        card9.setImage(imgshow9, for: .normal)
        card10.setImage(imgshow10, for: .normal)
        img.append(contentsOf: [imgshow1!,imgshow2!,imgshow3!,imgshow4!,imgshow5!,imgshow6!,imgshow7!,imgshow8!,imgshow9!,imgshow10!])
        mean.append(contentsOf: [cardmean1,cardmean2,cardmean3,cardmean4,cardmean5,cardmean6,cardmean7,cardmean8,cardmean9,cardmean10])
        name.append(contentsOf: [cardname1,cardname2,cardname3,cardname4,cardname5,cardname6,cardname7,cardname8,cardname9,cardname10])
        
    }
    func flipcard() {
            isOpen=true
            isOpen2=true
            isOpen3=true
            isOpen4=true
            isOpen5=true
            isOpen6=true
            isOpen7=true
            isOpen8=true
            isOpen9=true
            isOpen10=true
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if touch?.view != self.meanpop{
            self.meanpop.isHidden = true
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


extension UIImage {
    func rotate(radians: Float) -> UIImage? {
        var newSize = CGRect(origin: CGPoint.zero, size: self.size).applying(CGAffineTransform(rotationAngle: CGFloat(radians))).size
        newSize.width = floor(newSize.width)
        newSize.height = floor(newSize.height)
        UIGraphicsBeginImageContextWithOptions(newSize, false, self.scale)
        let context = UIGraphicsGetCurrentContext()!
        context.translateBy(x: newSize.width/2, y: newSize.height/2)
        context.rotate(by: CGFloat(radians))
        self.draw(in: CGRect(x: -self.size.width/2, y: -self.size.height/2, width: self.size.width, height: self.size.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}
