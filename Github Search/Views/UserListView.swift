//
//  ContentView.swift
//  Github Search
//
//  Created by Samir Sayyed on 03/08/24.
//

import SwiftUI

struct UserListView: View {
    
    @ObservedObject var userViewModel =  UserViewModel()
    
    var body: some View {
        VStack {
            NavigationStack{
                ZStack{
                    List(userViewModel.user ?? [], id: \.id) { user in
                        HStack{
                            AsyncImage(url: URL(string : user.avatarURL ?? ""))
                            { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                            }placeholder: {
                                Circle()
                                    .foregroundColor(.teal)
                            }.frame(width: 80, height: 80)
                            
                            VStack (alignment: .leading){
                                Text(user.login?.capitalized ?? "")
                                    .font(.title2)
                                Text(user.url ?? "")
                                    .font(.subheadline)
                            }
                        }
                    }
                    if userViewModel.isLoading{
                        ProgressView()
                            .scaleEffect(2.0, anchor: .center)
                            .progressViewStyle(CircularProgressViewStyle(tint: .red))
                    }

                }
                .navigationTitle("Users")
            }
            
        }
        .task {
            await userViewModel.getUser()
            print($userViewModel.user)
        }
        .alert(isPresented: $userViewModel.shouldShowError, content: {
            return Alert(
                title: Text("Error"),
                message: Text("Something went wrong")
            )
        })
    }
}

#Preview {
    UserListView()
}
