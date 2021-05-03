//
//  ViewController.swift
//  0503_completionBlock
//
//  Created by 손대홍 on 2021/05/03.
//

import UIKit
import KRProgressHUD

class ViewController: UIViewController {
    @IBOutlet weak var mainTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("ViewController - viewDidLoad() 호출됨")
        
        KRProgressHUD.show()
        mainTitle.text = "잠시만 기다려주세요."
        sayHi(completion: { result in
            print("컴플레션 블락으로 넘겨받음 : \(result)")
            
            KRProgressHUD.showSuccess()
            self.mainTitle.text = result
        })
    }


    fileprivate func sayHi(completion: @escaping(String) -> () ) {
        
        print("ViewController - sayHi() 호출됨")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0 ) {
            //print("하이")
            completion("안녕하세요!")
        }
    }
}

