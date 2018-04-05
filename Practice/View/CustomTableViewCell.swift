//
//  CustomTableViewCell.swift
//  Practice
//
//  Created by يعرب المصطفى on 4/3/18.
//  Copyright © 2018 yarob. All rights reserved.
//

import UIKit

 @IBDesignable class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var priceBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var cellBar: UIView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(thePost post : Post)
    {
        self.price.text = post.title
    }
    
    func setupColor(index:Int)
    {
        
        self.cellBar.backgroundColor = Color.colors[index%Color.colors.count]
    }
    
    @IBAction func priceBtnTapped(_ sender: Any) {
        
    }

}
