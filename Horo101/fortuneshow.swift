//
//  fortuneshow.swift
//  Horo101
//
//  Created by Phumipat Apivansri on 29/11/2563 BE.
//

import UIKit

class fortuneshow: UIViewController {
var zodiacinfo = [zodiac]()
var fortuneinfo = [fortunes]()
var zodiacselec = ""
    
    var zodiacnames = [String]()
    var describe = [String]()
    var pic = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        zodiacprovide().loadzodiac { zodiacs in
            self.zodiacinfo = zodiacs
        }
        fortuneprovide().loadfortune { luck in
            self.fortuneinfo = luck
        }
        backbtn.imageView?.contentMode = .scaleAspectFit
        backbtn.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        backbtn.imageView?.tintColor = UIColor.systemPink
        collectdb()
       fortune.adjustsFontSizeToFitWidth = true
        show()
    }
   
    func collectdb() {
        for x in 0..<zodiacinfo.count{
            zodiacnames.append(zodiacinfo[x].zodiac_name!)
            pic.append(zodiacinfo[x].zodiac_pic!)
        }
        for y in 0..<fortuneinfo.count{
            describe.append(fortuneinfo[y].holoyear_detail!)
        }
    }
   
    func show() {
        if zodiacselec != "" {
        bg.layer.shadowColor = UIColor.red.cgColor
            
        bg.layer.shadowOffset = CGSize(width: 0, height: 0.3)
       bg.layer.shadowRadius = 20
    bg.layer.shadowOpacity = 0.35
       bg.layer.cornerRadius = 30
        bg.layer.masksToBounds = false
        imgshow.backgroundColor = .white
        imgshow.contentMode = .scaleAspectFit
            imgshow.layer.shadowColor = UIColor.red.cgColor
        imgshow.layer.shadowOffset = CGSize(width: 0, height: 0.3)
        imgshow.layer.shadowRadius = 20
        imgshow.layer.shadowOpacity = 0.1
        imgshow.layer.cornerRadius = imgshow.frame.height/2
        imgshow.layer.masksToBounds = false
        imgshow.clipsToBounds = true
        zodiacname.text = zodiacnames[Int(zodiacselec)!-1]
        imgshow.image = UIImage(named: pic[Int(zodiacselec)!-1])
        fortune.text = describe[Int(zodiacselec)!-1]
        }
    }
    
    @IBOutlet weak var bg: UIView!
    @IBOutlet weak var zodiacname: UILabel!
    @IBOutlet weak var imgshow: UIImageView!
    @IBOutlet weak var backbtn: UIButton!
    @IBOutlet weak var fortune: UILabel!
}
