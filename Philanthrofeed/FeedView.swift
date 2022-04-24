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
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
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
    @State var posts = [PFObject]()
    var body: some View {
        ScrollView {
            Button(action: {
                loadPosts();
                print(posts)
                print(posts.count)
            }) {
                Text("Reload")
            }
            VStack(spacing: 20) {

                ForEach(0..<20) {
                    if (posts.count > 0 && $0 < posts.count) {
                        let post = posts[$0]
                        let date = post["date"] as! String
                        let time = post["time"] as! String
                        let location = post["location"] as! String
                        let description = post["description"] as! String
                        Text("\(date)\n\(time)\n\(location)\n\(description)")
                            .fontWeight(.light)
                            .foregroundColor(.red)
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                            .frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.width - 50)
                            .overlay(RoundedRectangle(cornerRadius: 36.0)
                                        .stroke()
                                        .fill(Color.red)
                            )
   
                    } else {
                        
                    }
                }
            }
        }
        .frame(height: UIScreen.main.bounds.height * 0.8)
        .onAppear(perform: loadPosts)
    }
    func loadPosts() {
        var numPosts = 20
        var posts = [PFObject]()
        let query = PFQuery(className: "Posts")
        query.includeKeys(["date", "time", "location", "description"])
        query.limit = 20
        query.findObjectsInBackground{ (loaded, error) in
            if loaded != nil {
                posts = loaded!
                self.posts = loaded!
                self.posts.reverse()
            }
        }
    }
}





struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
