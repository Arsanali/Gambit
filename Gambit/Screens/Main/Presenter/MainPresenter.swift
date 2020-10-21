//
//  MainPresenter.swift
//  Gambit
//
//  Created by arsik on 20.10.2020.
//

import Foundation

protocol MainView:class {
    func showData()
}

protocol MainPresenter:class {
    var model:[Product]? {get set}
    func getData()
}

class MainPresenterExp: MainPresenter {
    
    var model: [Product]?
    weak var view: MainView?
    let networking: NetworkManager?
    
    init(view: MainView) {
        self.view = view
        networking = NetworkManagerExp()
    }
    
    func getData() {
        networking?.pushData(completionHandler: {[weak self] (response) in
            DispatchQueue.main.async { [self] in
                switch response {
                case .success(let data):
                    self?.model = data
                    self?.view?.showData()
                    print("Данные пришли \(data)")
                case .failure(let error):
                    print("Ошибка \(error.localizedDescription)")
                }
            }
        })
    }
}
