//
//  souce.swift
//  Horo101
//
//  Created by Phumipat Apivansri on 11/11/2563 BE.
//

import UIKit
struct menu {
    var type:[String] {
        return ["ไพ่ประจำวัน","ไพ่ยิปซี","เซียมซี","ดวงปี 2564"]
    }
    var imgtype:[UIImage] {
        return [UIImage(named: "cardofdaymenu.jpg")!,UIImage(named: "gypsymenu.jpg")!,UIImage(named: "siiamsimenu.jpg")!,UIImage(named: "fortune64menu.jpg")!]
    }
}
struct gypsy {
    var type:[String] {
        return ["ทั่วไป","ความรัก","การงาน"]
    }
    var image:[UIImage] {
        return [UIImage(named: "normalgypsy.jpg")!,UIImage(named: "lovegypsy.jpg")!,UIImage(named: "workgypsy.jpg")!]
    }
}
struct gypsymenu {
    var normal:[String] {
        return ["อ่านไพ่ใบเดียว","อดีต ปัจจุบัน อนาคต","Celtic Cross"]
    }
    var normalpic:[UIImage] {
        return [UIImage(named: "onecardmenu.jpg")!,UIImage(named: "pastprefumeu.jpg")!,UIImage(named: "celtic.jpg")!]
    }
    var love:[String] {
        return ["ความสัมพันธ์ในปัจจุบัน","ความเข้ากันของคุณกับเขา","การเตรียมพร้อมกับความรัก"]
    }
    var lovepic:[UIImage] {
        return [UIImage(named: "pastprefumeu.jpg")!,UIImage(named: "closeofyou.jpg")!,UIImage(named: "prepare.jpg")!]
    }
    var work:[String] {
        return ["อุปสรรคที่พบเจอ","สถานการณ์ในปัจจุบัน","สถานการณ์การเงิน"]
    }
    var workpic:[UIImage] {
        return [UIImage(named: "hardwork.jpg")!,UIImage(named: "prepare.jpg")!,UIImage(named: "money.jpg")!]
    }
}





