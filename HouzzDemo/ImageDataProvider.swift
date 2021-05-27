//
//  ImageDataProvider.swift
//  HouzzDemo
//
//  Created by Tal talspektor on 27/05/2021.
//

import UIKit

enum ImageDataProvider {

    static func getImage(stringURL: String, complection: @escaping (UIImage) -> Void) {
        guard let url = URL(string: stringURL) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            guard let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                complection(image)
            }
        }.resume()
    }
}


