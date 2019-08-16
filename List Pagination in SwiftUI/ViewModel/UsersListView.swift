//
//  UsersListView.swift
//  List Pagination in SwiftUI
//
//  Created by Dmitry Novosyolov on 16/08/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

struct UsersListView: View {
    @ObservedObject var userListVM = UserListViewModel()
    @State private var page = 1
    var body: some View {
        List(self.userListVM.users, id: \.name) { user in
            Text(user.name)
        }
        .navigationBarTitle("Users List")
        .navigationBarItems(leading:
            1 < self.page ? Button("<<") {
                withAnimation(.default) {self.page -= 1}
                self.userListVM.nextPage(page: self.page)} : nil,
                            trailing:
            self.userListVM.users.count > self.page ? Button(">>") {
                withAnimation(.default) {self.page += 1}
                self.userListVM.nextPage(page: self.page)} : nil)
    }
}

#if DEBUG
struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView()
    }
}
#endif
