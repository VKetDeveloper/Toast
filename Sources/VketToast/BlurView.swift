import SwiftUI

#if canImport(UIKit)
import UIKit

public struct BlurView: UIViewRepresentable {
    public let style: UIBlurEffect.Style

    public init(style: UIBlurEffect.Style = .systemMaterial) {
        self.style = style
    }

    public func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }

    public func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}
#endif
