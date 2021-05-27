//
//  UserCollectionViewCell.swift
//  HouzzDemo
//
//  Created by Tal talspektor on 27/05/2021.
//
//https://5fbe26735923c90016e6a962.mockapi.io/users?page=2&limit=10
import UIKit

class UserCollectionViewCell: UICollectionViewCell {

    static let identifier = "UserCollectionViewCell"
    static let nib = UINib(nibName: "UserCollectionViewCell", bundle: nil)

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!

    func configure(with user: User) {
        firstNameLabel.text = user.firstName
        lastNameLabel.text = user.lastName
        imageView.layer.cornerRadius = imageView.frame.height / 2
        ImageDataProvider.getImage(stringURL: user.url) { [weak self] image in
            self?.imageView.image = image
        }
    }

}
