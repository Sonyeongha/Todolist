//
//  Todostore.swift
//  todolist
//
//  Created by 손영하  on 2023/08/09.
//

import Foundation

class TodoStore: ObservableObject {
    @Published var list: [Memo]
    
    init() {
        list = [
            Memo(content: "8시 기상", insertDate: Date.now),
            Memo(content: "고양이 화장실 청소",insertDate: Date.now),
            Memo(content: "9시 입실", insertDate: Date.now)
        ]
    }
    
    func insert(memo: String) {
        list.insert(Memo(content: memo), at : 0)
    }
    
    func update(memo: Memo?, content: String) {
        guard let memo = memo else { /**옵셔널을 풀어주기 위해 바인딩하기**/
            return
        }
        memo.content = content
    }
    
    
    
    /**메모와 인덱스를 받는 버전 구현하기**/
    func delete(memo: Memo) {
        list.removeAll {$0.id == memo.id }
    }
    
    func delete(set: IndexSet) {
        for index in set {
            list.remove(at: index )
        }
    }
    
    
}

