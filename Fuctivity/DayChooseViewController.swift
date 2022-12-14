//
//  DayChooseViewController.swift
//  Fuctivity
//
//  Created by Sosin Vladislav on 12.12.2022.
//

import UIKit

final class DayChooseViewController: UIViewController {
    var boldTextLabel = UILabel()
    var secondTextLabel = UILabel()
    var nextStepButton = UIButton(type: .system)
    
    var buttonsColumnSize: Int = 0
    var betweenButtonsDistance: Int = 0
    var buttons = [UIButton]()
    var currentIterator: Int = 0
    
    var weekDays: [String] = ["Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonsColumnSize = Int(view.frame.size.width / 5.5)
        betweenButtonsDistance = Int(view.frame.size.width / 17.2)
        navigationItem.setHidesBackButton(true, animated: true)
        setElements()
        addActions()
    }
    
    private func setElements() {
        view.backgroundColor = .white
        createButtons(0, 4, Int(view.frame.size.height / 1.9))
        createButtons(4, 7, Int(view.frame.size.height / 1.9) + buttonsColumnSize + betweenButtonsDistance)
        setBoldText()
        setSecondText()
        setNextButton()
    }
    
    private func setBoldText() {
        boldTextLabel.text = """
        Отлично!
        Следующий шаг — распределить ваши дни на рабочие и выходные
        """
        boldTextLabel.font = UIFont.boldSystemFont(ofSize: view.frame.size.width / 12.3)
        boldTextLabel.numberOfLines = 5
        view.addSubview(boldTextLabel)
        
        boldTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let topAnchor = boldTextLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.size.height / 14)
        let leftAnchor = boldTextLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        let rightAnchor = boldTextLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        
        NSLayoutConstraint.activate([topAnchor, leftAnchor, rightAnchor])
    }
    
    private func setSecondText() {
        secondTextLabel.text = """
        Отметьте пожалуйста, в какие дни вы работаете. Если у вас нестабильный график — просто отметьте все дни!
        """
        secondTextLabel.font = UIFont.systemFont(ofSize: view.frame.size.width / 21.5)
        secondTextLabel.numberOfLines = 5
        view.addSubview(secondTextLabel)
        
        secondTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let topAnchor = secondTextLabel.topAnchor.constraint(equalTo: boldTextLabel.bottomAnchor, constant: view.frame.size.height / 30)
        let leftAnchor = secondTextLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        let rightAnchor = secondTextLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        
        NSLayoutConstraint.activate([topAnchor, leftAnchor, rightAnchor])
    }
    
    private func addActions() {
        nextStepButton.addTarget(self, action: #selector(goToNextController), for: .touchUpInside)
    }
    
    @objc
    private func goToNextController() {
        let chooseHoursVC = ChooseHoursViewController()
        self.navigationController?.pushViewController(chooseHoursVC, animated: true)
    }
    
    private func createButtons(_ first: Int, _ second: Int, _ yy: Int) {
        var y = 20
        
        for i in first..<second {
            currentIterator = i
            let button = UIButton()
            button.frame = CGRect(x: y, y: yy, width: buttonsColumnSize, height: buttonsColumnSize)
            button.titleLabel?.textAlignment = .center
            button.layer.cornerRadius = 15
            button.backgroundColor = .white
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
            button.setTitle("\(weekDays[i])", for: .normal)
            button.addTarget(self, action: #selector(becomeOrange(sender:)), for: .touchUpInside)
            button.setTitleColor(.black, for: .normal)
            view.addSubview(button)
            buttons.append(button)
            
            y += buttonsColumnSize + betweenButtonsDistance
        }
    }
    
    @objc
    private func becomeOrange(sender: UIButton) {
        sender.backgroundColor =
        sender.backgroundColor == .white ? UIColor(hex: 0xFFBA52) : .white
    }
    
    private func setNextButton() {
        nextStepButton.backgroundColor = UIColor(hex: 0x9D9DEE)
        nextStepButton.layer.cornerRadius = 15
        nextStepButton.setTitle("Продолжить", for: .normal)
        nextStepButton.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        nextStepButton.tintColor = .black
        view.addSubview(nextStepButton)
        
        nextStepButton.translatesAutoresizingMaskIntoConstraints = false

        let bottomAnchor = nextStepButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.frame.size.height / 9)
        let leftAnchor = nextStepButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        let rightAnchor = nextStepButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        let heightAnchor = NSLayoutConstraint(
            item: nextStepButton,
            attribute: NSLayoutConstraint.Attribute.height,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 45
        )
            
        NSLayoutConstraint.activate([bottomAnchor, leftAnchor, rightAnchor, heightAnchor])
    }
}