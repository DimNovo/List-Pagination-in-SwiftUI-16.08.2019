//
//  NetService.swift
//  List Pagination in SwiftUI
//
//  Created by Dmitry Novosyolov on 16/08/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import Foundation

class NetService {
    
    func fetch(page: Int, completion: @escaping (([User])) -> Void) {
        
        let url = URL(string: "https://giddy-tower.glitch.me/users?page=\(page)")!
        
        URLSession.shared.dataTask(with: url) { data,_,_ in
            
            guard data != nil else { print("Can't decode data!"); return }
            let users = try? JSONDecoder().decode([User].self, from: data!)
            DispatchQueue.main.async { completion(users!)}
        }.resume()
    }
}
