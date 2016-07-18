//
//  CategoryController.h
//  ShoppingSite
//
//  Created by asakura hirofumi on 2014/12/31.
//  Copyright (c) 2014年 hirofumi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "ItemListController.h"

@interface CategoryController : UIViewController {

    NSString* _myValue;

}

extern const float CONST_BTN_RAD;

@property (nonatomic) NSString* myValue;

@property (weak, nonatomic) IBOutlet UIButton *BtnCateFood;
@property (weak, nonatomic) IBOutlet UIButton *BtnCateFashion;
@property (weak, nonatomic) IBOutlet UIButton *BtnCateElec;

- (IBAction)ClickCategoryList:(id)sender;

@end

