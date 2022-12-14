//
//  PinElements.swift
//  Fuctivity
//
//  Created by Sosin Vladislav on 14.12.2022.
//

import UIKit

extension UIView {
    func setBottomButtonConstraints(view: UIView, button: UIButton) {
        button.translatesAutoresizingMaskIntoConstraints = false

        let bottomAnchor = button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.frame.size.height / 9)
        let leftAnchor = button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        let rightAnchor = button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        let heightAnchor = NSLayoutConstraint(
            item: button,
            attribute: NSLayoutConstraint.Attribute.height,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 45
        )
            
        NSLayoutConstraint.activate([bottomAnchor, leftAnchor, rightAnchor, heightAnchor])
    }
}
