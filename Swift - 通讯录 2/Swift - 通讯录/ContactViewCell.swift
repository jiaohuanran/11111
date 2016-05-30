//
//  ContactViewCell.swift
//  Swift - 通讯录
//
//  Created by lanou3g on 16/4/22.
//  Copyright © 2016年 蓝欧. All rights reserved.
//

import UIKit

class ContactViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var phone: UILabel!
    
    
    var model:Model? {
    
        set{
            //计算
            self.name.text = newValue?.name
            self.phone.text = newValue?.phone
            
        }
        get{
            //返回空值
            return nil
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
