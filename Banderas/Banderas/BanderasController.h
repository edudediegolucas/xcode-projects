//
//  BanderasController.h
//  Banderas
//
//  Created by Eduardo de Diego lucas on 4/8/15.
//  Copyright (c) 2015 Eduardo de Diego lucas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BanderasController : UIViewController

@property(strong, nonatomic)NSString *continente;
@property(strong, nonatomic)NSString *levelSelected;
@property int total;
@property(strong, nonatomic)NSDictionary *countries;
@property(strong, nonatomic)NSString* bandera;
@property int aciertos;
@property int fallos;
@property(strong, nonatomic)NSMutableArray *array;

@end
