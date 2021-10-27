//
//  TextAStockAddViewButtons.swift
//  MeMyself
//
//  Created by Jannis Grimm on 10/27/21.
//

import SwiftUI

struct TextAStockAddViewButtons: View {
    
    @EnvironmentObject var main: MainCode
    
    //Haptic feedback
    func simpleSuccess() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }

    
    var body: some View {
        
        HStack {
            
            Spacer()
            
            //BackButton
            Button {
                //Back action
                simpleSuccess()
                main.index = 0
                UIApplication.shared.endEditing()
            } label: {
            Text("Back")
                .font(.system(size: 14.5))
                .fontWeight(.semibold)
        }
            
            Spacer()
            
            //NextButton
            Button {
                //Next action
                simpleSuccess()
                main.index = 2
                UIApplication.shared.endEditing()
            } label: {
                Text("Save")
                    .font(.system(size: 14.5))

                    .fontWeight(.semibold)
            }
            
            Spacer()

        }.padding(EdgeInsets(top: 8, leading: 0, bottom: -1, trailing: 0))
    }
}

struct TextAStockAddViewButtons_Previews: PreviewProvider {
    static var previews: some View {
        TextAStockAddViewButtons()
    }
}
