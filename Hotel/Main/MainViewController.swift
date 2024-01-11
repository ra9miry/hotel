//
//  MainViewController.swift
//  Hotel
//
//  Created by Радмир Тельман on 07.01.2024.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - UI
    
    private var tableView: UITableView!
    private let options: [Option] = [
        Option(mainIcon: AppImage.first.uiImage, title: "Удобства", subtitle: "Самое необходимое",need: "Самое необходимое" ,iconName: "back"),
        Option(mainIcon: AppImage.second.uiImage, title: "Что включено", subtitle: "Самое необходимое",need: "Самое необходимое" ,iconName: "back"),
        Option(mainIcon: AppImage.third.uiImage, title: "Что не включено", subtitle: "Самое необходимое", need: "Самое необходимое" ,iconName: "back")
    ]
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var firstView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.white.uiColor
        view.layer.cornerRadius = 12
        return view
    }()
    
    private lazy var secondView: UIView = {
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
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
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
        label.textColor = AppColor.gray.uiColor
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private lazy var aboutHotelLabel: UILabel = {
        let label = UILabel()
        label.text = "Об отеле"
        label.textColor = AppColor.black.uiColor
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        return label
    }()
    
    private lazy var lineLabel: UILabel = {
        let label = UILabel()
        label.text = "3-я линия"
        label.textColor = AppColor.gray.uiColor
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.backgroundColor = AppColor.lightG.uiColor
        label.textAlignment = .center
        label.layer.cornerRadius = 8
        label.clipsToBounds = true
        return label
    }()

    private lazy var wifiLabel: UILabel = {
        let label = UILabel()
        label.text = "Платный Wi-Fi в фойе"
        label.textColor = AppColor.gray.uiColor
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.backgroundColor = AppColor.lightG.uiColor
        label.textAlignment = .center
        label.layer.cornerRadius = 8
        label.clipsToBounds = true
        return label
    }()

    private lazy var distanceToAirportLabel: UILabel = {
        let label = UILabel()
        label.text = "30 км до аэропорта"
        label.textColor = AppColor.gray.uiColor
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.backgroundColor = AppColor.lightG.uiColor
        label.textAlignment = .center
        label.layer.cornerRadius = 8
        label.clipsToBounds = true
        return label
    }()

    private lazy var distanceToBeachLabel: UILabel = {
        let label = UILabel()
        label.text = "1 км до пляжа"
        label.textColor = AppColor.gray.uiColor
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.backgroundColor = AppColor.lightG.uiColor
        label.textAlignment = .center
        label.layer.cornerRadius = 8
        label.clipsToBounds = true
        return label
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var thirdView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.white.uiColor
        view.layer.cornerRadius = 12
        return view
    }()
    
    private lazy var choiceButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(AppColor.white.uiColor, for: .normal)
        button.layer.cornerRadius = 15
        button.backgroundColor = AppColor.blue.uiColor
        button.setTitle("К выбору номера", for: .normal)
        button.addTarget(self, action: #selector(handleChoiceButtonPress), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColor.background.uiColor
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        setupTableView()
        setupViews()
        setupConstraints()
    }
    
    // MARK: - Action
    
    @objc private func handleChoiceButtonPress() {
        let controller = hotelNumberViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    // MARK: - Table View
    
    private func setupTableView() {
        tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomCell")
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: CGFloat.leastNormalMagnitude))
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: CGFloat.leastNormalMagnitude))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isScrollEnabled = false
        tableView.layer.cornerRadius = 12
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell
        let option = options[indexPath.row]
        cell.configureWith(option: option)
        cell.backgroundColor = AppColor.background.uiColor
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    // MARK: - Setup Views
    
    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(firstView)
        contentView.addSubview(secondView)
        contentView.addSubview(mainLabel)
        contentView.addSubview(mainImage)
        contentView.addSubview(gradeImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(locationLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(behindPriceLabel)
        contentView.addSubview(aboutHotelLabel)
        contentView.addSubview(lineLabel)
        contentView.addSubview(wifiLabel)
        contentView.addSubview(distanceToAirportLabel)
        contentView.addSubview(distanceToBeachLabel)
        contentView.addSubview(textLabel)
        contentView.addSubview(tableView)
        contentView.addSubview(thirdView)
        contentView.addSubview(choiceButton)
    }
    
    // MARK: - Setup Constraints
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.greaterThanOrEqualToSuperview()
            make.bottom.equalTo(choiceButton.snp.bottom).offset(20)
        }
        
        firstView.snp.makeConstraints() { make in
            make.top.equalTo(scrollView.snp.top).offset(0)
            make.leading.trailing.equalToSuperview().offset(0)
            make.height.equalTo(560)
        }
        
        mainLabel.snp.makeConstraints() { make in
            make.top.equalTo(firstView.snp.top).offset(50)
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
        
        secondView.snp.makeConstraints() { make in
            make.top.equalTo(firstView.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().offset(0)
            make.height.equalTo(430)
        }
        
        aboutHotelLabel.snp.makeConstraints() { make in
            make.top.equalTo(secondView.snp.top).offset(16)
            make.leading.equalTo(secondView.snp.leading).offset(16)
        }
        
        lineLabel.snp.makeConstraints() { make in
            make.top.equalTo(aboutHotelLabel.snp.bottom).offset(20)
            make.leading.equalTo(secondView.snp.leading).offset(16)
        }
        
        wifiLabel.snp.makeConstraints() { make in
            make.top.equalTo(aboutHotelLabel.snp.bottom).offset(20)
            make.leading.equalTo(lineLabel.snp.trailing).offset(16)
        }
        
        distanceToAirportLabel.snp.makeConstraints() { make in
            make.top.equalTo(lineLabel.snp.bottom).offset(18)
            make.leading.equalTo(secondView.snp.leading).offset(16)
        }
        
        distanceToBeachLabel.snp.makeConstraints() { make in
            make.top.equalTo(wifiLabel.snp.bottom).offset(18)
            make.leading.equalTo(distanceToAirportLabel.snp.trailing).offset(16)
        }
        
        textLabel.snp.makeConstraints() { make in
            make.top.equalTo(distanceToBeachLabel.snp.bottom).offset(12)
            make.leading.equalTo(secondView.snp.leading).offset(16)
            make.trailing.equalTo(secondView.snp.trailing).offset(-16)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(textLabel.snp.bottom).offset(16)
            make.leading.equalTo(secondView.snp.leading).offset(16)
            make.trailing.equalTo(secondView.snp.trailing).offset(-16)
            make.bottom.equalTo(thirdView.snp.top).offset(-16)
            make.height.equalTo(180)
        }
        
        thirdView.snp.makeConstraints() { make in
            make.top.equalTo(secondView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().offset(0)
            make.height.equalTo(120)
        }
        
        choiceButton.snp.makeConstraints() { make in
            make.top.equalTo(thirdView.snp.top).offset(12)
            make.leading.equalTo(thirdView.snp.leading).offset(16)
            make.trailing.equalTo(thirdView.snp.trailing).offset(-16)
            make.height.equalTo(48)
        }
    }
}
