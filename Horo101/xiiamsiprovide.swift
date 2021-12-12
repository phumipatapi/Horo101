//
//  xiiamsiprovide.swift
//  Horo101
//
//  Created by Phumipat Apivansri on 24/11/2563 BE.
//

import Foundation
import OHMySQL

class xiiamsiprovide {
    
    func loadsiiamsi(_ completion: @escaping ([xiamsi]) -> ()) {
        let query = OHMySQLQueryRequestFactory.select("siiamsi", condition: nil)
        let response = try? OHMySQLContainer.shared.mainQueryContext?.executeQueryRequestAndFetchResult(query)
        
        guard let responseObject = response else {
            completion([])
            return
        }
        
        var xiamsiluck = [xiamsi]()
        for taskResponse in responseObject {
            let xiiamsi = xiamsi()
            xiiamsi.map(fromResponse: taskResponse)
           xiamsiluck.append(xiiamsi)
        }
        
        completion(xiamsiluck)
    }
}

