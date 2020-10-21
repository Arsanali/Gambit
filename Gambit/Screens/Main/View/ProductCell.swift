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
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpSell(with model: Product){
        name.text = model.name
        descriptionLabel.text = model.description
        price.text = ("\(model.price) ₽") 
        
        
        let urlImage = URL(string: model.image ?? "")
        productImage.sd_setImage(with: urlImage, completed: nil)
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        
    }
    
    @IBAction func subtractButton(_ sender: UIButton) {
        
    }
    
}
