//
//  tarotcard.swift
//  Horo101
//
//  Created by Phumipat Apivansri on 23/11/2563 BE.
//

import Foundation
import  OHMySQL

class tarotcard: NSObject, OHMappingProtocol {
    @objc var tarot_id: NSNumber?
    @objc var tarot_name: String?
    @objc var tarot_img: String?
    @objc var tarot_norm: String?
    @objc var tarot_love: String?
    @objc var tarot_work: String?
    
    func mappingDictionary() -> [AnyHashable : Any]! {
        return ["tarot_id":"tarot_id",
                "tarot_name":"tarot_name",
                "tarot_img":"tarot_img",
                "tarot_norm":"tarot_norm",
                "tarot_love":"tarot_love",
                "tarot_work":"tarot_work"]
    }
    func mySQLTable() -> String! {
        return "tarotcard"
    }
    
    func primaryKey() -> String! {
        return "tarot_id"
    }
}
