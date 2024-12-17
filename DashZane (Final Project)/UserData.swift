import Foundation

struct UserData: Codable, Identifiable { //makes it so i can use the ForEach method
    var id = UUID() //makes unique id for each item
    var username: String
    var password: String
    var dataList: [DataItem] //makes datalist a string of dataItems
    
    init(username: String, password: String) //initializer so i can pass values into userdata
    {
        self.username = username
        self.password = password
        self.dataList = [DataItem]()
    }
    
}

struct DataItem: Codable, Identifiable{ //same
    var id = UUID() //makes unique id for each item
    var username: String
    var password: String
    var website: String
}
