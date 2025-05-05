

import SwiftUI
import UIKit

// MARK: - Toast Style Enum

public enum ToastStyle {
    case normal
    case info
    case success
    case error

    var icon: String {
        switch self {
        case .normal: return "bell.fill"
        case .info: return "info.circle.fill"
        case .success: return "checkmark.circle.fill"
        case .error: return "xmark.octagon.fill"
        }
    }

    var useBlur: Bool {
        self == .normal
    }

    var backgroundColor: Color {
        switch self {
        case .normal:
            return .clear // BlurViewを使用
        case .info:
            return .blue.opacity(0.9)
        case .success:
            return .green.opacity(0.9)
        case .error:
            return .red.opacity(0.9)
        }
    }

    var foregroundColor: Color {
        switch self {
        case .normal:
            return Color.primary
        default:
            return Color.white
        }
    }
}


// MARK: - Toast View

public struct CustomToastView: View {
    public let message: String
    public let style: ToastStyle
    public let progress: Float?
    public let duration: Double

    @Binding var isShowing: Bool

    public init(
        message: String,
        style: ToastStyle = .info,
        progress: Float? = nil,
        duration: Double = 2.5,
        isShowing: Binding<Bool>
    ) {
        self.message = message
        self.style = style
        self.progress = progress
        self.duration = duration
        self._isShowing = isShowing
    }

    public var body: some View {
        if isShowing {
            VStack {
                Spacer()
                HStack(spacing: 16) {
                    Image(systemName: style.icon)
                        .font(.title2)
                        .foregroundColor(style.foregroundColor)

                    VStack(alignment: .leading, spacing: 4) {
                        Text(message)
                            .foregroundColor(style.foregroundColor)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)

                        if let progress = progress {
                            ProgressView(value: progress)
                                .progressViewStyle(LinearProgressViewStyle(tint: style.foregroundColor))
                        }
                    }
                    Spacer()
                }
                .padding()
                .background(
                    Group {
                        if style.useBlur {
                            BlurView(style: .systemUltraThinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                        } else {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(style.backgroundColor)
                        }
                    }
                )
                .shadow(radius: 10)
                .padding(.horizontal)
                .transition(.move(edge: .bottom).combined(with: .opacity))
                .onAppear {
                    if progress == nil {
                        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                            if isShowing {
                                withAnimation {
                                    isShowing = false
                                }
                            }
                        }
                    }
                }
            }
            .padding(.bottom, 40)
            .animation(.easeOut(duration: 0.3), value: isShowing)
        }
    }
}
