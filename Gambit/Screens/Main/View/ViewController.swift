//
//  ViewController.swift
//  Gambit
//
//  Created by arsik on 20.10.2020.
//

import UIKit

class ViewController: UIViewController{
    
    var presenter: MainPresenter?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate   = self

        presenter = MainPresenterExp(view: self)
        presenter?.getData()
    }
}
//MARK: - MainViewScreens 
extension ViewController: MainView {
    func showData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

//MARK: - tableViewDataSourse methods
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.model?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ProductCell , let productModel = presenter?.model?[indexPath.row] else { return UITableViewCell() }
        cell.setUpSell(with: productModel)
        return cell 
    }
    
}

//MARK: - tableViewDeleagate methods
extension ViewController: UITableViewDelegate {
    
}

