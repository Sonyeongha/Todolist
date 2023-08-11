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
            List {
                ForEach(store.list) { memo in
                    NavigationLink{
                        DetailView(memo: memo)
                    } label: {
                        memoCell(memo: memo)
                    }
                }
                .onDelete(perform: store.delete)
                
            }
            .listStyle(.plain)
            .navigationTitle ("제발 좀 해라")
            .padding()
            .toolbar {
                Button {
                    showComposer = true
                } label: {
                    Text("리스트 추가")
                }
            }
            .sheet(isPresented: $showComposer)
            {
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

