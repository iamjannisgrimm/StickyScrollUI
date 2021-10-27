//
//  StockRateView.swift
//  MeMyself
//
//  Created by Jannis Grimm on 10/24/21.
//

import SwiftUI

struct StockRateView: View {
    var body: some View {
        
        
        VStack {
            
            //Contains three buttons for rating
            HStack {
                
                Button {
                    //Bad action
                } label: {
                    Text("Bad")
                }.padding(.leading, 30)
                
                Spacer()
                
                Button {
                    //Neutral action
                } label: {
                    Text("Neutral")
                }
                
                Spacer()
                
                Button {
                    //Good action
                } label: {
                    Text("Good")
                }.padding(.trailing, 30)

            }
            .padding()
            .background(Color("StructCellBG"))
            .cornerRadius(15)
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))

        }
    }
}

struct StockRateView_Previews: PreviewProvider {
    static var previews: some View {
        StockRateView()
    }
}
