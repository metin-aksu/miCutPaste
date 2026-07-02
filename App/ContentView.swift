import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 12) {
                Image(systemName: "scissors")
                    .font(.system(size: 36))
                    .foregroundStyle(.tint)
                Text("miCutPaste")
                    .font(.largeTitle.bold())
            }

            Text("app_description")
                .fixedSize(horizontal: false, vertical: true)

            Divider()

            VStack(alignment: .leading, spacing: 8) {
                Label { Text("step_enable") } icon: { stepNumber(1) }
                Label { Text("step_cut") } icon: { stepNumber(2) }
                Label { Text("step_paste") } icon: { stepNumber(3) }
            }

            Button {
                openExtensionSettings()
            } label: {
                Text("open_extension_settings")
                    .frame(maxWidth: .infinity)
            }
            .controlSize(.large)
            .buttonStyle(.borderedProminent)
        }
        .padding(24)
        .frame(width: 440)
    }

    private func stepNumber(_ number: Int) -> some View {
        Text("\(number)")
            .font(.callout.bold())
            .frame(width: 22, height: 22)
            .background(Circle().fill(.tint.opacity(0.15)))
    }

    private func openExtensionSettings() {
        let urls = [
            // macOS 13+ Extensions pane, filtered to Finder extensions.
            "x-apple.systempreferences:com.apple.ExtensionsPreferences?extensionPointIdentifier=com.apple.FinderSync",
            "x-apple.systempreferences:com.apple.ExtensionsPreferences"
        ]
        for string in urls {
            if let url = URL(string: string), NSWorkspace.shared.open(url) {
                return
            }
        }
    }
}

#Preview {
    ContentView()
}
