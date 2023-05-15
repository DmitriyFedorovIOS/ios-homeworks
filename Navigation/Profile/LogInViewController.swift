//
//  LogInViewController.swift
//  Navigation
//
//  Created by Fedorov Dmitry on 28.04.2023.
//


import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Private
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        
        view.showsVerticalScrollIndicator = true
        view.showsHorizontalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var textFieldView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.distribution = .fillEqually
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.spacing = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    
    private lazy var logoImageView: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "logo.png")
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    
    private lazy var loginTextField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Телефон"
        textField.indent(size: 10)
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.backgroundColor = UIColor.systemGray6.cgColor
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.minimumFontSize = 15
        textField.autocapitalizationType = .none
        textField.textColor = UIColor.black
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Пароль"
        textField.indent(size: 10)
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.backgroundColor = UIColor.systemGray6.cgColor
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.minimumFontSize = 15
        textField.autocapitalizationType = .none
        textField.textColor = UIColor.black
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        
        textField.delegate = self
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        
        return textField
    }()
    
    private lazy var buttonLogin: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "blue_pixel.png"), for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10.0
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(pressButtonLogin), for: .touchUpInside)
        
        return button
        
    }()
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addedSubwiew()
        setupConstrain()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupKeyboardObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        removeKeyboardObservers()
    }
    
    
    func setupView() {
        self.navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
    }
    
    func addedSubwiew() {
        contentView.addSubview(logoImageView)
        stackView.addSubview(loginTextField)
        stackView.addSubview(passwordTextField)
        stackView.addSubview(textFieldView)
        contentView.addSubview(stackView)
        contentView.addSubview(buttonLogin)
        scrollView.addSubview(contentView)
        scrollView.addSubview(stackView)
        view.addSubview(scrollView)
        
    }
    
    //MARK: - Constraints
    func setupConstrain() {
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            
            loginTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            loginTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            
            textFieldView.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 0),
            textFieldView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            textFieldView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            textFieldView.heightAnchor.constraint(equalToConstant: 0),
            
            stackView.topAnchor.constraint(equalTo: loginTextField.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: passwordTextField.bottomAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 0),
            passwordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            buttonLogin.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            buttonLogin.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            buttonLogin.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            buttonLogin.heightAnchor.constraint(equalToConstant: 50),
            buttonLogin.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
    }
    
    // MARK: - Func
    
    private func setupKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willShowKeyboard(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willHideKeyboard(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    private func removeKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    //MARK: - Actions
    
    @objc func willShowKeyboard(_ notification: NSNotification) {
        let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
        scrollView.contentInset.bottom += keyboardHeight ?? 0.0
    }
    
    @objc func willHideKeyboard(_ notification: NSNotification) {
        scrollView.contentInset.bottom = 0.0
    }
    
    @objc private func pressButtonLogin() {
        guard let email = loginTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            let alert = UIAlertController(title: "Ошибка", message: "Пожалуйста, заполните все поля", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
            return
        }
        
        let profileViewController = ProfileViewController()
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    
}

extension UITextField {
    func indent(size: CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
    }
}



