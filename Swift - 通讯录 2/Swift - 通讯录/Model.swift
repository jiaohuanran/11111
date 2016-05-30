//
//  Model.swift
//  Swift - 通讯录
//
//  Created by lanou3g on 16/4/22.
//  Copyright © 2016年 蓝欧. All rights reserved.
//

import UIKit

class Model{//本身作为根类
    
    var name    :String?
    var age        :Int?
    var gender  :String?
    var phone    :String?
  
    //初始化方法
    init(name:String,age:Int,gender:String,phone:String){
        self.name     = name
        self.age        = age
        self.gender  = gender
        self.phone    = phone
      
    }
    
    
}
