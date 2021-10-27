//
//  TextAStockAddView.swift
//  MeMyself
//
//  Created by Jannis Grimm on 10/27/21.
//

import SwiftUI

struct AddView: View {
    
    @EnvironmentObject var main: MainCode
    
    var body: some View {
        
        VStack {
            
            //Top 'Add' title with spacing
            VStack {
                
                Spacer()
                
                //Placeholder for spacing
                Rectangle()
                    .frame(height: 0, alignment: .center)
                    .foregroundColor(Color.clear)
                
                //Title
                HStack {
                    Text("Add")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .foregroundColor((main.index == 1 ? Color("B&W") : Color("W&B")))
                        .padding()
                    Spacer()
                }
                
            }
            
            //Bottom 'Add' title with spacing
            VStack {
                
                //Placeholder for spacing
                Rectangle()
                    .frame(height: UIScreen.main.bounds.height-725, alignment: .center)
                    .foregroundColor(Color.clear)

                //Title
                HStack {
                    Text("Add")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .foregroundColor((main.index == 2 ? Color("B&W") : main.index == 0 ? Color("B&W") : Color("W&B")))
                        .padding()
                    Spacer()
                }

            }

            //Optinal showing stockRateView (hidden for demo)
            if main.index != 2 {
                StockRateView()
                    .hidden()
                    .foregroundColor(main.index == 2 ? Color.clear : Color.blue)
            }
                
            TextAddView()
            
            //Optional showing buttons on bottom
            if main.index != 2 {
                TextAStockAddViewButtons()
            }
            
            Spacer()
            
        }
    }
}

struct TextAStockAddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
