//
//  fortune.swift
//  Horo101
//
//  Created by Phumipat Apivansri on 29/11/2563 BE.
//

import Foundation
import OHMySQL

class fortunes:NSObject,OHMappingProtocol {
    @objc var holoyear_num:NSNumber?
    @objc var holoyear_detail: String?
    func mappingDictionary() -> [AnyHashable : Any]! {
        return ["holoyear_num":"holoyear_num","holoyear_detail":"holoyear_detail"]
        
    }
    
    func mySQLTable() -> String! {
        return "holoyear"
    }
    
    func primaryKey() -> String! {
        return "holoyear_num"
    }
    
    
}
