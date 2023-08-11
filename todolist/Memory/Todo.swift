//
//  Todo.swift
//  todolist
//
//  Created by 손영하  on 2023/08/09.
//

import Foundation
import SwiftUI

class Memo: Identifiable, ObservableObject {
    let id: UUID
    @Published var content: String
    let insertDate: Date
    
    init(content: String, insertDate: Date = Date.now) {
    id = UUID()
        self.content = content
        self.insertDate = insertDate
        
    }
}
