import Foundation

struct UserData: Codable, Identifiable { //makes userdata usable by userdefaults storage
    var id = UUID() //makes unique id for each item
    var username: String
    var password: String
    var dataList: [DataItem]
    
    init(username: String, password: String)
    {
        self.username = username
        self.password = password
        self.dataList = [DataItem]()
    }
    
}

struct DataItem: Codable, Identifiable{
    var id = UUID() //makes unique id for each item
    var username: String
    var password: String
    var website: String
}
