//
//  xiamsi.swift
//  Horo101
//
//  Created by Phumipat Apivansri on 24/11/2563 BE.
//

import Foundation
import OHMySQL

class xiamsi: NSObject,OHMappingProtocol {
    @objc var siiamsi_no: NSNumber?
    @objc var siiamsi_fortune: String?
    func mappingDictionary() -> [AnyHashable : Any]! {
        return ["siiamsi_no":"siiamsi_no",
                "siiamsi_fortune":"siiamsi_fortune"]
    }
    
    func mySQLTable() -> String! {
        return "siiamsi"
    }
    
    func primaryKey() -> String! {
        return "siiamsi_no"
    }
    
    
}
