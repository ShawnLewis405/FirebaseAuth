//
//  ViewController.swift
//  FirebaseAuth
//
//  Created by Mac$hawn on 1/11/24.
//

import UIKit
import Firebase
import GoogleSignIn
import Firebase
import FirebaseAuth



class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            // Do any additional setup after loading the view.
        configureGoogleLoginButton()
    }
    
    
    
    @objc func userSignInPush() {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { authentication, error in
            if let error = error {
                print("There is an error signing the user in ==> \(error)")
                return
            }
            
            guard let user = authentication?.user, let idToken = user.idToken?.tokenString else { return }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                accessToken: user.accessToken.tokenString)
            
            Auth.auth().signIn(with: credential) { result, error in
                    // At this point, the user is signed in
                
                self.addChild(HomeViewController())
                self.view.addSubview(HomeViewController().view)
                
            }
            
                let name = user.profile?.name
                print(name)
        }
    }
    
    
    func configureGoogleLoginButton() {
        let signInButton = GIDSignInButton()
        view.addSubview(signInButton)
        signInButton.style = .wide
        signInButton.addTarget(self, action: #selector(userSignInPush), for: .touchUpInside)
        
            //add AutoLayout for the button
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
