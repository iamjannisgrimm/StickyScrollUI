//
//  ViewView.swift
//  ViewView
//
//  Created by Jannis Grimm on 9/6/21.
//

import SwiftUI

struct ViewView: View {
    var body: some View {
        
        VStack {
            
            //Title
            HStack {
                Text("View")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(Color("B&W"))
                    .padding(EdgeInsets(top: 14, leading: 12, bottom: 12, trailing: 0))
                Spacer()
            }.frame(height: 40, alignment: .center)

            ViewViewCell()
            
            ViewViewButtons()
            
        }
        
            
    }
}

struct ViewView_Previews: PreviewProvider {
    static var previews: some View {
        ViewView()
    }
}
