import Foundation

struct UserData: Codable, Identifiable { //makes a new data type and codable identifyable makes it so i can use that ForEach method
    var id = UUID() //makes unique id for each item
    var username: String
    var password: String
    var dataList: [DataItem]
    
    init(username: String, password: String) //initializes a Userdata object so i can assign values to each variable
    {
        self.username = username
        self.password = password
        self.dataList = [DataItem]()
    }
    
}

struct DataItem: Codable, Identifiable{ // same thing as above
    var id = UUID() //makes unique id for each item
    var username: String
    var password: String
    var website: String
}
