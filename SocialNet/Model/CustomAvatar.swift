//
//  CustomAvatar.swift
//  SocialNet
//
//  Created by Роман Евтюхин on 16.10.2020.
//

import Foundation
import UIKit

@IBDesignable class CustomAvatar: UIView {
    
    // IBInspectable - возможность изменения ширины, цвета, прозрачности тени в interface builder (меню справа)
    @IBInspectable var size: CGFloat = 8 {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable var color: UIColor = UIColor.black {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable var opacity: Float = 0.8 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    
    override func draw(_ rect: CGRect) {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        view.backgroundColor = .cyan
        view.layer.cornerRadius = 25 // делаем круглой
        view.layer.shadowColor = color.cgColor // тень цвет (параметры из IBInspectable)
        view.layer.shadowOffset = .zero // сдвига тени - нет
        view.layer.shadowRadius = size // радиус тени (параметры из IBInspectable)
        view.layer.shadowOpacity = opacity //прозрачность (параметры из IBInspectable)
        self.addSubview(view)
        
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 25
        self.addSubview(imageView)
        
    }
}
