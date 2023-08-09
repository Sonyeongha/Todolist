//
//  MainListView.swift
//  todolist
//
//  Created by 손영하  on 2023/08/09.
//

import SwiftUI

struct MainListView: View {
    @EnvironmentObject var store: TodoStore /**하나의 데이터를 여러뷰에서 공유하고 싶을떄 이렇게 사용함**/
    @State private var showComposer: Bool = false
    
    
    var body: some View {
        NavigationView {
            List(store.list) { Todo in
                NavigationLink{
                    DetailView(memo: Todo)
                } label: {
                MemoCell(memo: Todo)
                }
                
            }
            .listStyle(.plain)
            .navigationTitle("좀 해라 제발 좀")
            .padding()
            .toolbar {
                Button {
                    showComposer = true
                } label: {
                    Text("리스트 추가")
                }
            }
            .sheet(isPresented: $showComposer)
            /**바인딩을 전달해야하기 떄문에$표시추가**/ {
                ComposeView()
            }
        }
        
    }
    
    
    struct MainListView_Previews: PreviewProvider {
        static var previews: some View {
            MainListView()
                .environmentObject(TodoStore())
        }
    }
}

