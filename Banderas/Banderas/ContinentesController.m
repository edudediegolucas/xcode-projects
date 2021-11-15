//
//  ContinentesController.m
//  Banderas
//
//  Created by Eduardo de Diego lucas on 4/8/15.
//  Copyright (c) 2015 Eduardo de Diego lucas. All rights reserved.
//

#import "ContinentesController.h"
#import "ModoController.h"

@interface ContinentesController ()

//enum
enum{
    AFRICA = 1,
    AMERICA,
    ASIA,
    EUROPA,
    OCEANIA,
    TODOS
};

@end

@implementation ContinentesController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ModoController *viewController = segue.destinationViewController;
    switch([sender tag]){
        case AFRICA:
            viewController.continente = @"AFRICA";
            break;
        case AMERICA:
            viewController.continente = @"AMERICA";
            break;
        case ASIA:
            viewController.continente = @"ASIA";
            break;
        case EUROPA:
            viewController.continente = @"EUROPA";
            break;
        case OCEANIA:
            viewController.continente = @"OCEANIA";
            break;
        case TODOS:
            viewController.continente = @"TODOS";
            break;
    }
}


@end
