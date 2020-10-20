//
//  ViewController.swift
//  Gambit
//
//  Created by arsik on 20.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    var presenter: MainPresenter?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate   = self

        
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.model?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell 
    }
    
}

extension ViewController: UITableViewDelegate {
    
}

