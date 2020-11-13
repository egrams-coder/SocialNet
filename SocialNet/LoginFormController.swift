//
//  LoginFormController.swift
//  SocialNet
//
//  Created by Роман Евтюхин on 06.10.2020.
//

import UIKit

class LoginFormController: UIViewController {

    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var socNetLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passLabel: UILabel!
    @IBOutlet weak var viewLoad: UIView!
    @IBOutlet weak var loadCenterView: UIView!
    @IBOutlet weak var loadRightView: UIView!
    @IBOutlet weak var loadLeftView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        loginInput.delegate = self
        passwordInput.delegate = self
        
        // Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        
        // Присваиваем его UIScrollVIew
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Второе — когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        // скрываем тавигейшен бар на экране авторизации
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // Когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {
            
    // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
            
    // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
        }
        
    //Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
    // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }
    
    // При нажатии на экран клава исчезает
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }

    @IBAction func startButton(_ sender: Any) {
        chek()
    }
    
    // Сверяем введенные данные
    func chek() {
        
        let login = loginInput.text!
        let password = passwordInput.text!
        
        if login == "Admin" && password == "a" {
            self.animatedLoad()
            print("успешная авторизация")
        } else {
            print("Неверно указан логин или пароль")
            alertErrorLoginPassword()
            
        }
    }
    
    // Анимация при регистрации
    func animatedLoad()  {
        UIScrollView.animate(withDuration: 0.8, delay: 0, options: [], animations: {
            self.loginInput.center.x -= 300
            self.passwordInput.frame.origin.x += 300
            self.startButton.frame.origin.y += 300
            self.loginLabel.frame.origin.x -= 300
            self.socNetLabel.frame.origin.y -= 300
            self.passLabel.frame.origin.x += 300
        }, completion: {_ in
            self.viewLoad.isHidden = false
            
            UIView.animateKeyframes(withDuration: 0.8, delay: 0, options: [], animations: {
                
                UIView.modifyAnimations(withRepeatCount: 2, autoreverses: false, animations: {
                    
                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.16, animations: {
                        self.loadLeftView.alpha = 1
                    })
                    UIView.addKeyframe(withRelativeStartTime: 0.15, relativeDuration: 0.16, animations: {
                        self.loadCenterView.alpha = 1
                    })
                    UIView.addKeyframe(withRelativeStartTime: 0.45, relativeDuration: 0.16, animations: {
                        self.loadRightView.alpha = 1
                    })
                    UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.16, animations: {
                        self.loadLeftView.alpha = 0
                    })
                    UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.16, animations: {
                        self.loadCenterView.alpha = 0
                    })
                    UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.16, animations: {
                        self.loadRightView.alpha = 0
                    })
                })
            }, completion: {_ in
                self.presentSecondView()
            })
        })
    }
    
    // Переход с вью авторизации на новую вью
    func presentSecondView () {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TabViewController") as! TabViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        //self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // Сообщение об ошибке при авторизации
    func alertErrorLoginPassword () {
        
        let alert = UIAlertController(title: "Ошибка", message: "Неверно указан логин или пароль", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ввести еще раз", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

// при вводе логина переходит на ввод пароля
extension LoginFormController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginInput {
            passwordInput.becomeFirstResponder()
        } else {
            chek()
        }
        return true
    }
}


