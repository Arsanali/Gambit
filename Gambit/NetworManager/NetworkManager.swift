//
//  NetworkManager.swift
//  Gambit
//
//  Created by arsik on 20.10.2020.
//

import Foundation

protocol NetworkManager {
    typealias completion = (Result<[Product], Error>)-> ()
}

class NetworkManagerExp: NetworkManager {
    func pushData(completionHandler: @escaping (completion)) {
        
    }
}
