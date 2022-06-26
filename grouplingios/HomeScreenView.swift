//
//  HomeScreenView.swift
//  grouplingios
//
//  Created by Liz Wait on 6/26/22.
//

import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .fill(
                    Color.gray
                )
                .frame(width: 400, height: 300)
            }
        }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
