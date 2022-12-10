//
//  CategoryDescriptionViewController.swift
//  Fuctivity
//
//  Created by Федор Филиппов on 10.12.2022.
//

import Foundation
import UIKit

class CategoryDescriptionViewController: UIViewController {
    
    let continueButton = UIButton()
    let textView = UITextView()
    let descriptionLabel = UILabel()
    let hourLabel = UIButton()
    let categoryButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setupContinueButton()
        setupHourInfoLabel()
        setupCategoryButton()
        setupTextView()
    }
    
    private func setupContinueButton() {
        self.view.addSubview(continueButton)
        continueButton.setTitle("Продолжить", for: .normal)
        continueButton.setTitleColor(.black, for: .normal)
        continueButton.addTarget(self, action: #selector(continueAction), for: .touchUpInside)
        continueButton.backgroundColor = UIColor.UIColorFromRGB(rgbValue: 0xaf95fc)
        continueButton.layer.cornerRadius = 12
        continueButton.pinTop(to: self.view.centerYAnchor)
        continueButton.pin(to: self.view, [.left: 90, .right: 90])
    }
    
    @objc
    private func continueAction() {
        
    }
    
    private func setupHourInfoLabel() {
        self.view.addSubview(hourLabel)
        hourLabel.setTitle("2 ч. отдыха", for: .normal)
        hourLabel.setTitleColor(.black, for: .normal)
        hourLabel.addTarget(self, action: #selector(continueAction), for: .touchUpInside)
        hourLabel.backgroundColor = UIColor.UIColorFromRGB(rgbValue: 0xaf95fc)
        hourLabel.layer.cornerRadius = 12
        hourLabel.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        hourLabel.pinLeft(to: self.view.leadingAnchor, 20)
        hourLabel.pin(to: self.view, [.left: 20, .right: 160])
    }
    
    private func setupCategoryButton() {
        self.view.addSubview(categoryButton)
        let categoryHandler = {
            (action: UIAction) in print()
        }
        
        categoryButton.menu = UIMenu(children: [
            UIAction(title: "Категория:\tГейминг", handler: categoryHandler),
            UIAction(title: "Категория:\tСон", handler: categoryHandler),
            UIAction(title: "Категория:\tПрогулка", handler: categoryHandler)
        ])
        
        categoryButton.showsMenuAsPrimaryAction = true
        if #available(iOS 15.0, *) {
            categoryButton.changesSelectionAsPrimaryAction = true
        } else {
        }
        
        categoryButton.setTitleColor(.black, for: .normal)
        categoryButton.layer.cornerRadius = 7
        categoryButton.setHeight(to: 60)
        categoryButton.setTitle("Категория не выбрана", for: .normal)
        categoryButton.backgroundColor = UIColor.UIColorFromRGB(rgbValue: 0xded2fc)
        categoryButton.pinBottom(to: continueButton.topAnchor, 25)
        categoryButton.pin(to: self.view, [.left: 20, .right: 20])
    }
    
    private func setupTextView() {
        textView.font = .systemFont(ofSize: 14, weight: .regular)
        textView.textColor = .black
        textView.backgroundColor = .clear
        textView.setHeight(to: 100)
        
        descriptionLabel.text = "Напишите примерный план, чем хотите заняться"
        
        let stackView = UIStackView(arrangedSubviews: [descriptionLabel, textView])
        self.view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fill
        
        self.textView.layer.borderColor = UIColor.gray.cgColor
        self.textView.layer.borderWidth = 2.0;
        self.textView.layer.cornerRadius = 10;

        descriptionLabel.numberOfLines = 0
        
        stackView.pinTop(to: hourLabel.bottomAnchor, 40)
        stackView.pin(to: self.view, [.left: 20, .right: 20])
        
        stackView.subviews[0].pin(to: stackView, [.left: 10, .right: 30])
        stackView.subviews[0].pinTop(to: stackView.topAnchor, 15)
        stackView.subviews[1].pinBottom(to: stackView.bottomAnchor, 30)
        stackView.subviews[1].pin(to: stackView, [.left: 10, .right: 30])
        
        stackView.backgroundColor = UIColor.UIColorFromRGB(rgbValue: 0xded2fc)
        stackView.layer.cornerRadius = 7
    }
}
