//
//  Flashcard.swift
//  flashcards
//
//  Created by Dan Morain on 6/8/23.
//

import SwiftUI

struct Flashcard : Identifiable {
    var id = UUID()
    var title : String
    var description: String
}

let testFlashcards = [
    Flashcard(title: "Hola", description: "Hello"),
    Flashcard(title: "Hoy", description: "Today"),
    Flashcard(title: "Jueves", description: "Thursday"),
]
