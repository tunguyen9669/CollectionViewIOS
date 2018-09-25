//
//  HeaderView.swift
//  CollectionViewExample
//
//  Created by admin on 9/25/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

protocol HeaderViewDelegate: class {
    func toggleSection(header: HeaderView, section: Int)
}

class HeaderView: UICollectionReusableView {
    @IBOutlet weak var departmentLabel: UILabel!
    
    weak var delegate: HeaderViewDelegate?
    var section: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(HeaderView.tapHeader(gestureRecognizer:))))
        // Initialization code
    }
    @objc func tapHeader(gestureRecognizer: UITapGestureRecognizer) {
        guard let header = gestureRecognizer.view as? HeaderView else {
            return
        }
        print("tap header \(header.section)")
        delegate?.toggleSection(header: self, section: header.section)
    }
}
