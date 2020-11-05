//
//  ProductCell.swift
//  Gambit
//
//  Created by arsik on 20.10.2020.
//

import UIKit
import SDWebImage

class ProductCell: UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var labelCount: UILabel!
    @IBOutlet weak var pricelabel: UILabel!
    @IBOutlet weak var minusbtn: UIButton!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    
    var countOrder: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        minusbtn.layer.cornerRadius  = 8
        addBtn.layer.cornerRadius    = 8
        minusbtn.layer.masksToBounds = true
        addBtn.layer.masksToBounds   = true
    }
    
    //MARK: - setup TableViewCell
    func setUpSell(with model: Product) {
        
        name.text = model.name
        descriptionLabel.text = model.description
        pricelabel.text = ("\(model.price) ₽")
        pricelabel.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        pricelabel.layer.cornerRadius = 8
        pricelabel.layer.masksToBounds = true
        pricelabel.font = UIFont.boldSystemFont(ofSize: 17)
        
        let urlImage = URL(string: model.image ?? "")
        productImage.sd_setImage(with: urlImage, completed: nil)
        
        
        
        minusbtn.isHidden = true
        labelCount.isHidden = true
        addBtn.setTitle("В корзину", for: .normal)
        
    }
    
    
    //MARK: - Функция счетчик заказов
    func counterOrder(){
        countOrder += 1
        countLabel.text = ("\(countOrder)")
        print(countOrder)
    }
    func substractOrder(){
        countOrder -= 1
        countLabel.text = ("\(countOrder)")
        print(countOrder)
    }
    //MARK: - Кнопка добавления в корзину
    @IBAction func addButton(_ sender: UIButton) {
        counterOrder()
        if countOrder >= 1  {
            minusbtn.isHidden = false
            labelCount.isHidden = false
            addBtn.setTitle("+", for: .normal)
        }
        
    }
    
    //MARK: - Кнопка минус 1 элемент
    @IBAction func minusButton(_ sender: UIButton) {
        if countOrder <= 1 {
            minusbtn.isHidden = true
            labelCount.isHidden = true
            addBtn.setTitle("В корзину", for: .normal)
        }
        substractOrder()
    }
}

