//
//  HCustomTableViewCell.swift
//  customTableViewCell
//
//  Created by 9188 on 2017/8/30.
//  Copyright © 2017年 zth. All rights reserved.
//

import UIKit

class HCustomTableViewCell: UITableViewCell {
    
    // 格式( （参数）-> (返回值) )
    public var btnClickBlock:( ()->() )?

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    // MARK:- init
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(actionBtn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- public
    public class func customCell(tableView : UITableView)->HCustomTableViewCell{
        let reuseIdentifier = "HCustomTableViewCell";
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
        if (cell == nil) {
            cell = HCustomTableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
        }
        return cell as! HCustomTableViewCell
    }
    
    public func settingCellData(title : String) {
        titleLabel.text = title
    }
    
    // MARK:- private
    
    override func layoutSubviews() {
         super.layoutSubviews()
         titleLabel.frame = CGRect(x: 20, y: 10, width: 160, height: 20)
         actionBtn.frame = CGRect(x: 210, y: 5, width: 90, height: 30)
    }
    
    @objc private func actionBtnClick(){
        btnClickBlock!()
    }
    
    // MARK:- lazy
    lazy var titleLabel: UILabel = {
        let tempTitleLabel = UILabel()
        tempTitleLabel.textColor = UIColor.black
        return tempTitleLabel;
    }()
    
    lazy var actionBtn: UIButton = {
        let tempActionBtn = UIButton()
        tempActionBtn.backgroundColor = UIColor.cyan
        tempActionBtn.setTitle("点击下按钮", for: .normal)
        tempActionBtn.addTarget(self, action: #selector(actionBtnClick), for: .touchUpInside)
        return tempActionBtn;
    }()
    
}
