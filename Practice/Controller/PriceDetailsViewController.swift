//
//  PriceDetailsViewController.swift
//  Practice
//
//  Created by Ammar AlTahhan on 05/04/2018.
//  Copyright © 2018 yarob. All rights reserved.
//

import UIKit

class PriceDetailsViewController: UIViewController {
    
    var post: Post!
    var primaryColor: UIColor!
    @IBOutlet weak var priceDetails: UILabel!
    @IBOutlet weak var backView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        backView.backgroundColor = primaryColor
    }

}
