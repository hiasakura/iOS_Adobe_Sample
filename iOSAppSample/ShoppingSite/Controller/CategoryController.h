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
#import "ItemSearchResultController.h"

@interface CategoryController : UIViewController {

    NSString* _myValue;

}

extern const float CONST_BTN_RAD;
extern NSString * const CONST_URL_NEW_YEAR_BANNER;

@property (nonatomic) NSString* myValue;

@property (weak, nonatomic) IBOutlet UIButton *BtnSearch;
@property (weak, nonatomic) IBOutlet UIButton *BtnCateFood;
@property (weak, nonatomic) IBOutlet UIButton *BtnCateFashion;
@property (weak, nonatomic) IBOutlet UIButton *BtnCateElec;
@property (weak, nonatomic) IBOutlet UIButton *BtnCateOutdoor;
@property (weak, nonatomic) IBOutlet UIButton *BtnCateBooks;
@property (weak, nonatomic) IBOutlet UIButton *BtnCateGames;
@property (weak, nonatomic) IBOutlet UIButton *BtnCateNursing;

@property (weak, nonatomic) IBOutlet UITextField *TextSearchKeyword;

- (IBAction)ClickSearch:(id)sender;
- (IBAction)ClickCategoryList:(id)sender;
- (IBAction)ClickNewYearBanner:(id)sender;

@end

