//
//  FeedView.swift
//  Philanthrofeed
//
//  Created by user209496 on 4/9/22.
//

import SwiftUI
import Parse

struct FeedView: View {
    var body: some View {
        NavBar()
    }
}

struct NavBar: View {
    @State var logout = false
    @State var post = false
    var body: some View {
        if !logout && !post {
        NavigationView {
            PostsView()
                .navigationTitle("Philanthrofeed")
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            if !logout && !post {
                                post.toggle()
                            }
                            //CameraView()
                        }) {
                            Text("Post")
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            if !logout && !post {
                                logout.toggle()
                                PFUser.logOut()
                            }
                            //logout.toggle()
                            //PFUser.logOut()
                        }) {
                            Text("Logout")
                        }
                    }
                })
        }
    }
        else if logout {
            ContentView()
        }
        else if post {
            CameraView()
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
