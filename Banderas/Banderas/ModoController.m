//
//  ViewController.m
//  Banderas
//
//  Created by Eduardo de Diego lucas on 4/8/15.
//  Copyright (c) 2015 Eduardo de Diego lucas. All rights reserved.
//

#import "ModoController.h"
#import "NivelesController.h"

@interface ModoController ()

@property (strong, nonatomic) IBOutlet UILabel *labelOpcion;

- (IBAction)closeView:(id)sender;

//enum
enum{
    BANDERAS = 1,
    CAPITALES
};

@end

@implementation ModoController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Recibimos el continente elegido
    _labelOpcion.text = [NSString stringWithFormat:@"Ha elegido %@", _continente];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closeView:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NivelesController *n = segue.destinationViewController;
    n.continente = _continente;
    switch([sender tag]){
        case BANDERAS:
            n.modo = BANDERAS;
        break;
        case CAPITALES:
            n.modo = CAPITALES;
        break;
    }
}

@end
