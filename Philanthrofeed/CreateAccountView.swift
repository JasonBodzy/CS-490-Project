//
//  CreateAccountView.swift
//  Philanthrofeed
//
//  Created by Jason Bodzy on 4/7/22.
//

import SwiftUI
import Parse

struct CreateAccountView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var feed = false
    @State var err = false
    var body: some View {
        if (!feed) {
            VStack {
                CreateText()
                TextField("Username", text: $username)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                TextField("Password", text: $password)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                Button(action: {
                    print("Button tapped")
                    CreateAccount(username: username, password: password)
                    
                }) {
                    CreateAccountButtonContent()
                }
                if (err) {
                    ErrText()
                }
            }
            .padding()
        } else {
            FeedView()
        }
        
    }
    
    func CreateAccount(username: String, password: String) {
        print("Create account")
        
        let user = PFUser()
                
        user.username = username
        user.password = password
        
        user.signUpInBackground { (success, error) in
            if success {
                print("User created")
                feed = true
            } else {
                print("ERROR: \(error?.localizedDescription ?? "Unknown Error")")
                err = true
            }
        }
        
    }
}



struct CreateText: View {
    var body: some View {
        Text("Create Account")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

struct CreateAccountButtonContent: View {
    var body: some View {
        Text("CREATE ACCOUNT")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.red)
            .cornerRadius(15.0)
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
