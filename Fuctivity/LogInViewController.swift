//
//  LogInViewController.swift
//  Fuctivity
//
//  Created by Sosin Vladislav on 10.12.2022.
//

import UIKit

final class LogInViewController: UIViewController {
    var imageView = UIImageView()
    var logInButton = UIButton(type: .system)
    var textLabel = UILabel()
    
    var nameTextField = UITextField()
    var emailTextField = UITextField()
    var passwordTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setElements()
    }
    
    private func setElements() {
        setImage()
        
        setTextLabel(
            label: textLabel,
            x: 25,
            y: view.frame.size.height / 2.375,
            width: view.frame.size.width,
            height: view.frame.size.width / 11,
            text: "Вход в аккаунт",
            lines: 2,
            textType: "bold"
        )
        
        setLogInButton()
        setTextFields(nameTextField, text: "Пароль", tag: 0)
        setTextFields(emailTextField, text: "Email", tag: 1)
        setTextFields(passwordTextField, text: "Имя пользователя", tag: 2)
    }
    
    private func setTextFields(_ textField: UITextField, text: String, tag: Int) {
        textField.placeholder = text
        textField.font = UIFont.systemFont(ofSize: 25)
        textField.borderStyle = UITextField.BorderStyle.none
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        
        if text == "Пароль" {
            textField.isSecureTextEntry = true
        } else {
            textField.clearButtonMode = UITextField.ViewMode.whileEditing
        }
            
        view.addSubview(textField)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        let bottomAnchor = textField.bottomAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: -view.frame.size.height / CGFloat(9) - (view.frame.size.height / CGFloat(13)) * CGFloat(tag))
        let leftAnchor = textField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40)
        let rightAnchor = textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        let heightAnchor = NSLayoutConstraint(
            item: textField,
            attribute: NSLayoutConstraint.Attribute.height,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 45
        )
        
        NSLayoutConstraint.activate([bottomAnchor, leftAnchor, rightAnchor, heightAnchor])
    }
    
    private func setImage() {
        view.backgroundColor = .white
        imageView = UIImageView(frame: self.view.bounds)
        imageView = UIImageView(frame: CGRect(
            x: -10,
            y: 0,
            width: view.frame.size.width + 10,
            height: view.frame.size.height / 2.2
        ))
        imageView.image = UIImage(named: "top_screen_honey")
        view.addSubview(imageView)
    }
    
    private func setLogInButton() {
        logInButton.backgroundColor = UIColor(hex: 0x9D9DEE)
        logInButton.layer.cornerRadius = 12
        logInButton.setTitle("Войти", for: .normal)
        logInButton.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        logInButton.tintColor = .black
        view.addSubview(logInButton)
        
        logInButton.translatesAutoresizingMaskIntoConstraints = false

        let bottomAnchor = logInButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.frame.size.height / 9)
        let leftAnchor = logInButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        let rightAnchor = logInButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        let heightAnchor = NSLayoutConstraint(
            item: logInButton,
            attribute: NSLayoutConstraint.Attribute.height,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 45
        )
        
        NSLayoutConstraint.activate([bottomAnchor, leftAnchor, rightAnchor, heightAnchor])
    }
    
    private func setTextLabel(
        label: UILabel,
        x: CGFloat,
        y: CGFloat,
        width: CGFloat,
        height: CGFloat,
        text: String,
        lines: Int = 1,
        textType: String = "classic") {
        let k = lines > 1 ? lines + 1 : lines
        label.frame = CGRect(x: x, y: y, width: width, height: height * CGFloat(k))
        label.text = text
        label.numberOfLines = lines
            
        if textType == "classic" {
            label.font = UIFont.systemFont(ofSize: height)
        } else {
            label.font = UIFont.boldSystemFont(ofSize: height)
        }
        
        view.addSubview(label)
    }
}