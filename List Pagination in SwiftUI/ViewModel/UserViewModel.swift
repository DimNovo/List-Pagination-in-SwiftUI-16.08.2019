//
//  UserViewModel.swift
//  List Pagination in SwiftUI
//
//  Created by Dmitry Novosyolov on 16/08/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import Foundation

class UserListViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    init() {
        NetService().fetch(page: 1) { [weak self] users in
            self?.users = users
        }
    }
    
    func nextPage(page: Int) {
        NetService().fetch(page: page) { [weak self] users in
            self?.users = users
        }
    }
}
