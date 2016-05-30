//
//  HandleData.swift
//  Swift - 通讯录
//
//  Created by lanou3g on 16/4/22.
//  Copyright © 2016年 蓝欧. All rights reserved.
//

import UIKit

class HandleData{//本身作为根类

    //无法访问的，静态的static，不可变的let，不可重新创建的private init
    static let shareInstence = HandleData()
    
    private init() {}
    //布局数组
    var array:Array<Model>?
//    var array : Array<String>?
//    var dataDict:Dictionary<String,Model>?
    
}
