

import SwiftUI
import Foundation
import Combine

public class ToastManager: ObservableObject {
    @Published public var isVisible = false
    @Published public var message: String = ""
    @Published public var progress: Float?

    private var dismissWorkItem: DispatchWorkItem?

    public init() {}

    public func show(message: String, progress: Float? = nil, duration: TimeInterval = 2.5) {
        self.message = message
        self.progress = progress
        withAnimation {
            isVisible = true
        }

        // Progressありは自動非表示しない
        dismissWorkItem?.cancel()
        if progress == nil {
            let task = DispatchWorkItem { [weak self] in
                withAnimation {
                    self?.isVisible = false
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + duration, execute: task)
            dismissWorkItem = task
        }
    }

    public func hide() {
        withAnimation {
            isVisible = false
        }
    }
}

