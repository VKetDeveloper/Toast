import SwiftUI

public struct VketToastView: View {
    @EnvironmentObject var vkettoast: VketToastManager

    public init() {}

    public var body: some View {
        if vkettoast.isVisible {
            VStack {
                if vkettoast.position == .top { Spacer().frame(height: 60) }
                if vkettoast.position == .center { Spacer() }

                HStack(spacing: 12) {
                    Image(systemName: vkettoast.iconName)
                        .foregroundColor(.white)
                        .font(.title2)

                    Text(vkettoast.message)
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)

                    Spacer()
                }
                .padding()
                .background(vkettoast.tintColor.opacity(vkettoast.backgroundOpacity))
                .cornerRadius(16)
                .shadow(radius: 8)
                .padding(.horizontal)
                .transition(.move(edge: .bottom).combined(with: .opacity))

                if vkettoast.position == .top || vkettoast.position == .center {
                    Spacer()
                }
            }
            .animation(.easeOut(duration: 0.3), value: vkettoast.isVisible)
            .padding(.bottom, vkettoast.position == .bottom ? 40 : 0)
            .padding(.top, vkettoast.position == .top ? 40 : 0)
        }
    }
}
