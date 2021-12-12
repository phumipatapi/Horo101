//
//  zodiacprovide.swift
//  Horo101
//
//  Created by Phumipat Apivansri on 29/11/2563 BE.
//

import Foundation
import OHMySQL

class zodiacprovide {
    
    func loadzodiac(_ completion: @escaping ([zodiac]) -> ()) {
        let query = OHMySQLQueryRequestFactory.select("user_zodiac", condition: nil)
        
        let response = try? OHMySQLContainer.shared.mainQueryContext?.executeQueryRequestAndFetchResult(query)
        
        guard let responseObject = response else {
            completion([])
            return
        }
        
        var zodiacinfo = [zodiac]()
        for taskResponse in responseObject {
            let zodiacs = zodiac()
            zodiacs.map(fromResponse: taskResponse)
           zodiacinfo.append(zodiacs)
        }
        
        completion(zodiacinfo)
    }
}

