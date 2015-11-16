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
            unlockedLabel.text = "You Spent \(unlocked.value) P Coin unlock Level4"
            timeLabel.text = unlocked.time
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        unlockedLabel = UILabel(frame: CGRectMake(10, 10, SCREEN_WIDTH-20, 20))
        unlockedLabel.font = UIFont.systemFontOfSize(17)
        unlockedLabel.textColor = UIColor.orangeColor()
        timeLabel = UILabel(frame: CGRectMake(10, CGRectGetMaxY(unlockedLabel.frame)+5, 200, 15))
        timeLabel.font = UIFont.systemFontOfSize(13)
        timeLabel.textColor = UIColor.whiteColor()
        splitLine = UIView(frame: CGRectMake(0, CGRectGetMaxY(timeLabel.frame)+14, SCREEN_WIDTH, 1))
        splitLine.backgroundColor = UIColor.whiteColor()
        self.addSubview(unlockedLabel)
        self.addSubview(timeLabel)
        self.addSubview(splitLine)
        self.backgroundColor = UIColor.blackColor()

        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
