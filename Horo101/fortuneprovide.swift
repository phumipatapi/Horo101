//
//  fortuneprovide.swift
//  Horo101
//
//  Created by Phumipat Apivansri on 29/11/2563 BE.
//

import Foundation
import OHMySQL

class fortuneprovide {
func loadfortune(_ completion: @escaping ([fortunes]) -> ()) {
    let query = OHMySQLQueryRequestFactory.select("holoyear", condition: nil)
    let response = try? OHMySQLContainer.shared.mainQueryContext?.executeQueryRequestAndFetchResult(query)
    
    guard let responseObject = response else {
        completion([])
        return
    }
    
    var fortuneinfo = [fortunes]()
    for taskResponse in responseObject {
        let fortunequery = fortunes()
        fortunequery.map(fromResponse: taskResponse)
       fortuneinfo.append(fortunequery)
    }
    
    completion(fortuneinfo)
}
}
