//
//  CustomTableViewCell.swift
//  Hotel
//
//  Created by Радмир Тельман on 09.01.2024.
//

import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {
    
    let mainImageView = UIImageView()
    let checkmarkImageView = UIImageView()
    let needLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(mainImageView)
        mainImageView.contentMode = .scaleAspectFit
        
        contentView.addSubview(checkmarkImageView)
        checkmarkImageView.contentMode = .scaleAspectFit
        
        contentView.addSubview(needLabel)
        needLabel.textColor = .gray
        
        mainImageView.snp.makeConstraints { make in
            make.left.equalTo(contentView.snp.left).offset(16)
            make.centerY.equalTo(contentView.snp.centerY)
            make.width.height.equalTo(24)
        }
        
        textLabel?.snp.makeConstraints { make in
            make.left.equalTo(mainImageView.snp.right).offset(16)
            make.top.equalToSuperview().offset(8)
        }
        
        needLabel.snp.makeConstraints { make in
            make.left.equalTo(mainImageView.snp.right).offset(16)
            make.top.equalTo(textLabel!.snp.bottom).offset(4)
            make.right.lessThanOrEqualTo(checkmarkImageView.snp.left).offset(-16)
        }
        
        checkmarkImageView.snp.makeConstraints { make in
            make.right.equalTo(contentView.snp.right).offset(-16)
            make.centerY.equalTo(mainImageView.snp.centerY)
            make.width.height.equalTo(24)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureWith(option: Option) {
        mainImageView.image = option.mainIcon
        textLabel?.text = option.title
        needLabel.text = option.subtitle
        checkmarkImageView.image = UIImage(named: option.iconName)
    }
}
