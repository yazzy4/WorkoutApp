//
//  LoginView.swift
//  WorkoutApp
//
//  Created by Yaz Burrell on 3/6/19.
//  Copyright © 2019 Yaz Burrell. All rights reserved.
//

import UIKit

enum AccountLoginState {
    case newAccount
    case existingAccount
}

protocol LoginViewDelegate: AnyObject {
    func didSelectLoginButton(_ loginView: LoginView, accountLoginState: AccountLoginState)
}

class LoginView: UIView {

    
    @IBOutlet var LoginView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginLabel: UILabel!
    
    private var tapGesture: UITapGestureRecognizer!
    private var accountLoginState = AccountLoginState.newAccount
    
    public weak var delegate: LoginViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        // load the nib/.xib file
        Bundle.main.loadNibNamed("LoginView", owner: self, options: nil)
        addSubview(LoginView)
        // content view takes size of self.bounds
        LoginView.frame = bounds
        LoginView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // setup button action
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        
        // setup message label actions
        // setup tap gesture recognizer
        
        // UILabel and UIImageView by default isUserInteractionEnabled is false, thus not allowing for gesture recognition by the user
        loginLabel.isUserInteractionEnabled = true
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(gestureRecognizer:)))
        loginLabel.addGestureRecognizer(tapGesture)
    }
    
    @objc private func loginButtonPressed() {
        delegate?.didSelectLoginButton(self, accountLoginState: accountLoginState)
    }
    
    @objc private func handleTap(gestureRecognizer: UITapGestureRecognizer) {
        accountLoginState = accountLoginState == .newAccount ? .existingAccount : .newAccount
        switch accountLoginState {
        case .newAccount:
            loginButton.setTitle("Create", for: .normal)
            loginLabel.text = "Login into your account"
        case .existingAccount:
            loginButton.setTitle("Login", for: .normal)
            loginLabel.text = "New User? Create an account"
        }
    }
    
    
}

