//
//  ModalViewModifier.swift
//  Hero
//
//  Created by Safwen DEBBICHI on 22/01/2024.
//

import SwiftUI

struct ModalViewModifier<Destination: View, Bindable: Identifiable>: ViewModifier {
    @Binding var value: Bindable?
    @GestureState private var offset: CGFloat = 0
    let destination: (_ value: Bindable) -> Destination
    func body(content: Content) -> some View {
        ZStack(alignment: .top) {
            content
            if let value {
                destination(value)
                    .background(Color.black)
                    .ignoresSafeArea()
                    .statusBarHidden(value != nil)
            }
        }
    }
}

extension View {
    func modal<Destination: View, Bindable: Identifiable>(bindable: Binding<Bindable?>, @ViewBuilder destination: @escaping (_ value: Bindable) -> Destination) -> some View {
        self.modifier(ModalViewModifier(value: bindable, destination: destination))
    }
}

extension Binding where Value == Movie? {
    var toBoolBinding: Binding<Bool> {
        Binding<Bool>.init {
            self.wrappedValue != nil
        } set: { value in
            if !value {
                self.wrappedValue = nil
            }
        }

    }
}
