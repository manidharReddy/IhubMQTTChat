//
//  IHUBLoginVC.swift
//  IhubMQTTChat
//
//  Created by ihub on 06/02/18.
//  Copyright © 2018 ecoihub. All rights reserved.
//

import UIKit
import Material
import Alamofire
import ObjectMapper
import MaterialComponents
class IHUBLoginVC: UIViewController {
    fileprivate var emailField: ErrorTextField!
    fileprivate var passwordField: TextField!
    
    //A constant to layout the textfeilds.
    fileprivate let constant: CGFloat = 32
    override func viewDidLoad() {
        super.viewDidLoad()
        preparePasswordField()
        prepareEmailTextField()
        prepareResignResponderButton()
view.backgroundColor =  AppColor.init().appColor
        // Do any additional setup after loading the view.
    }
    fileprivate func prepareResignResponderButton(){
        let btn = RaisedButton(title: "Sign", titleColor: Color.white)
        
        btn.addTarget(self, action: #selector(handleResignResponderButton), for: .touchUpInside)
        //view.layout(btn).width(100).height(constant).top(40).right(20)
        btn.backgroundColor = Color.blue.base
        view.layout(btn).center(offsetY: passwordField.bounds.height + 10).left(20).right(20)
    }
    
    /// Handle the resign responder button.
    @objc
    internal func handleResignResponderButton(button: UIButton) {
        emailField?.resignFirstResponder()
        passwordField?.resignFirstResponder()
        
        let activity:MDCActivityIndicator = MDCActivityIndicator()
        
        activity.setIndicatorMode(.indeterminate, animated: true)
        activity.strokeWidth = 2.0
        activity.startAnimating()
        if let email = emailField.text,let password = passwordField.text{
            UserManager.loginUser(email: email, password: password){
                (loginresult,error) in
                if error == nil{
                    if let result = loginresult as? IHUBLoginResponse{
                        print("UserName:\(result.name!)")
                        activity.stopAnimating()
                       //self.pushTo(viewController: .ChatVC)
                         //self.pushTo(viewController: .IHUBTabBarController)
                    }else if let msg = loginresult as? APIErrorMessage{
                        print("ErrorMessage:\(msg)")
                        activity.stopAnimating()
                       // self.pushTo(viewController:.IHUBLoginVC)
                    }
                }else if error != nil,let msg = loginresult as? APIErrorMessage {
                    print("Error != nil :ErrorMessage:\(msg)")
                    activity.stopAnimating()
                    //self.pushTo(viewController:.IHUBLoginVC)
                }else if loginresult == nil{
                    print("Error Msg:\(String(describing: error))")
                    activity.stopAnimating()
                }
            }
           // print("statusCode:\(isLogged.response?.statusCode)")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension IHUBLoginVC{
    fileprivate func prepareEmailTextField(){
        emailField = ErrorTextField()
        emailField.placeholder = "Email"
        emailField.detail = "Error, Incorrect Email"
        emailField.isClearIconButtonEnabled = true
        emailField.delegate = self
        emailField.isPlaceholderUppercasedWhenEditing = true
        //emailField.placeholderAnimation = .hidden
        
        let leftView = UIImageView()
        leftView.image = UIImage(named: "ic_person_36pt")?.withRenderingMode(.alwaysTemplate)
        //leftView.image = Icon.cm.audio
        
        emailField.leftView = leftView
        
        view.layout(emailField).center(offsetY: -passwordField.bounds.height - 60).left(20).right(20)
    }
    
    fileprivate func preparePasswordField() {
        passwordField = TextField()
        passwordField.placeholder = "Password"
        passwordField.detail = "At least 8 characters"
        passwordField.clearButtonMode = .whileEditing
        passwordField.isVisibilityIconButtonEnabled = true
        let leftView = UIImageView()
        leftView.image = UIImage(named: "ic_lock_36pt")?.withRenderingMode(.alwaysTemplate)
        //leftView.image = Icon.cm.audio
        
        passwordField.leftView = leftView
        
        // Setting the visibilityIconButton color.
        passwordField.visibilityIconButton?.tintColor = Color.green.base.withAlphaComponent(passwordField.isSecureTextEntry ? 0.38 : 0.54)
        
        view.layout(passwordField).center().left(20).right(20)
    }
}
extension IHUBLoginVC: TextFieldDelegate {
    public func textFieldDidEndEditing(_ textField: UITextField) {
        (textField as? ErrorTextField)?.isErrorRevealed = false
    }
    
    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        (textField as? ErrorTextField)?.isErrorRevealed = false
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        (textField as? ErrorTextField)?.isErrorRevealed = true
        return true
    }
}
