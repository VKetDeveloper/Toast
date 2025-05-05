
import SwiftUI

public enum ToastStyle {
    case info
    case success
    case error

    var icon: String {
        switch self {
        case .info: return "info.circle.fill"
        case .success: return "checkmark.circle.fill"
        case .error: return "xmark.octagon.fill"
        }
    }

    var tintColor: Color {
        switch self {
        case .info: return .blue
        case .success: return .green
        case .error: return .red
        }
    }
}

public struct CustomToastView: View {
    public let message: String
    public let style: ToastStyle
    public let progress: Float?
    public let duration: Double

    @Binding var isShowing: Bool

    public init(message: String,
                style: ToastStyle = .info,
                progress: Float? = nil,
                duration: Double = 2.5,
                isShowing: Binding<Bool>) {
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
                HStack(alignment: .center, spacing: 16) {
                    Image(systemName: style.icon)
                        .font(.title2)
                        .foregroundColor(.white)

                    VStack(alignment: .leading, spacing: 4) {
                        Text(message)
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)

                        if let progress = progress {
                            ProgressView(value: progress)
                                .progressViewStyle(LinearProgressViewStyle(tint: .white))
                        }
                    }
                    Spacer()
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(style.tintColor.opacity(0.9))
                        .background(.ultraThinMaterial)
                )
                .shadow(radius: 8)
                .padding(.horizontal)
                .transition(.move(edge: .bottom).combined(with: .opacity))
                .onAppear {
                    if progress == nil {
                        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                            withAnimation {
                                isShowing = false
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
