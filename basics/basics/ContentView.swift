//
//  ContentView.swift
//  basics
//
//  Created by Nishk Balsara on 2023-01-11.
//

import SwiftUI

struct ContentView: View {
    @State private var username = " "
    @State private var password = " "
    @State private var wrongUsername = 0
    @State private var wrongPasssword = 0
    @State private var showingLoginScreen = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                
                VStack{
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPasssword))
                    
                    Button("Login"){
                        authenticateUser(username: username, password: password)                    }
                    .foregroundColor(.white)
                    .frame(width:300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: Text("You are logged in @\(username)"), isActive: $showingLoginScreen){
                        EmptyView()
                    }
                }
            }
            .navigationBarHidden(true)
        }
        
        
    }
    func authenticateUser(username: String, password: String){
        if username.lowercased() == "nishkb"{
            wrongUsername = 0
            if password.lowercased() == "abc"{
                wrongPasssword = 0
                showingLoginScreen = true
            }else {
                wrongPasssword = 2
            }
        }else{
            wrongUsername = 2
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
