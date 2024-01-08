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
    
    // Инициализатор для создания элементов интерфейса ячейки
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Добавление и настройка основной иконки
        contentView.addSubview(mainImageView)
        mainImageView.contentMode = .scaleAspectFit
        mainImageView.snp.makeConstraints { make in
            make.left.equalTo(contentView.snp.left).offset(16)
            make.centerY.equalTo(contentView.snp.centerY)
            make.width.height.equalTo(24) // Размеры иконки
        }
        
        // Добавление и настройка checkmark иконки
        contentView.addSubview(checkmarkImageView)
        checkmarkImageView.contentMode = .scaleAspectFit
        checkmarkImageView.snp.makeConstraints { make in
            make.right.equalTo(contentView.snp.right).offset(-16)
            make.centerY.equalTo(contentView.snp.centerY)
            make.width.height.equalTo(24) // Размеры иконки
        }
        
        // Настройка вспомогательной текстовой метки
        guard let textLabel = textLabel else { return }
        contentView.addSubview(needLabel)
        needLabel.textColor = .gray
        needLabel.snp.makeConstraints { make in
            make.left.equalTo(mainImageView.snp.right).offset(16)
            make.right.lessThanOrEqualTo(checkmarkImageView.snp.left).offset(-16)
            make.top.equalTo(textLabel.snp.bottom).offset(4)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Метод для конфигурации ячейки данными
    func configureWith(option: Option) {
        mainImageView.image = option.mainIcon
        textLabel?.text = option.title
        needLabel.text = option.subtitle
        checkmarkImageView.image = UIImage(named: option.iconName)
        // Здесь вы можете добавить логику для отображения или скрытия checkmarkImageView в зависимости от данных
    }
}
