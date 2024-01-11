//
//  CustomCollectionViewCell.swift
//  Hotel
//
//  Created by Радмир Тельман on 11.01.2024.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        imageView.frame = contentView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }.resume()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
}

