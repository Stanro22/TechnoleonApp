//
//  HorizontalRadioButtonLayout.swift
//  TechnoleonApp
//
//  Created by user220873 on 12/13/22.
//

import SwiftUI

struct HorizontalRadioButtonLayout: View {
    @State var selected = 0
    var body: some View {
        HStack{
            RadioButton(
                id: 1,
                label: "1",
                color:.white,
                bgColor: Color(red: 0.18, green: 0.25, blue: 0.44),
                isMarked: $selected.wrappedValue == 1 ? true : false,
                callback: { selected in
                    self.selected = selected
                }
            )
            RadioButton(
                id: 2,
                label: "2",
                color:.white,
                bgColor: Color(red: 0.18, green: 0.25, blue: 0.44),
                isMarked: $selected.wrappedValue == 2 ? true : false,
                callback: { selected in
                    self.selected = selected
                }
            )
            RadioButton(
                id: 3,
                label: "3",
                color:.white,
                bgColor: Color(red: 0.18, green: 0.25, blue: 0.44),
                isMarked: $selected.wrappedValue == 3 ? true : false,
                callback: { selected in
                    self.selected = selected
                }
            )
            RadioButton(
                id: 4,
                label: "4",
                color:.white,
                bgColor: Color(red: 0.18, green: 0.25, blue: 0.44),
                isMarked: $selected.wrappedValue == 4 ? true : false,
                callback: { selected in
                    self.selected = selected
                }
            )
            RadioButton(
                id: 5,
                label: "5",
                color:.white,
                bgColor: Color(red: 0.18, green: 0.25, blue: 0.44),
                isMarked: $selected.wrappedValue == 5 ? true : false,
                callback: { selected in
                    self.selected = selected
                }
            )
        }
    }
}

struct HorizontalRadioButtonLayout_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalRadioButtonLayout()
    }
}
