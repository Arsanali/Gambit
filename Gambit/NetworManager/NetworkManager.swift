//
//  NetworkManager.swift
//  Gambit
//
//  Created by arsik on 20.10.2020.
//

import Foundation
import Alamofire

protocol NetworkManager {
    typealias completion = (Result<[Product], Error>)-> ()
    func pushData(completionHandler: @escaping (completion))
}

class NetworkManagerExp: NetworkManager {
    func pushData(completionHandler: @escaping (completion)) {
        AF.request(API.baseUrl , method: .get).response { (responseData) in
            
            if let error = responseData.error {
                completionHandler(.failure(error))
                return
            }
          
          guard let data = responseData.data else { return }
          
          do {
            let productData = try JSONDecoder().decode([Product].self, from:data )
            
            completionHandler(.success(productData))
            
            print(productData)
          } catch (let error) {
            
            completionHandler(.failure(error))
            
            print("Данные не пришли \(error.localizedDescription)")
            
            }
        }
    }
}
