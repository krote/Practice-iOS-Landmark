//
//  ProfileEditor.swift
//  Lamdmarks
//
//  Created by icdadmin on 2023/08/07.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    var body: some View {
        List{
            HStack{
                Text("Usernname").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
