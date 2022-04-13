//
//  FeedView.swift
//  Philanthrofeed
//
//  Created by user209496 on 4/9/22.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        NavBar()
    }
}

struct NavBar: View {
    var body: some View {
        NavigationView {
            PostsView()
                .navigationTitle("Philanthrofeed")
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            CameraView()
                        }) {
                            Image("camera icon")
                                .imageScale(.large)
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            ProfileView()
                        }) {
                            Image("profile icon")
                                .imageScale(.large)
                        }
                    }
                })
        }
    }
}

struct PostsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<10) {
                    Text("Item \($0)")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.width - 50)
                        .background(Color.green)
                    
                }
            }
        }
        .frame(height: UIScreen.main.bounds.height * 0.8)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
