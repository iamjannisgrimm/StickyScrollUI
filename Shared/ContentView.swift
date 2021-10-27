//
//  ContentView.swift
//  Shared
//
//  Created by Jannis Grimm on 9/6/21.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View{

        VStack {
            
            MainView().environmentObject(MainCode())
            
        }
    }

}


