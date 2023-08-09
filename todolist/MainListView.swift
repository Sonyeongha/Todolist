//
//  MainListView.swift
//  todolist
//
//  Created by 손영하  on 2023/08/09.
//

import SwiftUI

struct MainListView: View {
    @EnvironmentObject var store: TodoStore /**하나의 데이터를 여러뷰에서 공유하고 싶을떄 이렇게 사용함**/
    
    var body: some View {
        NavigationView {
            List(store.list) { memo in
                VStack(alignment: .leading){
                    Text(memo.content)
                        .font(.body)
                        .lineLimit(1) /**메모내용을 한줄만 표시 뒷부분은 생략처리**/
                    
                    Text(memo.insertDate, style: .date)
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                
            }
            .listStyle(.plain)
            .navigationTitle("좀 해라 제발 좀")
        }
        
    }
    
    
    struct MainListView_Previews: PreviewProvider {
        static var previews: some View {
            MainListView()
                .environmentObject(TodoStore())
        }
    }
}
