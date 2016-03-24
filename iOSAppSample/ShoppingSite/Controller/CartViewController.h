//
//  CartViewController.h
//  ShoppingSite
//
//  Created by asakura hirofumi on 2015/01/01.
//  Copyright (c) 2015年 hirofumi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThankYouController.h"
#import "ItemDetailController.h"

@interface CartViewController : UIViewController {
    
    NSString* _fromItemDetail;
    NSString* _cateName;
    NSString* _cateKey;
    NSString* _selectedItemId;
    NSString* _selectedItemName;
    NSString* _selectedItemTitle;
    NSString* _selectedItemImg;
    NSString* _selectedItemPrice;
    NSString* _selectedItemDelivery;
    
}

@property (nonatomic) NSString* fromItemDetail;
@property (nonatomic) NSString* cateName;
@property (nonatomic) NSString* cateKey;
@property (nonatomic) NSString* selectedItemId;
@property (nonatomic) NSString* selectedItemName;
@property (nonatomic) NSString* selectedItemTitle;
@property (nonatomic) NSString* selectedItemImg;
@property (nonatomic) NSString* selectedItemPrice;
@property (nonatomic) NSString* selectedItemDelivery;

@property (weak, nonatomic) IBOutlet UITextField *ItemNam;
@property (weak, nonatomic) IBOutlet UITextField *ItemPrice;
@property (weak, nonatomic) IBOutlet UITextField *ItemDelivery;

- (IBAction)clickBuy:(id)sender;

@end