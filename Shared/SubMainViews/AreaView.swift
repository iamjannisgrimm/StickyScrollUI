//
//  AreaView.swift
//  AreaView
//
//  Created by Jannis Grimm on 9/6/21.
//

import SwiftUI

struct AreaView: View {
    
    var body: some View {
        
        VStack {
            
            //Placeholder for now
            Rectangle()
                .frame(height: UIScreen.main.bounds.height-400, alignment: .center)
                .foregroundColor(Color("StructCellBG"))
                .cornerRadius(15)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
            
            AreaViewButtons()
            
        }
    }
}

struct AreaView_Previews: PreviewProvider {
    static var previews: some View {
        AreaView()
    }
}
