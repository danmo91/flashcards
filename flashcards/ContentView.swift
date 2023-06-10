//
//  ContentView.swift
//  flashcards
//
//  Created by Dan Morain on 6/8/23.
//

import SwiftUI

struct ContentView: View {
    @State var flashcards: [Flashcard] = []
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(destination: FlashcardNew(onSave: addFlashcard)) {
                        Button("Add Flashcard", action: {})
                    }
                }
                Section {
                    ForEach(flashcards) { flashcard in
                        FlashcardCell(flashcard: flashcard)
                    }.onDelete(perform: deleteFlashcard)
                    .onMove(perform: moveFlashcard)
                }
            }.listStyle(.insetGrouped)
            .navigationBarTitle(Text("Flashcards"))
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func addFlashcard(input: FlashcardNewInput) {
        self.flashcards.append(Flashcard(id: UUID(), title: input.title, description: input.description))
    }
    
    func deleteFlashcard(index: IndexSet) -> Void {
        self.flashcards.remove(atOffsets: index)
    }
    
    func moveFlashcard(from source: IndexSet, to destination: Int) {
        self.flashcards.move(fromOffsets: source, toOffset: destination)
    }
    
}

struct FlashcardCell: View {
    var flashcard : Flashcard
    
    var body: some View {
        NavigationLink(destination: FlashcardDetail(flashcard: flashcard)) {
            Text(flashcard.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var howToBuildAnInterpreterFlashCards : [Flashcard] = [
        Flashcard(id: UUID(), title: "Lexical Analysis", description: "First pass on the source code, creating tokens"
        )
    ]
    
    static var previews: some View {
        Group {
            ContentView(flashcards: testFlashcards)
                .previewDisplayName("Default")
            ContentView(flashcards: testFlashcards)
                .environment(\.sizeCategory, .extraExtraExtraLarge)
                .previewDisplayName("Extra large font")
            ContentView(flashcards: testFlashcards)
                .environment(\.colorScheme, .dark)
                .previewDisplayName("Dark mode")
            ContentView(flashcards: testFlashcards)
                .environment(\.locale, Locale(identifier: "es"))
                .previewDisplayName("Espanol")
        }
    }
}


