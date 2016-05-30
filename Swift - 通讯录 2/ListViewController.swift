//
//  ListViewController.swift
//  Swift - 通讯录
//
//  Created by lanou3g on 16/4/22.
//  Copyright © 2016年 蓝欧. All rights reserved.
//

import UIKit

//重用标识符
//私有的：private 代替static【不被其他类访问，防止不同类之间的标识符混乱】let 不可变
private let reuselIdentifier = "ContactViewCell"

class ListViewController: UITableViewController {

    //单例
    var data = HandleData.shareInstence
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        //获取文件路径
//        let path = NSBundle .mainBundle().pathForResource("contact.plist", ofType: nil)
//        //获取文件数据
//        let  allData = NSData(contentsOfFile: path!)
//
//       //解析数据？？？
        
        
        //编辑按钮
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
//        let button = UIButton(frame:CGRectMake(0,0,18,18))
//        button.setTitle("add", forState: .Normal)
//        button.addTarget(self, action: Selector("tapped"), forControlEvents: .TouchUpInside)
//        let barButton = UIBarButtonItem(customView: button)
//        
//        self.navigationItem.leftBarButtonItem = barButton
        
        

        //人为创建数据
        let c1 = Model.init(name: "马泽坤", age: 20, gender: "男", phone: "1111111111")
        let c2 = Model.init(name: "陈春丽", age: 20, gender: "女", phone: "2222222222")
        let c3 = Model.init(name: "潘腾龙", age: 20, gender: "男", phone: "3333333333")
        let c4 = Model.init(name: "刘延秋", age: 20, gender: "男", phone: "4444444444")
        let c5 = Model.init(name: "李佳琳", age: 20, gender: "女", phone: "5555555555")
        let c6 = Model.init(name: "王博然", age: 20, gender: "男", phone: "6666666666")
        
        self.data.array = [c1,c2,c3,c4,c5,c6]
        
//         self.tableView.registerClass(ContactViewCell.self, forCellReuseIdentifier: reuselIdentifier)
        
        
        
    }
// 添加方法
//    func tapped() {
//        let detailVC = DetailViewController()
//        self.navigationController?.pushViewController(detailVC, animated: true)
//        
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return (self.data.array?.count)!
    }

    /* */
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuselIdentifier, forIndexPath: indexPath)
            as! ContactViewCell

        let model = self.data.array![indexPath.row]
        cell.model = model
        
        return cell
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }

    /*能否编辑*/
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {

        return true
    }
    //编辑样式
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        if indexPath.row < 4 {
            return .Delete
        }else{
            return .Insert
        }
    }

    /*编辑*/
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            //操作数据
            self.data.array?.removeAtIndex(indexPath.row)
            
            // 操作UI
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        } else if editingStyle == .Insert {
           //添加数据
              let c7 = Model.init(name: "郝文举", age: 20, gender: "男", phone: "7777777777")
            //操作数据
            self.data.array?.append(c7)
            //操作UI
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    

    /*移动 */
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        //获得要移动的model
        let model = self.data.array![fromIndexPath.row]
        //删除原位置
        self.data.array?.removeAtIndex(fromIndexPath.row)
        //添加到新位置上
        self.data.array?.insert(model, atIndex: toIndexPath.row)

    }
   

    /*能否移动*/
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    /**/
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detailVC = segue.destinationViewController as! DetailViewController
        
        let cell = sender as! ContactViewCell
        //获取cell的位置
        let indexPath = self.tableView.indexPathForCell(cell)
        //根据cell所在的位置获得对应的model
        detailVC.model = self.data.array![(indexPath?.row)!]
        
        
        
        
    }
    

}
