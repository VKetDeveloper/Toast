import SwiftUI
import UIKit

public struct BlurView: UIViewRepresentable {
    public let style: UIBlurEffect.Style

    public init(style: UIBlurEffect.Style = .systemUltraThinMaterial) {
        self.style = style
    }

    public func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView(effect: UIBlurEffect(style: style))
    }

    public func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}
