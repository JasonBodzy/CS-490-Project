//
//  CameraView.swift
//  Philanthrofeed
//
//  Created by user209496 on 4/9/22.
//

import SwiftUI
import Parse

struct CameraView: View {
    @State var back = false
    @State var date: String = ""
    @State var time: String = ""
    @State var location: String = ""
    @State var description: String = ""
    @State var errorPosting = false
    @State var buttonClicked = false
    var body: some View {
        if !back {
        VStack {
            TextField("Date", text: $date)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 10)
            TextField("Time", text: $time)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 10)
            TextField("Location", text: $location)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 10)
            TextField("Description", text: $description)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 40)
                //.frame(height: 40)
            Button(action: {
                buttonClicked = true
                PostEvent(date: date, time: time, location: location, description: description)
            }) {
                PostButtonContent()
            }
            Button(action: {
                if !back {
                    back.toggle()
                }
            }) {
                Text("Back")
                    .font(.headline)
            }
            if (errorPosting && buttonClicked) {
                ErrorPostingText()
            } else if (!errorPosting && buttonClicked){
                SuccessPostingText()
            }
        }
        .padding()
    }
        else if back {
            FeedView()
        }
    }
    func PostEvent(date: String, time: String, location: String, description: String) {
        let post = PFObject(className: "Posts")
        
        post["date"] = date
        post["time"] = time
        post["location"] = location
        post["description"] = description
        
        post.saveInBackground { (success, error) in
            if success {
                errorPosting = false
            } else {
                errorPosting = true
            }
        }
    }
}

struct PostButtonContent: View {
    var body: some View {
        Text("POST")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.green)
            .cornerRadius(15.0)
    }
}

struct ErrorPostingText: View {
    var body: some View {
        Text("Oops! Something went wrong!")
            .font(.body)
            .fontWeight(.semibold)
            .foregroundColor(.red)
    }
}

struct SuccessPostingText: View {
    var body: some View {
        Text("Success!")
            .font(.body)
            .fontWeight(.semibold)
            .foregroundColor(.green)
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
