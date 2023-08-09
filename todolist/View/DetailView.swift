//
//  DetailView.swift
//  todolist
//
//  Created by 손영하  on 2023/08/10.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var memo: Todo /**메모를저장하는 속성부터 추가**/
    @EnvironmentObject var store: TodoStore
    
    
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
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(memo: Todo(content: "입력하세요."))
            .environmentObject(TodoStore())
    }
}
