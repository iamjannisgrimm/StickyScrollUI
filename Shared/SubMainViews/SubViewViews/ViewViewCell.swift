//
//  ViewViewCell.swift
//  MeMyself
//
//  Created by Jannis Grimm on 10/27/21.
//

import SwiftUI

struct ViewViewCell: View {
    var body: some View {
        
        //Placeholder ViewView
        Rectangle()
            .cornerRadius(15)
            .foregroundColor(Color("StructCellBG"))
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 8, trailing: 10))
            .frame(height: UIScreen.main.bounds.height-155, alignment: .center)

    }
}

struct ViewViewCell_Previews: PreviewProvider {
    static var previews: some View {
        ViewViewCell()
    }
}
