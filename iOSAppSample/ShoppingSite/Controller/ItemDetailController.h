//
//  ItemDetailController.h
//  ShoppingSite
//
//  Created by asakura hirofumi on 2015/01/01.
//  Copyright (c) 2015年 hirofumi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CartViewController.h"
#import "ItemListController.h"

@interface ItemDetailController : UIViewController {

    NSString* _fromScreenName;
    NSString* _cateName;
    NSString* _cateKey;
    NSString* _clickedItemTitle;
    NSString* _clieckedItemImg;

}

@property (nonatomic) NSString* fromScreenName;
@property (nonatomic) NSString* cateName;
@property (nonatomic) NSString* cateKey;
@property (nonatomic) NSString* clickedItemTitle;
@property (nonatomic) NSString* clieckedItemImg;

@property (weak, nonatomic) IBOutlet UITextView *ItemDetailTitle;
@property (weak, nonatomic) IBOutlet UIImageView *ItemDetailImg;
@property (weak, nonatomic) IBOutlet UITextField *ItemName;
@property (weak, nonatomic) IBOutlet UITextField *ItemPrice;
@property (weak, nonatomic) IBOutlet UITextField *ItemInventory;
@property (weak, nonatomic) IBOutlet UITextField *ItemDelivery;

- (IBAction)clickAddCart:(id)sender;

@end

