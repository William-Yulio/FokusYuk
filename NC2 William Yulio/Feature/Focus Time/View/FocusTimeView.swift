//
//  FocusTimeView.swift
//  NC2 William Yulio
//
//  Created by William Yulio on 22/07/22.
//

import SwiftUI

struct FocusTimeView: View {
    var body: some View {
        VStack{
            Spacer()
            PickerComponent()
            Spacer()
            TimeComponent()
            Spacer()
        }.background(Color(hex: 0x2C3639))
            
    }
}

struct FocusTimeView_Previews: PreviewProvider {
    static var previews: some View {
        FocusTimeView()
    }
}
