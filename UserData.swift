//
//  UserData.swift
//  DashZane (Final Project)
//
//  Created by Zane Matarieh on 11/21/24.
//

import Foundation
import SwiftData

@Model
class User {
    @Attribute(.unique) var username: String // Ensure usernames are unique
    var password: String // Store the user's password

    // Initializer
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}
