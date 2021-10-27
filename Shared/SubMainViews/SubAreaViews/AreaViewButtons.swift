//
//  AreaViewButtons.swift
//  MeMyself
//
//  Created by Jannis Grimm on 10/27/21.
//

import SwiftUI

struct AreaViewButtons: View {
    
    
    @EnvironmentObject var main: MainCode
    
    //Haptic feedback
    func simpleSuccess() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }

    
    var body: some View {
        
        HStack {
            
            Spacer()
            
            //BackButtonn
            Button {
                //Back action
                simpleSuccess()
                main.index = 1
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
                main.index = 0
                UIApplication.shared.endEditing()
            } label: {
                Text("Save")
                    .font(.system(size: 14.5))
                    .fontWeight(.semibold)
            }
            
            Spacer()

        }.padding(.top, 8)
    }

}

struct AreaViewButtons_Previews: PreviewProvider {
    static var previews: some View {
        AreaViewButtons()
    }
}
