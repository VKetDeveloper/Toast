//
//  GlobalToastView.swift
//  VketToast
//
//  Created by kaf on 2025/05/05.
//


public struct GlobalToastView: View {
    @EnvironmentObject var toast: ToastManager

    public init() {}

    public var body: some View {
        if toast.isVisible {
            VStack {
                if toast.position == .top { Spacer().frame(height: 60) }
                if toast.position == .center { Spacer() }
                HStack(spacing: 12) {
                    Image(systemName: toast.iconName)
                        .foregroundColor(.white)
                        .font(.title2)

                    Text(toast.message)
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)

                    Spacer()
                }
                .padding()
                .background(toast.tintColor.opacity(toast.backgroundOpacity))
                .cornerRadius(16)
                .shadow(radius: 8)
                .padding(.horizontal)
                .transition(.move(edge: .bottom).combined(with: .opacity))

                if toast.position == .top || toast.position == .center {
                    Spacer()
                }
            }
            .animation(.easeOut(duration: 0.3), value: toast.isVisible)
            .padding(.bottom, toast.position == .bottom ? 40 : 0)
            .padding(.top, toast.position == .top ? 40 : 0)
        }
    }
}
