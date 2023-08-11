//
//  ComposeView.swift
//  todolist
//
//  Created by 손영하  on 2023/08/10.
//

import SwiftUI

struct ComposeView: View {
    @EnvironmentObject var store : TodoStore
    
    var memo: Memo? = nil
    
    
    @Environment(\.dismiss) var dismiss
    
    @State private var content: String = "" /**Stateavailable 속성이라고함**/
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $content) /**텍스트 에디터를 사용하면 텍스트 에디터가 바인딩되고 입력한 내용이 컨텐트속성에 자동으로 저장됨**/
                    .padding()
                    .onAppear{
                        if let memo = memo {
                            content = memo.content
                        }
                    }
            }
            .navigationTitle(memo != nil ? "내용수정" : "내용입력")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Button {
                        dismiss()
                    } label: {
                        Text("삭제")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        if let memo = memo {
                            store.update(memo: memo, content: content)
                        } else {
                            store.insert(memo: content)
                        }
                        
                        dismiss()
                    } label: {
                        Text("저장")
                    }
                }
            }
        }
    }
}

struct ComposeView_Previews: PreviewProvider {
    static var previews: some View {
        ComposeView()
            .environmentObject(TodoStore())
    }
}
