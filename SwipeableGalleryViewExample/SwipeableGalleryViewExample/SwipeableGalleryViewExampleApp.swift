//
//  SwipeableGalleryViewExampleApp.swift
//  SwipeableGalleryViewExample
//
//  Created by Max on 07/03/2023.
//

import SwiftUI

@main
struct SwipeableGalleryViewExampleApp: App {
    var body: some Scene {
        WindowGroup {
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
}
