import SwiftUI

public struct ToastView: View {
    public let message: String
    public let progress: Float?

    public init(message: String, progress: Float? = nil) {
        self.message = message
        self.progress = progress
    }

    public var body: some View {
        VStack {
            Spacer()
            HStack(alignment: .center, spacing: 16) {
                Image(systemName: "arrow.down.circle.fill")
                    .font(.title2)
                    .foregroundColor(.white)

                VStack(alignment: .leading, spacing: 4) {
                    Text(message)
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .lineLimit(2)
                    if let progress = progress {
                        ProgressView(value: progress)
                            .progressViewStyle(LinearProgressViewStyle(tint: .white))
                    }
                }
                Spacer()
            }
            .padding()
            .background(BlurView(style: .systemThinMaterialDark))
            .cornerRadius(16)
            .shadow(radius: 10)
            .padding(.horizontal)
            .transition(.move(edge: .bottom).combined(with: .opacity))
        }
        .padding(.bottom, 40)
    }
}
