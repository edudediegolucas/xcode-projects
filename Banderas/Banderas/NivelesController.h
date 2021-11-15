//
//  NivelesController.h
//  Banderas
//
//  Created by Eduardo de Diego lucas on 4/8/15.
//  Copyright (c) 2015 Eduardo de Diego lucas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NivelesController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>

@property(strong,nonatomic)NSArray *levelData;
@property(strong, nonatomic)NSString *continente;
@property int modo;
@property(strong, nonatomic)NSString *levelSelected;

@end
