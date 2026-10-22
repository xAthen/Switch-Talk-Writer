//
//  HomeView.swift
//

import SwiftUI
import SwiftUI
import Combine

// MARK: - Saved files (model + storage)

struct SavedFile: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var words: [String]
    var wordBank: [[String]]
    var modified = Date()
}

// Keeps the list of saved files and writes it to disk as JSON
@MainActor
final class FileStore: ObservableObject {
    @Published private(set) var files: [SavedFile] = []

    private let fileURL: URL

    init() {
        let base = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0]
        let folder = base.appendingPathComponent("SwitchTalkWriter", isDirectory: true)
        try? FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)
        fileURL = folder.appendingPathComponent("files.json")
        load()
    }

    // Adds a new file, or overwrites the one with the same id
    func save(_ file: SavedFile) {
        var updated = file
        updated.modified = Date()
        if let index = files.firstIndex(where: { $0.id == file.id }) {
            files[index] = updated
        } else {
            files.append(updated)
        }
        persist()
    }

    func delete(_ file: SavedFile) {
        files.removeAll { $0.id == file.id }
        persist()
    }

    private func persist() {
        do {
            let data = try JSONEncoder().encode(files)
            try data.write(to: fileURL, options: .atomic)
        } catch {
            print("Could not write files: \(error)")
        }
    }

    private func load() {
        guard let data = try? Data(contentsOf: fileURL),
              let decoded = try? JSONDecoder().decode([SavedFile].self, from: data) else { return }
        files = decoded
    }
}

// MARK: - Home page

struct HomeView: View {
    @StateObject private var store = FileStore()

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
        .environmentObject(store)
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
    @EnvironmentObject private var store: FileStore
    @State private var fileToDelete: SavedFile?

    private var sortedFiles: [SavedFile] {
        store.files.sorted { $0.modified > $1.modified }
    }

    private var showDeleteAlert: Binding<Bool> {
        Binding(
            get: { fileToDelete != nil },
            set: { if !$0 { fileToDelete = nil } }
        )
    }

    var body: some View {
        VStack {
            HStack {
                BackButton()
                Spacer()
                NavigationLink(destination: ContentView()) {
                    Text("New File")
                        .font(.system(size: 32, weight: .semibold))
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.primary, lineWidth: 3))
                }
                .buttonStyle(.plain)
            }

            Text("Files")
                .font(.system(size: 60, weight: .bold, design: .rounded))

            if store.files.isEmpty {
                Spacer()
                Text("No saved files yet")
                    .font(.system(size: 32))
                    .foregroundColor(.secondary)
                Spacer()
            } else {
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(sortedFiles) { file in
                            FileRow(file: file) {
                                fileToDelete = file
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .alert("Delete file?", isPresented: showDeleteAlert, presenting: fileToDelete) { file in
            Button("Delete", role: .destructive) {
                store.delete(file)
            }
            Button("Cancel", role: .cancel) {}
        } message: { file in
            Text("\"\(file.name)\" will be permanently deleted.")
        }
    }
}

// One saved file: tap the name to open it, or tap Delete
struct FileRow: View {
    let file: SavedFile
    let onDelete: () -> Void

    var body: some View {
        HStack(spacing: 16) {
            NavigationLink(destination: ContentView(file: file)) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(file.name)
                            .font(.system(size: 32, weight: .semibold))
                        Text(file.modified.formatted(date: .abbreviated, time: .shortened))
                            .font(.system(size: 20))
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                }
                .padding()
                .contentShape(Rectangle())
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.primary, lineWidth: 3))
            }
            .buttonStyle(.plain)

            Button("Delete") {
                onDelete()
            }
            .font(.system(size: 28))
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.primary, lineWidth: 3))
        }
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
