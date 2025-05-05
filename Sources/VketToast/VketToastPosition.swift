import SwiftUI

public enum VketToastPosition {
    case top, center, bottom
}

public class VketToastManager: ObservableObject {
    @Published public var isVisible = false
    @Published public var message: String = ""
    @Published public var iconName: String = "info.circle.fill"
    @Published public var tintColor: Color = .blue
    @Published public var backgroundOpacity: Double = 0.9
    @Published public var position: VketToastPosition = .bottom

    private var dismissWorkItem: DispatchWorkItem?

    public init() {}

    public func show(message: String,
                     iconName: String = "info.circle.fill",
                     tintColor: Color = .blue,
                     backgroundOpacity: Double = 0.9,
                     position: VketToastPosition = .bottom,
                     duration: TimeInterval = 2.5) {
        self.message = message
        self.iconName = iconName
        self.tintColor = tintColor
        self.backgroundOpacity = backgroundOpacity
        self.position = position

        withAnimation {
            isVisible = true
        }

        dismissWorkItem?.cancel()
        let task = DispatchWorkItem { [weak self] in
            withAnimation {
                self?.isVisible = false
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + duration, execute: task)
        dismissWorkItem = task
    }

    public func hide() {
        withAnimation {
            isVisible = false
        }
    }
}
