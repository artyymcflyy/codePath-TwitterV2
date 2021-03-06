//
//  User.swift
//  Twitter
//
//  Created by Arthur Burgin on 4/12/17.
//  Copyright © 2017 Arthur Burgin. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var name: String?
    var screenName: String?
    var profileUrl: URL?
    var profileBannerUrl: URL?
    var tagLine: String?
    var following: Int?
    var followers: Int?
    var totalTweets: Int?
    
    var dictionary: NSDictionary
    
    init(dictionary: NSDictionary){
        self.dictionary = dictionary
        
        name = dictionary["name"] as? String
        screenName = "@\(dictionary["screen_name"] ?? "")"
        
        let profileUrlString = dictionary["profile_image_url_https"] as? String
        if let profileUrlString = profileUrlString{
            profileUrl = URL(string: profileUrlString as String)
        }
        let profileBannerUrlString = dictionary["profile_banner_url"] as? String
        if let profileBannerUrlString = profileBannerUrlString{
            profileBannerUrl = URL(string: profileBannerUrlString as String)
        }
        
        tagLine = dictionary["description"] as? String
        
        followers = dictionary["followers_count"] as? Int
        following = dictionary["friends_count"] as? Int
        totalTweets = dictionary["statuses_count"] as? Int
        
    }
    
    static let userDidLogoutNotification = "UserDidLogout"
    
    static let fetchUserProfileNotification = "fetchUserProfile"
    
    static var _currentUser:User?
    
    class var currentUser: User?{
        get{
            if _currentUser == nil{
                let defaults = UserDefaults.standard
                
                let userData = defaults.object(forKey: "currentUser") as? Data
                
                if let userData = userData{
                    let dictionary = try! JSONSerialization.jsonObject(with: userData, options: []) as! NSDictionary
                    
                    _currentUser = User(dictionary: dictionary)
                }
            }
            return _currentUser
        }
        set(user){
            _currentUser = user
            
            let defaults = UserDefaults.standard
            
            if let user = user{
                let data = try! JSONSerialization.data(withJSONObject: user.dictionary, options: [])
                
                defaults.set(data, forKey: "currentUser")
            }else{
                defaults.removeObject(forKey: "currentUser")
            }
            
            defaults.synchronize()
        }
    }
    
}
