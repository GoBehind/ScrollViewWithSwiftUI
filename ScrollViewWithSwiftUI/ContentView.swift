//
//  ContentView.swift
//  ScrollViewWithSwiftUI
//
//  Created by 王冠之 on 2020/10
//

import SwiftUI

struct ImageModel: Identifiable {
    let id: Int
    let imageView: String
}

struct ImageView: View {
    let postImages: ImageModel
    var body: some View {
        Image(postImages.imageView)
            .resizable()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
    }
}
struct ContentView: View {
    let images: [ImageModel] = [
        .init(id: 0, imageView: "1"),
        .init(id: 1, imageView: "2"),
        .init(id: 2, imageView: "3"),
    ]
    
    var body: some View {
        NavigationView {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(images, id: \.id) { post in
                        ForEach(0..<3) { _ in
                            ImageView(postImages: post)
                        }
                    }
                }
                Spacer()
            }.navigationBarTitle("Scroll View")
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
