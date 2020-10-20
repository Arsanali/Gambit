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
    
    init(view: MainView) {
        self.view = view
    }
    
    func getData() {
        print("")
    }
}
