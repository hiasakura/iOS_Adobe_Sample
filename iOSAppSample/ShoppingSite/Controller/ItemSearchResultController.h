//
//  ItemSearchResultController.h
//  ShoppingSite
//
//  Created by asakura hirofumi on 2015/01/01.
//  Copyright (c) 2015年 hirofumi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "ItemDetailController.h"

@interface ItemSearchResultController : UIViewController {
    
    NSString* _myValue;

}

@property (nonatomic) NSString* myValue;

- (IBAction)clickItem:(id)sender;

@end
