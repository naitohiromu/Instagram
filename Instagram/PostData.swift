//
//  PostData.swift
//  Instagram
//
//  Created by naito.hiromu on 2023/06/16.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class PostData: NSObject {
    var id = ""
    var name = ""
    var caption = ""
    var date = ""
    var likes: [String] = []
    var isLiked: Bool = false

    init(document: QueryDocumentSnapshot) {
        self.id = document.documentID

        let postDic = document.data()

        if let name = postDic["name"] as? String {
            self.name = name
        }

        if let caption = postDic["caption"] as? String {
            self.caption = caption
        }

        if let timestamp = postDic["date"] as? Timestamp {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            self.date = formatter.string(from: timestamp.dateValue())
        }

        if let likes = postDic["likes"] as? [String] {
            self.likes = likes
        }

        if let myid = Auth.auth().currentUser?.uid {
            // likesの配列の中にmyidが含まれているかチェックすることで、自分がいいねを押しているかを判断
            if self.likes.firstIndex(of: myid) != nil {
                // myidがあれば、いいねを押していると認識する。
                self.isLiked = true
            }
        }
    }

    override var description: String {
        return "PostData: name=\(name); caption=\(caption); date=\(date); likes=\(likes.count); id=\(id);"
    }
}
