//
//  DetailViewController.swift
//  Swift - 通讯录
//
//  Created by lanou3g on 16/4/22.
//  Copyright © 2016年 蓝欧. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
//model属性
    var model :Model?
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var phone: UITextField!
    
    @IBOutlet weak var age: UITextField!
    
    @IBOutlet weak var gender: UITextField!
    
    
    @IBAction func OKAction(sender: AnyObject) {
        
        self.navigationController?.popViewControllerAnimated(true)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//隐藏默认的返回按钮
        self.navigationItem.hidesBackButton = true
            self.name.text = self.model?.name!
        self.gender.text = self.model?.gender!
        self.phone.text = self.model?.phone!
        self.age.text = String(self.model!.age!)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
