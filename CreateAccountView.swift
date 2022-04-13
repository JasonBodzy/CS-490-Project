//
//  CreateAccountView.swift
//  Philanthrofeed
//
//  Created by Rish Chaudhary on 4/6/22.
//

import SwiftUI
import Parse

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
struct LoginView: View {
    @State var username: String = ""
    @State var password: String = ""
    var body: some View {
        VStack {
            WelcomeText()
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
                LogUserIn(username: username, password: password)
                
            }) {
                LoginButtonContent()
            }
        }
        .padding()
    }
}

func LogUserIn(username: String, password: String) {
    PFUser.logInWithUsername(inBackground: username, password: password)
    { (user, error) in
        if user != nil {
            print("Logged in user: " + username)
        } else {
            print("Error: \(error?.localizedDescription)")
        }
        
    }
    
}

struct WelcomeText: View {
    var body: some View {
        Text("Welcome!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

struct LoginButtonContent: View {
    var body: some View {
        Text("LOGIN")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.green)
            .cornerRadius(15.0)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
