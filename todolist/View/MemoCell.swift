//
//  MemoCell.swift
//  todolist
//
//  Created by 손영하  on 2023/08/10.
//

import SwiftUI

struct MemoCell: View {
    @ObservedObject var memo: Todo
    
    var body: some View {
        VStack(alignment: .leading){
            Text(memo.content)
                .font(.body)
                .lineLimit(1) /**메모내용을 한줄만 표시 뒷부분은 생략처리**/
            
            Text(memo.insertDate, style: .date)
                .font(.footnote)
                .foregroundColor(.gray)
        }
    }
}


struct MemoCell_Previews: PreviewProvider {
    static var previews: some View {
        MemoCell(memo: Todo(content: "Test"))
    }
}
