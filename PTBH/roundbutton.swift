//
//  roundbutton.swift
//  PTBH
//
//  Created by Tran Nhat Tuan on 4/19/18.
//  Copyright © 2018 Tran Nhat Tuan. All rights reserved.
//

import UIKit

@IBDesignable

class roundbutton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWith: CGFloat = 0 {
        didSet{
            self.layer.borderWidth = borderWith
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }


    }
}

