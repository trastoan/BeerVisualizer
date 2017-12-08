//
//  Requests.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 08/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import Foundation
import Alamofire

struct PunkRequests {
    static let endpoint = "https://api.punkapi.com/v2/beers"
    static let itensPerPage = 20
    
    static func fetchFromAPI(on page: Int, completion: @escaping ([Beer]?) -> Void) {
        let parameters = ["page": page, "per_page": itensPerPage]
        guard let url = URL(string: endpoint) else { return }
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (json) in
            guard let data = json.data else { return }
            do {
                let beers = try JSONDecoder().decode([Beer].self, from: data)
                DispatchQueue.main.async {
                    completion(beers)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
}
