//
//  ViewController.swift
//  customTableViewCell
//
//  Created by 9188 on 2017/8/30.
//  Copyright © 2017年 zth. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        view.addSubview(tableView)
        //
//        tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    lazy var tableView : UITableView = {
        let tempTabelView = UITableView(frame: CGRect(x: 0, y: 60, width: self.view.frame.size.width, height: self.view.frame.size.height))
        tempTabelView.delegate = self
        tempTabelView.dataSource = self
        return tempTabelView
    }()
    
    // MARK:- UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1.提供类方法创建cell，默认就是复用好的了
        let cell = HCustomTableViewCell.customCell(tableView: tableView)
        // 2.设置数据（开发中传递model）
        cell.settingCellData(title: "当前是第：\(indexPath.row)行")
        // 3.事件传递（将封装cell内部子控件的点击事件回调控制器）
        cell.btnClickBlock = { () in
            print("点击了按钮，当前是第：\(indexPath.row)行 ，且事件传递到了控制器内");
        }
        // 4. 返回cell。 这基本上能适用100%任何一个你需要的自定义cell的类型
        return cell
    }
    
    // MARK:- UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

