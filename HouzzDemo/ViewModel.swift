//
//  ViewModel.swift
//  HouzzDemo
//
//  Created by Tal talspektor on 27/05/2021.
//

import Combine

class ViewModel {

    var cancellables = Set<AnyCancellable>()
    var users = PassthroughSubject<[User], Never>()
    private var fromIndex: Int?
    private var pageNumber = 1
    private let itemsPerCall = 10

    func fetchUsers() {
        APIUsersDataProvider.getUsers(pageNumber: pageNumber, itemsPerCall: itemsPerCall) { [weak self] result in
            switch result {
            case .success(let users):
                self?.users.send(users)
            case .failure(let error):
                print(error.localizedDescription)
            }
            self?.pageNumber += 1
        }
    }
}
