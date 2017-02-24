//
//  User.swift
//  ParseChat
//
//  Created by Xie kesong on 2/23/17.
//  Copyright © 2017 ___KesongXie___. All rights reserved.
//

import Foundation
import Parse

class User: PFUser{
}

extension PFUser{
    func sendMessage(text: String, completion completionHandler: @escaping (_ message: Message?, _ error: Error?) -> Void){
        let message = Message(text: text, user: self)
        message.saveInBackground { (succeed, error) in
            if succeed{
                completionHandler(message, nil)
            }else{
                completionHandler(nil, error)
            }
        }
    }

}
