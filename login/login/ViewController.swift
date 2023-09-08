//
//  ViewController.swift
//  login
//
//  Created by cassio on 08/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    // Espaçamento fixo em relação às laterais da tela
    let horizontalSpacing: CGFloat = 16.0
    
    // Tamanho padrão dos campos de texto
    let textFieldWidth: CGFloat = 250.0
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo")) // Substitua "logo" pelo nome da sua imagem
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = UIColor.appBlue
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        title = "Login"
        
        setupGradientBackground()
        
        view.addSubview(logoImageView)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        
        setupConstraints()
    }
    
    private func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.appBlue.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Logo
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 125), // Ajuste a posição vertical
            logoImageView.widthAnchor.constraint(equalToConstant: 250), // Ajuste o tamanho
            logoImageView.heightAnchor.constraint(equalToConstant: 250), // Ajuste o tamanho
            
            // Campo de Usuário
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 50),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalSpacing),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -horizontalSpacing),
            usernameTextField.widthAnchor.constraint(equalToConstant: textFieldWidth), // Largura padrão
            
            // Campo de Senha
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalSpacing),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -horizontalSpacing),
            passwordTextField.widthAnchor.constraint(equalToConstant: textFieldWidth), // Largura padrão
            
            // Botão de Login
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: textFieldWidth), // Largura padrão
            loginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

extension UIColor {
    static var appBlue: UIColor {
        return UIColor(named: "AppBlue") ?? .blue
    }
}
