//
//  ContentView.swift
//  Philanthrofeed
//
//  Created by Jason Bodzy on 3/30/22.
//
// If you tapp on the Login text it transitions to login screen
import SwiftUI
import Parse

struct ContentView: View {
    @State var login = false
    @State var create = false
    var body: some View {
        VStack {
            if !login && !create {
                Image("Philanthrofeed_Icon")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.size.width - 10, height: UIScreen.main.bounds.size.width - 50, alignment: .center)
                Text("Login")
                    .padding()
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.size.width / 3, height: UIScreen.main.bounds.size.height / 12, alignment: .center)
                    .background(.red)
                    .cornerRadius(12.0)
                    .onTapGesture {
                        print("Login!")
                        withAnimation{
                            if (!login && !create) {
                                login.toggle()
                            }
                        }
                    }

                Text("Create Account")
                    .padding()
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.size.width / 2, height: UIScreen.main.bounds.size.height / 12, alignment: .center)
                    .background(.red)
                    .cornerRadius(12.0)
                    .onTapGesture {
                        print("Create Acct.")
                        withAnimation{
                            if (!create && !login) {
                                create.toggle()
                            }
                        }
                    }

            } else if login {
                LoginView()
            } else if create {
                CreateAccountView()
            }
        }

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
