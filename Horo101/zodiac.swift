//
//  zodiac.swift
//  Horo101
//
//  Created by Phumipat Apivansri on 29/11/2563 BE.
//

import Foundation
import OHMySQL

class zodiac:NSObject,OHMappingProtocol {
    @objc var zodiac_num:NSNumber?
    @objc var zodiac_name: String?
    @objc var zodiac_pic: String?
    func mappingDictionary() -> [AnyHashable : Any]! {
        return ["zodiac_num":"zodiac_num","zodiac_name":"zodiac_name","zodiac_pic":"zodiac_pic"]
        
    }
    
    func mySQLTable() -> String! {
        return "user_zodiac"
    }
    
    func primaryKey() -> String! {
        return "zodiac_num"
    }
    
    
}
