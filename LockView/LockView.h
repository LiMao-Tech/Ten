//
//  LockView.h
//  LockDemoOC
//
//  Created by gt on 15/11/24.
//  Copyright © 2015年 gt. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LockView;

@protocol LockViewDelegate <NSObject>

@optional
- (void)lockView:(LockView *)lockView didFinish:(NSString *)path;

@end

@interface LockView : UIView

@property(nonatomic,assign) id<LockViewDelegate> delegate;

@end
