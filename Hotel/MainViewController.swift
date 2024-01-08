//
//  MainViewController.swift
//  Hotel
//
//  Created by Радмир Тельман on 07.01.2024.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {

    // MARK: - UI
    
    private lazy var firstView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.white.uiColor
        view.layer.cornerRadius = 12
        return view
    }()
    
    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Отель"
        label.textColor = AppColor.black.uiColor
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    private lazy var mainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.main.uiImage
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var gradeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.oc.uiImage
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Steigenberger Makadi"
        label.textColor = AppColor.black.uiColor
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Madinat Makadi, Safaga Road, Makadi Bay, Египет"
        label.textColor = AppColor.blue.uiColor
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "от 134 673 ₽"
        label.textColor = AppColor.black.uiColor
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    private lazy var behindPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "за тур с перелётом"
        label.textColor = AppColor.lightGray.uiColor
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColor.background.uiColor
        
        setupViews()
        setupConstraints()
    }
    
    // MARK: - Action
    
    // MARK: - Setup Views
    
    private func setupViews() {
        [firstView,
         mainLabel,
         mainImage,
         gradeImage,
         nameLabel,
         locationLabel,
         priceLabel,
         behindPriceLabel,
        ].forEach() {
            view.addSubview($0)
        }
    }
    
    // MARK: - Setup Constraints
    
    private func setupConstraints() {
        firstView.snp.makeConstraints() { make in
            make.top.equalToSuperview().offset(0)
            make.leading.trailing.equalToSuperview().offset(0)
            make.height.equalTo(560)
        }
        
        mainLabel.snp.makeConstraints() { make in
            make.top.equalTo(firstView.snp.top).offset(63)
            make.centerX.equalTo(firstView.snp.centerX)
        }
        
        mainImage.snp.makeConstraints() { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(32)
            make.leading.equalTo(firstView.snp.leading).offset(16)
            make.trailing.equalTo(firstView.snp.trailing).offset(-16)
        }
        
        gradeImage.snp.makeConstraints() { make in
            make.top.equalTo(mainImage.snp.bottom).offset(32)
            make.leading.equalTo(firstView.snp.leading).offset(16)
        }
        
        nameLabel.snp.makeConstraints() { make in
            make.top.equalTo(gradeImage.snp.bottom).offset(16)
            make.leading.equalTo(firstView.snp.leading).offset(16)
        }
        
        locationLabel.snp.makeConstraints() { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.leading.equalTo(firstView.snp.leading).offset(16)
        }
        
        priceLabel.snp.makeConstraints() { make in
            make.top.equalTo(locationLabel.snp.bottom).offset(16)
            make.leading.equalTo(firstView.snp.leading).offset(16)
        }
        
        behindPriceLabel.snp.makeConstraints() { make in
            make.top.equalTo(locationLabel.snp.bottom).offset(30)
            make.leading.equalTo(priceLabel.snp.trailing).offset(8)
        }
    }
}
