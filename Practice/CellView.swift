//
//  CellView.swift
//  Practice
//
//  Created by يعرب المصطفى on 4/3/18.
//  Copyright © 2018 yarob. All rights reserved.
//

import UIKit

@IBDesignable class CellView: UIView
{
    
    @IBInspectable var cornerRad:CGFloat = 0
        {
        didSet{
            self.layer.cornerRadius = cornerRad
        }
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    

}
