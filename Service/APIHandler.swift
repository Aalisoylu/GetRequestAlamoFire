//
//  APIHandler.swift
//  GetRequestAlamoFire
//
//  Created by Muhammed Ali SOYLU on 3.02.2023.
//

import Foundation
import Alamofire

class APIHandler {
    static let shared = APIHandler()
    
    func fetchingAPIDATA(handler: @escaping (_ apiData: [Model]) -> (Void)){
        print(myURL().baseURL)
        
        AF.request(myURL().baseURL, method: .get, parameters: nil, encoding: URLEncoding.default,headers: nil,interceptor: nil).response { myresponse in
            switch myresponse.result {
                case .success(let data):
                    do{
                        let jsondata = try JSONDecoder().decode([Model].self, from: data!)
                        //clouser calling
                        handler(jsondata)
                        print(jsondata)
                    }
                catch{
                    print(error.localizedDescription)
                }
                case .failure(let error):
                    print(error.localizedDescription)
            }

        }
        
        
    }
    
}

struct Model:Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
