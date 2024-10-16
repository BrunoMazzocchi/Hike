//
//  SettingsView.swift
//  Hike
//
//  Created by Bruno Mazzocchi on 14/10/24.
//

import SwiftUI

struct SettingsView: View {
    // Properties
    
    private let alternateAppIcons: [String] = [
        "AppIcon-Map",
        "AppIcon-Mushroom",
        "AppIcon-Camera",
        "AppIcon-Backpack",
        "AppIcon-Campfire"
    ]
    var body: some View {
        List {
            Section {
                // MARK: SECTION - HEADER
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    VStack (spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        Text("Editor's Choice")
                            .fontWeight(.medium)
                    }
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    Spacer()
                }.foregroundStyle(
                    LinearGradient(
                        colors: [.customGreenLight, .customGreenMedium, .customGreenDark],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                ).padding(.top, 8)
                VStack (spacing: 8) {
                    Text("Where you can find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the top")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            } //: HEADER
            .listRowSeparator(.hidden)
            // MARK: SECTION - ICONS
            
            Section(header: Text("Alternate Icons")) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack (spacing: 12) {
                        ForEach(alternateAppIcons.indices, id: \.self) {
                            item in
                            Button {
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) { error in
                                    if error != nil {
                                        print("Failed request to update app icon: \(String(describing: error?.localizedDescription))")
                                    } else {
                                        print("Success")
                                    }
                                }
                            } label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }
                            .buttonStyle(.borderless)
                        }
                    }
                }
                .padding(.top, 12)
                Text("Choose your favorite app icon from the collection above.")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom, 12)
            }
            .listRowSeparator(.hidden)
            
            // MARK: SECTION - ABOUT
            Section (
                header: Text("ABOUT THE APP"),
                footer: HStack {
                    Spacer()
                    Text("Copyright © 2024")
                    Spacer()
                }
                    .padding(.vertical, 8)
            ) {
                CustomListRowView(
                    rowLabel: "Application",
                    rowIcon: "apps.iphone",
                    rowContent: "Hike",
                    rowTintColor: .blue
                )
                
                CustomListRowView(
                    rowLabel: "Compatibility",
                    rowIcon: "info.circle",
                    rowContent: "iOS",
                    rowTintColor: .red
                )
                
                CustomListRowView(
                    rowLabel: "Version",
                    rowIcon: "gear",
                    rowContent: "1.0",
                    rowTintColor: .purple
                )
                
                CustomListRowView(
                    rowLabel: "Tech",
                    rowIcon: "swift",
                    rowContent: "Swift",
                    rowTintColor: .orange
                )
                
                CustomListRowView(
                    rowLabel: "Developer",
                    rowIcon: "ellipsis.curlybraces",
                    rowContent: "BM",
                    rowTintColor: .mint
                )
                
                CustomListRowView(
                    rowLabel: "Website",
                    rowIcon: "wifi",
                    rowTintColor: .colorSalmonLight,
                    rowLinkLabel: "Google", rowLinkDestination: "https://google.com"
                )

            }
        }
    }
}

#Preview {
    SettingsView()
}
