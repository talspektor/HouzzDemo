//
//  APIUsersDataProvider.swift
//  HouzzDemo
//
//  Created by Tal talspektor on 27/05/2021.
//

import Foundation

enum APIUsersDataProvider {
    static let baseStringURL = "https://5fbe26735923c90016e6a962.mockapi.io/users"

    static func getUsers(pageNumber: Int, itemsPerCall: Int, completion: @escaping (Result<[User], Error>) -> Void) {
        let url = URL(string: "\(baseStringURL)?page=\(pageNumber)&limit=\(itemsPerCall)")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                completion(.success(users))
            } catch {
                print(error)
                completion(.failure(error))
            }
        }.resume()
    }
}


