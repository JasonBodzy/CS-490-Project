//
//  ContentView.swift
//  Philanthrofeed
//
//  Created by Jason Bodzy on 3/30/22.
//
// If you tapp on the Login text it transitions to login screen
import SwiftUI

struct ContentView: View {
    @State var tapped = false
    var body: some View {
        ZStack {
            if !tapped {
                Text("Login")
                    .padding()
            } else {
                LoginView()
            }
        }
        .onTapGesture {
            withAnimation{
                if (!tapped) {
                    tapped.toggle()
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
