//
//  PlaceHolderView.swift
//  MvvmPatternSwiftUi
//
//  Created by Priyanshi on 27/05/24.
//

import SwiftUI

struct PlaceHolderView: View {
    
    let item: UserModel
    
    var body: some View {
        HStack{
            VStack{
                Text(item.title ?? "")
                    .font(.title)
                    .foregroundColor(.blue)
                Spacer()
                Text(item.body ?? "")
                    .font(.body)
                    .foregroundColor(.gray)
                
            }
        }
    }
}




struct PlaceHolderView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceHolderView(item: UserModel(userId: 1, id: 1, title: "DUMY API", body: "dumy Body"))
    }
}
