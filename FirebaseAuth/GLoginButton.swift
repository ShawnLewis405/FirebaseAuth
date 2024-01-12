//
//  GLoginButton.swift
//  FirebaseAuthDemo
//
//  Created by Mac$hawn on 1/12/24.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

class GLoginButton: GIDSignInButton {
    
    private var signInButton = GIDSignInButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
            // custom code
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureGoogleSignButton() {
        
    }
    
}
