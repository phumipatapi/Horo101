//
//  fortune64.swift
//  Horo101
//
//  Created by Phumipat Apivansri on 29/11/2563 BE.
//

import UIKit
import DatePicker
class fortunenextyear: UIViewController {
    var dayselec = Int()
    var monthselec = Int()
    var zodiac = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        backbtn.imageView?.contentMode = .scaleAspectFit
        backbtn.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        backbtn.imageView?.tintColor = UIColor.systemPink
      dateselect.imageView?.contentMode = .scaleAspectFit
        dateselect.layer.shadowColor = UIColor.red.cgColor
        dateselect.layer.shadowOffset = CGSize(width: 0, height: 0.3)
        dateselect.layer.shadowRadius = 25
        dateselect.layer.shadowOpacity = 0.35
        dateselect.layer.masksToBounds = false
        seguebut.isUserInteractionEnabled = false
        seguebut.isHidden = true
        dateselect.isHidden = false
    }
    
    @IBOutlet weak var seguebut: UIButton!
    
    @IBOutlet weak var backbtn: UIButton!
    @IBOutlet weak var dateselect: UIButton!
    @IBAction func dateselec(_ sender: Any) {
        let datePicker = DatePicker()
        datePicker.setupYearless { [self] (selected, month, day) in
            if selected, let day = day, let month = month {
                if day != 0 && month != 0 {
                    dateselect.isUserInteractionEnabled = true
                    self.dayselec = day
                    self.monthselec = month
                    zodiacculculate()
                    self.seguebut.sendActions(for: .touchUpInside)
                }
                }
            }
        datePicker.setColors(main: UIColor(red: 1.00, green: 0.67, blue: 0.62, alpha: 1.00), background: .white, inactive: UIColor(red: 1.00, green: 0.67, blue: 0.62, alpha: 1.00))
        datePicker.show(in: self, on: sender as? UIView)
           }
    
    func zodiacculculate() {
        if dayselec > 14 && dayselec < 31 && monthselec == 4 {
            zodiac=1
            
            }
        else if dayselec > 0 && dayselec < 15 && monthselec == 5
        {
            zodiac=1
            }
        else if dayselec > 14 && dayselec < 32 && monthselec == 5 {
            zodiac=2
        }
        else if dayselec > 0 && dayselec < 15 && monthselec == 6 {
            zodiac=2
        }
        else if dayselec > 14 && dayselec < 31 && monthselec == 6 {
            zodiac=3
        }
        else if dayselec > 0 && dayselec < 15 && monthselec == 7 {
            zodiac=3
        }
        else if dayselec > 14 && dayselec < 32 && monthselec == 7 {
            zodiac=4
        }
        else if dayselec > 0 && dayselec < 15 && monthselec == 8 {
            zodiac=4
        }
        else if dayselec > 14 && dayselec < 32 && monthselec == 8 {
            zodiac=5
        }
        else if dayselec > 0 && dayselec < 15 && monthselec == 9 {
            zodiac=5
        }
        else if dayselec > 14 && dayselec < 31 && monthselec == 9 {
            zodiac=6
        }
        else if dayselec > 0 && dayselec < 15 && monthselec == 10 {
            zodiac=6
        }
        else if dayselec > 14 && dayselec < 32 && monthselec == 10 {
            zodiac=7
        }
        else if dayselec > 0 && dayselec < 15 && monthselec == 11 {
            zodiac=7
        }
        else if dayselec > 14 && dayselec < 31 && monthselec == 11 {
            zodiac=8
        }
        else if dayselec > 0 && dayselec < 15 && monthselec == 12 {
            zodiac=8
        }
        else if dayselec > 14 && dayselec < 32 && monthselec == 12 {
            zodiac=9
        }
        else if dayselec > 0 && dayselec < 15 && monthselec == 1 {
            zodiac=9
        }
        else if dayselec > 14 && dayselec < 32 && monthselec == 1 {
            zodiac=10
        }
        else if dayselec > 0 && dayselec < 15 && monthselec == 2 {
            zodiac=10
        }
        else if dayselec > 14 && dayselec < 30 && monthselec == 2 {
            zodiac=11
        }
        else if dayselec > 0 && dayselec < 15 && monthselec == 3 {
            zodiac=11
        }
        else if dayselec > 14 && dayselec < 32 && monthselec == 3 {
            zodiac=12
        }
        else if dayselec > 0 && dayselec < 15 && monthselec == 4 {
            zodiac=12
        }
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        switch segue.identifier {
        case "segue" :
            let vc = segue.destination as? fortuneshow
            vc?.zodiacselec = String(zodiac)
        default: return}
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



