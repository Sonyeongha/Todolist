//
//  DetailView.swift
//  todolist
//
//  Created by 손영하  on 2023/08/10.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var memo: Memo /**메모를저장하는 속성부터 추가**/
    
    @EnvironmentObject var store: TodoStore
    
    @State private var showComposer = false
    @State private var showDeleteAlert = false
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View { /**UI구현하기**/
        VStack {
            ScrollView {
                VStack {
                    HStack { /**글자위치바꾸기**/
                        Text(memo.content)
                            .padding()
                        Spacer(minLength: 0)
                    }
                    Text(memo.insertDate, style: .date)
                        .padding()
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
        }
        .navigationTitle ("할일 보기")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Button {
                    showDeleteAlert = true
                } label: {
                    Image(systemName: "trash")
                }
                .foregroundColor(.red)
                .alert("삭제확인", isPresented: $showDeleteAlert) {
                    Button(role: .destructive) {
                        store.delete(memo: memo)
                        dismiss()
                    } label: {
                        Text("삭제")
                    }
                }  message: {
                    Text("리스트를 삭제하겠습니까?")
                }
                
                
                Button {
                    showComposer = true
                } label:{
                    Image(systemName: "square.and.pencil")
                }
            }
        }
        .sheet(isPresented: $showComposer) {
            ComposeView(memo: memo)
        }
    }
}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            DetailView(memo: Memo(content: "입력하세요."))
                .environmentObject(TodoStore())
        }
    }
}
