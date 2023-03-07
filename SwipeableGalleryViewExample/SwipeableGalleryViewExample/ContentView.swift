//
//  ContentView.swift
//  SwipeableGalleryViewExample
//
//  Created by Max on 07/03/2023.
//

import SwiftUI
import SwipeableGalleryView

struct ContentView: View {
    @State var imageResources: [String]
    @State var asyncImageURLs: [URL]
    
    var body: some View {
        TabView {
            ImageTab(imageResources: imageResources)
                .tabItem {
                    Text("Image")
                }
            AsyncImageTab(asyncImageURLs: asyncImageURLs)
                .tabItem {
                    Text("Async image")
                }
        }
        
    }
}

struct ImageTab: View {
    @State var imageResources: [String] = []
    
    var body: some View {
        SwipeableGalleryView(
            imageComponents: imageResources,
            initialIndex: 0,
            onImageSwiped: { newIndex in
                print("Now showing image at index \(newIndex)")
            }
        ) { imageName in
            Image(imageName).resizable()
        }
    }
}

struct AsyncImageTab: View {
    @State var asyncImageURLs: [URL]
    
    var body: some View {
        SwipeableGalleryView(
            imageComponents: asyncImageURLs,
            initialIndex: 0,
            onImageSwiped: { newIndex in
                print("Now showing async image at index \(newIndex)")
            }) { imageURL in
                AsyncImage(url: imageURL) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            imageResources: ["1", "2", "3", "4"],
            asyncImageURLs: [
                "https://fastly.picsum.photos/id/69/700/800.jpg?hmac=OK9BmFHVPezRMwQBmVfJitQhKh-Z5aJujergmqiSqfE",
                "https://fastly.picsum.photos/id/549/700/800.jpg?hmac=La6i_PhTPDEjI80vZff4HnA7MT8o9O45SROoxkdADRs",
                "https://fastly.picsum.photos/id/390/700/800.jpg?hmac=MUGmPXZa8eYB8h9NaP8RsP-OMjKXskOXfQ3lMHZNZA0",
                "https://fastly.picsum.photos/id/48/700/800.jpg?hmac=R1FjEsjRQikz2PNTnUTNENwOAure9ETC1tbQMBz0AzI"
            ].map { URL(string: $0)! }
        )
    }
}
