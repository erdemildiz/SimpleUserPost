//
//  PersonPickerView.swift
//  SocialApp
//
//  Created by Erdem ILDIZ on 10.08.2022.
//

import SwiftUI

enum Person: String, Identifiable, CaseIterable {
    case Marry, Tom, Allice
    var id: Self { self }
}

struct PersonPickerView: View {
    @State var selectedPerson: Person = .Marry
    var body: some View {
        NavigationView {
            VStack {
                // Picker
                Picker("Pick a user", selection: $selectedPerson) {
                    ForEach(Person.allCases, id: \.self) { person in
                        Text(person.rawValue).tag(person)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                // Selected person text
                Text("Selected user: " + selectedPerson.rawValue)
                // Submit button
                NavigationLink {
                    UserPostListView(userType: selectedPerson.rawValue)
                } label: {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(height: 50)
                        .padding()
                        .overlay(
                            Text("Use this person")
                                .foregroundColor(.white)
                        )
                }
                
                Spacer()
            }
        }
    }
}
