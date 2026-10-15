//
//  HomeView.swift
//

import SwiftUI

// MARK: - Home page

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()

                Text("Let's Learn")
                    .font(.system(size: 96, weight: .bold, design: .rounded))
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .padding(.horizontal)

                Spacer()

                // Spacers on both ends and between buttons keep the spacing even
                HStack {
                    Spacer()
                    HomeCircleLink(title: "Files", destination: FilesView())
                    Spacer()
                    HomeCircleLink(title: "Presets", destination: PresetsView())
                    Spacer()
                    HomeCircleLink(title: "Settings", destination: SettingsView())
                    Spacer()
                }

                Spacer()
            }
        }
    }
}

// Reusable circular button that navigates to another screen
struct HomeCircleLink<Destination: View>: View {
    let title: String
    let destination: Destination

    var body: some View {
        NavigationLink(destination: destination) {
            Text(title)
                .font(.system(size: 32, weight: .semibold))
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .padding(12)
                .frame(width: 200, height: 200)
                .background(Circle().stroke(Color.primary, lineWidth: 3))
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Placeholder screens

struct FilesView: View {
    var body: some View {
        VStack {
            HStack {
                BackButton()
                Spacer()
            }
            Spacer()
            Text("Files")
                .font(.system(size: 60, weight: .bold, design: .rounded))
            Spacer()
            NavigationLink(destination: ContentView()) {
                Text("New File")
                    .font(.system(size: 32, weight: .semibold))
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.primary, lineWidth: 3))
            }
            .buttonStyle(.plain)
            Spacer()
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}

struct PresetsView: View {
    var body: some View { PlaceholderScreen(title: "Presets") }
}

struct SettingsView: View {
    var body: some View { PlaceholderScreen(title: "Settings") }
}

// Reusable Back button that returns to the previous screen
struct BackButton: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Button("Back") {
            dismiss()
        }
        .font(.system(size: 32))
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.primary, lineWidth: 3))
    }
}

// Empty screen with just a title and a Back button
struct PlaceholderScreen: View {
    let title: String

    var body: some View {
        VStack {
            HStack {
                BackButton()
                Spacer()
            }
            Spacer()
            Text(title)
                .font(.system(size: 60, weight: .bold, design: .rounded))
            Spacer()
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomeView()
}
