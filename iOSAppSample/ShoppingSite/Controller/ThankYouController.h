//
//  ThankYouController.h
//  ShoppingSite
//
//  Created by asakura hirofumi on 2015/01/01.
//  Copyright (c) 2015年 hirofumi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThankYouController : UIViewController {
    
    NSString* _fromCartView;
    NSString* _ItemId;
    NSString* _ItemName;
    NSString* _ItemPrice;
    
}

@property (nonatomic) NSString* fromCartView;
@property (nonatomic) NSString* ItemId;
@property (nonatomic) NSString* ItemName;
@property (nonatomic) NSString* ItemPrice;

- (IBAction)BackToTop:(id)sender;

@end