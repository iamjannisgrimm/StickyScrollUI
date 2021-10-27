//
//  ViewViewButtons.swift
//  MeMyself
//
//  Created by Jannis Grimm on 10/27/21.
//

import SwiftUI

struct ViewViewButtons: View {
    
    @EnvironmentObject var main: MainCode
    
    //Haptic feedback
    func simpleSuccess() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }

    
    var body: some View {
        
        HStack {
            
            Spacer()
            
            //AddButton
            Button {
                //Add action
                simpleSuccess()
                main.index = 1
                UIApplication.shared.endEditing()
            } label: {
                Text("Add")
                    .font(.system(size: 14.5))
                    .fontWeight(.semibold)
            }
            
            Spacer()
            
            //SettingsButton
            Button {
                //Settings action
                simpleSuccess()
                main.index = 0
                UIApplication.shared.endEditing()
            } label: {
                Text("Set")
                    .font(.system(size: 14.5))
                    .fontWeight(.semibold)
            }

            Spacer()

        }
        
    }
}

struct ViewViewButtons_Previews: PreviewProvider {
    static var previews: some View {
        ViewViewButtons()
    }
}
