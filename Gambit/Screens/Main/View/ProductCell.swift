//
//  ProductCell.swift
//  Gambit
//
//  Created by arsik on 20.10.2020.
//

import UIKit

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
    
    func setUpSell(){
        
    }
    
    @IBAction func basketButton(_ sender: Any) {
        
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        
    }
    
    @IBAction func subtractButton(_ sender: UIButton) {
        
    }
    

}
