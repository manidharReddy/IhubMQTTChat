//
//  ViewController.swift
//  IhubMQTTChat
//
//  Created by ihub on 02/02/18.
//  Copyright © 2018 ecoihub. All rights reserved.
//

import UIKit
import MaterialComponents
import Firebase
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //let testMQTT = IHUBMQTTClient()
        //testMQTT.testSwiftSubscribe()
        
        view.backgroundColor =  AppColor.init().appColor
    }
    override func viewDidAppear(_ animated: Bool) {
        let activityIndicator = MDCActivityIndicator(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        if let userRequest = UserDefaults.standard.dictionary(forKey: APICONSTANTS.UserDefaultsKeys.userLoginRequest){
            if let email = userRequest[APICONSTANTS.LoginRequestKeys.userId],let password = userRequest[APICONSTANTS.LoginRequestKeys.password]{
                UserManager.loginUser(email: email as! String, password: password as! String){
                    (loginresult,error) in
                    if error == nil{
                    if let result = loginresult as? IHUBLoginResponse{
                          print("UserName:\(result.name!)")
                        FirebaseManager.createUserWithEmail(withEmail: email as! String, password:password as! String , completionHandler: { (user, error) in
                            if let err = error{
                                let usererror = FirebaseApiError.authErrors(error: err as AnyObject)
                                print("usererror:\(usererror)")
                            }else if let userr = user{
                                print("userr:\(userr)")
                            }
                        })
                        
                        activityIndicator.stopAnimating()
                        //self.pushTo(viewController: .ChatVC)
                        self.pushTo(viewController: .IHUBTabBarController)
                    }else if let msg = loginresult as? APIErrorMessage{
                       print("ErrorMessage:\(msg)")
                        activityIndicator.stopAnimating()
                        self.pushTo(viewController:.IHUBLoginVC)
                    }
                    }else if error != nil,let msg = loginresult as? APIErrorMessage {
                        print("Error != nil :ErrorMessage:\(msg)")
                        activityIndicator.stopAnimating()
                        self.pushTo(viewController:.IHUBLoginVC)
                    }else if loginresult == nil{
                        print("Error Msg:\(String(describing: error))")
                        activityIndicator.stopAnimating()
                        
                        self.pushTo(viewController:.IHUBLoginVC)
                    }
                }
               
                //if isLogged == true{
                  //  pushTo(viewController:.IHUBLoginVC)
                //}
            }
        }else{
            activityIndicator.stopAnimating()
            pushTo(viewController: .IHUBLoginVC)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    //MARK: Push to relevant ViewController
    func pushTo(viewController: ViewControllerType)  {
        switch viewController {
        case .IHUBLoginVC:
           
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! IHUBLoginVC
            
            present(vc, animated: true, completion: nil)
           
        
            
        case .ChatVC:
            let cht = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerIdentifiers.Chat.rawValue) as! ChatVC
            present(cht, animated: true, completion: nil)
            
        case .IHUBChatUsers:
            let chtusrs = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerIdentifiers.chatusers.rawValue) as! IHUBChatUsers
            present(chtusrs, animated: true, completion: nil)
        case .IHUBTabBarController:
            let tabcontroller = IHUBTabBarController(viewControllers: [IHUBChatMessageTableView()])
            present(tabcontroller, animated: true, completion: nil)
        
        }
        
    
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

