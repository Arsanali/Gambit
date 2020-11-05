//
//  ViewController.swift
//  Gambit
//
//  Created by arsik on 20.10.2020.
//

import UIKit

class ViewController: UIViewController{
    
    //MARK: - Private properties
    private var presenter: MainPresenter?
    
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Model
    var productModel: [Product] = [] { didSet { tableView.reloadData() } }

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNavBar()
        initTableView()
        initPresenter()
    }
    
    
    
    //MARK: - Private methods
    private func initTableView() {
        
        tableView.dataSource = self
        tableView.delegate   = self
        tableView.separatorStyle = .none
        
    }
    
    private func initPresenter() {
        
        presenter = MainPresenterExp(view: self)
        presenter?.getData()
    }
    
    private func initNavBar() {
        
        let logo = UIImage(named: "G")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.8901960784, green: 0.07058823529, blue: 0.5607843137, alpha: 1)
    }
}


//MARK: - MainViewScreens 
extension ViewController: MainView {
    func showData(items: [Product]) {
        self.productModel.append(contentsOf: items)
    }
}


//MARK: - tableViewDataSourse methods
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.model?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ProductCell else { return UITableViewCell() }
        
        
        cell.setUpSell(with: productModel[indexPath.row])
        cell.selectionStyle = .none
        //
        //        if productModel.isFavorite == true {
        //            print("Selected")
        //            cell.imageView?.image = #imageLiteral(resourceName: "1")
        //        } else {
        //            cell.imageView?.image = #imageLiteral(resourceName: "0")
        //            print("Non-Selected")
        //        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

//MARK: - tableViewDeleagate methods
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true 
    }
    //MARK: - Свайп и добавление в избранное
        
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let index = indexPath.row
        
        let isFav = Favorites.shared.favoriteClick(item: self.productModel[index])
    
        let action = UIContextualAction(style: .normal, title: "") { (action, view, complitionHandler) in
            
            let item = self.productModel[indexPath.row]
            Favorites.shared.addOrRemoveFavorite(item: item)
            complitionHandler(true)
        }
        
        action.image = isFav ? UIImage(named: "1") : UIImage(named: "0")
        action.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.04)
        
        let actions = UISwipeActionsConfiguration(actions: [action])
        return actions
    }

}
