//
//  WebService.swift
//  Github Search
//
//  Created by Samir Sayyed on 03/08/24.
//

import Foundation

final class WebService {
    
    static func getUsers() async throws -> [UserModel]{
        let urlString = "https://api.github.com/users"
        
        guard let url = URL(string: urlString) else {
            throw ErrorWrapper.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ErrorWrapper.invalidResponse
        }
        do{
            let decoder = JSONDecoder()
            return try decoder.decode([UserModel].self, from: data)
        } catch {
            throw ErrorWrapper.invalidData
        }
        
    }
    
}
