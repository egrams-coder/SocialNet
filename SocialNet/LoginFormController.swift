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
    
    func chek() {
        // Сверяем введенные данные
        let login = loginInput.text!
        let password = passwordInput.text!
        
        if login == "a" && password == "1" {
            print("успешная авторизация")
            presentSecondView()
        } else {
            print("Неверно указан логин или пароль")
            alertErrorLoginPassword()
            
        }
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
