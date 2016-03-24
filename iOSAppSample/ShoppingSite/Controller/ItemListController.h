//
//  ItemListController.h
//  ShoppingSite
//
//  Created by asakura hirofumi on 2015/01/01.
//  Copyright (c) 2015年 hirofumi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "ItemDetailController.h"

@interface ItemListController : UIViewController {
    
    NSString* _cateKey;
    NSString* _cateName;

}

@property (nonatomic) NSString* cateKey;
@property (nonatomic) NSString* cateName;

@property (weak, nonatomic) IBOutlet UINavigationItem *NaviItemList;
@property (weak, nonatomic) IBOutlet UIButton *ItemTitle;
@property (weak, nonatomic) IBOutlet UIButton *ItmImg;

- (IBAction)clickItem:(id)sender;


@end

