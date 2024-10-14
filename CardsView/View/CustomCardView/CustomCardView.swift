//
//  CustomCardView.swift
//  Office
//
//  Created by Neel P. Moradiya on 09/10/24.
//

import UIKit

class CustomCardView: UIView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var lblAi: UILabel!
    @IBOutlet weak var LblViewProfile: UILabel!
    
    @IBOutlet weak var lblFirst: UILabel!
    
    @IBOutlet weak var lblSeconds: UILabel!
    
    @IBOutlet weak var lblMore: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
}
