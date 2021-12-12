//
//  tarotprovide.swift
//  Horo101
//
//  Created by Phumipat Apivansri on 23/11/2563 BE.
//

import Foundation
import OHMySQL

class tarotProvider {
    
    func loadTasks(_ completion: @escaping ([tarotcard]) -> ()) {
        let query = OHMySQLQueryRequestFactory.select("tarotcard", condition: nil)
        let response = try? OHMySQLContainer.shared.mainQueryContext?.executeQueryRequestAndFetchResult(query)
        
        guard let responseObject = response else {
            completion([])
            return
        }
        
        var tarot = [tarotcard]()
        for taskResponse in responseObject {
            let tarots = tarotcard()
            tarots.map(fromResponse: taskResponse)
           tarot.append(tarots)
        }
        
        completion(tarot)
    }
}

