import SwiftUI

public struct SwipeableGalleryView<ImageComponent, Content>: View where ImageComponent: Hashable, Content: View {
  private let imageComponents: [ImageComponent]
  @ViewBuilder private let imageBuilder: (ImageComponent) -> Content
  @ViewBuilder private let onImageSwiped: (_ newIndex: Int) -> Void
  private let imagePadding: CGFloat

  @State private var offset: CGFloat = 0
  @State private var imageCounter: Int
  @State private var interactionStarted = false

  public init(imageComponents: [ImageComponent],
       initialIndex: Int,
       imagePadding: CGFloat = 5,
       onImageSwiped: @escaping (_ newIndex: Int) -> Void,
       @ViewBuilder imageBuilder: @escaping (ImageComponent) -> Content) {
    self.imageComponents = imageComponents
    self.imagePadding = imagePadding
    self.onImageSwiped = onImageSwiped
    self.imageBuilder = imageBuilder
    imageCounter = initialIndex
  }

  public var body: some View {
    GeometryReader { geometry in
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(alignment: .center, spacing: imagePadding) {
          ForEach(imageComponents, id: \.self) { component in
            imageBuilder(component)
              .aspectRatio(contentMode: .fit)
              .frame(width: geometry.size.width - imagePadding * 2)
          }
          .padding([.leading, .trailing], imagePadding)
        }
      }
      .content
      .offset(x: offset)
      .frame(width: geometry.size.width, alignment: .leading)
      .animation(interactionStarted ? .spring() : .none, value: offset)
      .gesture(
        DragGesture(minimumDistance: 20)
          .onChanged { value in
            interactionStarted = true
            offset = value.translation.width - CGFloat(imageCounter) * (geometry.size.width + imagePadding)
          }
          .onEnded { value in
            if abs(value.translation.width) > geometry.size.width * 0.1 {
              if value.translation.width < 0 && imageCounter < imageComponents.count - 1 {
                imageCounter += 1
              } else if value.translation.width > 0 && imageCounter > 0 {
                imageCounter -= 1
              }

              onImageSwiped(imageCounter)
            }

            withAnimation {
              centerOnCurrentImage(geometryWidth: geometry.size.width)
            }
          }
      )
      .onAppear {
        centerOnCurrentImage(geometryWidth: geometry.size.width)
      }
    }
  }

  func centerOnCurrentImage(geometryWidth: CGFloat) {
    offset = CGFloat(imageCounter) * -(geometryWidth + imagePadding)
  }
}
