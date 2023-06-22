//
//  CommentTableViewCell.swift
//  Instagram
//
//  Created by naito.hiromu on 2023/06/16.
//

import UIKit
import FirebaseStorageUI

class CommentTableViewCell: UITableViewCell{
    @IBOutlet weak var commentLabel: UILabel!
    
    // PostDataの内容をセルに表示
    func setPostData(_ postData: PostData) {
        self.commentLabel.text = "\(postData.comments)"
    }
}
