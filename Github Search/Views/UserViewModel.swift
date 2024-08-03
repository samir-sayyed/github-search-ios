//
//  UserViewModel.swift
//  Github Search
//
//  Created by Samir Sayyed on 03/08/24.
//

import Foundation

@MainActor
final class UserViewModel: ObservableObject{
    
    @Published var user : [UserModel]?
    @Published var isLoading: Bool = false
    @Published var shouldShowError: Bool = false
    
    func getUser() async {
        isLoading = true
        do{
            let data = try await WebService.getUsers()
            user = data
            isLoading = false
        }catch {
            print("Error")
            isLoading = false
            shouldShowError = true
        }
    }
    
}
