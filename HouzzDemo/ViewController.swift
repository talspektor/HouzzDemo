//
//  ViewController.swift
//  HouzzDemo
//
//  Created by Tal talspektor on 27/05/2021.
//

import UIKit

class ViewController: UICollectionViewController {

    var viewModel = ViewModel()
    private var layout: UICollectionViewFlowLayout!
    private var users: [User] = [] {
        didSet {
            collectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(UserCollectionViewCell.nib, forCellWithReuseIdentifier: UserCollectionViewCell.identifier)
        setCollectionViewLayout()
        viewModel.fetchUsers()
        viewModel.users
            .receive(on: DispatchQueue.main)
            .sink { users in
                self.users.append(contentsOf: users)
        }.store(in: &viewModel.cancellables)
    }

    private func setCollectionViewLayout() {
        layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let itemWidth = UIScreen.main.bounds.width / 3 - 20
        layout.itemSize = CGSize(width: itemWidth, height: 72)
        collectionView.collectionViewLayout = layout
    }
}

extension ViewController {

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserCollectionViewCell.identifier, for: indexPath) as? UserCollectionViewCell else { return UICollectionViewCell() }
        cell.backgroundColor = .green
        cell.configure(with: users[indexPath.row])
        if indexPath.row == users.count - 1 {
            viewModel.fetchUsers()
        }
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}

