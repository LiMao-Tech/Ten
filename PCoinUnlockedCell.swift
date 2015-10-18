//
//  PCoinUnlockedCell.swift
//  Ten
//
//  Created by gt on 15/10/18.
//  Copyright © 2015年 LiMao Tech. All rights reserved.
//

import UIKit

class PCoinUnlockedCell: UITableViewCell {
    var unlockedLabel:UILabel!
    var timeLabel:UILabel!
    var splitLine:UIView!
    var unlocked:PCoinUnlockedModel!{
        didSet{
            let text = "You Spent \(unlocked.value) P Coin to unlock Level4" as NSString
            let size = text.boundingRectWithSize(CGSizeMake( SCREEN_WIDTH-20, CGFloat(MAXFLOAT)), options: .UsesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(17)], context: nil)
            unlockedLabel = UILabel(frame: CGRectMake(10, 10, size.width, size.height))
            unlockedLabel.font = UIFont.systemFontOfSize(17)
            unlockedLabel.textColor = UIColor.orangeColor()
            unlockedLabel.text = text as String
            timeLabel = UILabel(frame: CGRectMake(10, 15+size.width, 200, 15))
            timeLabel.font = UIFont.systemFontOfSize(13)
            timeLabel.textColor = UIColor.whiteColor()
            timeLabel.text = unlocked.time
            splitLine = UIView(frame: CGRectMake(0, CGRectGetMaxY(timeLabel.frame)+5, SCREEN_WIDTH, 1))
            splitLine.backgroundColor = UIColor.whiteColor()
            self.addSubview(unlockedLabel)
            self.addSubview(timeLabel)
            self.addSubview(splitLine)
        }
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
