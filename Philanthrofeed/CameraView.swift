//
//  CameraView.swift
//  Philanthrofeed
//
//  Created by user209496 on 4/9/22.
//

import SwiftUI
import Parse

struct CameraView: View {
    @State var date: String = ""
    @State var time: String = ""
    @State var location: String = ""
    @State var description: String = ""
    var body: some View {
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
                print("post")
            }) {
                PostButtonContent()
            }
        }
        .padding()
    }
    func PostEvent(date: String, time: String, location: String, description: String) {
        
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

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
