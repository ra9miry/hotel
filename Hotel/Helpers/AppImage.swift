//
//  AppImage.swift
//  Hotel
//
//  Created by Радмир Тельман on 07.01.2024.
//

import UIKit

protocol AppImageProtocol {
    var rawValue: String { get }
}

extension AppImageProtocol {

    var uiImage: UIImage? {
        guard let image = UIImage(named: rawValue) else {
            fatalError("Could not find image with name \(rawValue)")
        }
        return image
    }
    
    var systemImage: UIImage? {
        guard let image = UIImage(systemName: rawValue) else {
            fatalError("Could not find image with name \(rawValue)")
        }
        return image
    }
    
}

enum AppImage: String, AppImageProtocol {
    case main
    case oc
    case back
    case first
    case second
    case third
    
    var uiImage: UIImage? {
        return UIImage(named: self.rawValue)
    }
}
