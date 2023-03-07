# SwipeableGalleryView
SwiftUI component for displaying a swipeable gallery of images.

<img src="SwipeableGalleryViewExample/sample.gif" width="286" height="540" />


## Installation

### Swift Package Manager
```Swift
.package(url: "https://github.com/rencevio/SwipeableGalleryView.git")
```

## Usage

### Import
```Swift 
import SwipeableCameraButton
```

### Examples

```Swift
SwipeableGalleryView(
  imageComponents: imageResources, 
  initialIndex: 0,
  imagePadding: 5,
  onImageSwiped: { newIndex in
    print ("Now showing image at index \(newIndex)")
  }) { imageResource in
      Image (imageResource).resizable()
     }
```
`imageComponents` is a generic parameter and represents an array of components from which each individual image is built.
Each component in `imageComponents` is provided as an argument to the `imageBuilder` closure.

Example of constructing a gallery of `AsyncImage`'s:
```Swift
let imageURLs = [
  URL(string: "www.some_image_hosting/1.png")!, 
  URL(string: "www.some_image_hosting/2.png")!,
  URL(string: "www.some_image_hosting/3.png")!,
  URL(string: "www.some_image_hosting/4.png")!
]

SwipeableGalleryView(
  imageComponents: imageURLs,
  initialIndex: 0,
  onImageSwiped: { newIndex in
    print ("Now showing image at index \(newIndex)")
  }) { imageURL in
      AsyncImage(url: imageURL) { image in
        image.resizable()
      } placeholder: {
        ProgressView()
      }
```
