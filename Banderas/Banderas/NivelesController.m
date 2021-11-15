//
//  NivelesController.m
//  Banderas
//
//  Created by Eduardo de Diego lucas on 4/8/15.
//  Copyright (c) 2015 Eduardo de Diego lucas. All rights reserved.
//

#import "NivelesController.h"
#import "BanderasController.h"
#import "CapitalesController.h"


@interface NivelesController ()
@property (strong, nonatomic) IBOutlet UIPickerView *pickerLevel;
@property (strong, nonatomic) IBOutlet UILabel *labelTipo;
- (IBAction)buttonContinue:(id)sender;

//enum
enum{
    BANDERAS = 1,
    CAPITALES
};

@end

@implementation NivelesController

- (void)viewDidLoad {
    [super viewDidLoad];
    _levelData = @[@"10", @"20", @"30", @"Todas"];
    _pickerLevel.dataSource = self;
    _pickerLevel.delegate = self;
    switch(_modo){
        case BANDERAS:
            _labelTipo.text = @"¿Cuántas banderas quiere adivinar?";
            break;
        case CAPITALES:
            _labelTipo.text = @"¿Cuántas capitales quiere adivinar?";
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)closeWindow:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


// The number of columns of data
- (long)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// The number of rows of data
- (long)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _levelData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return _levelData[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    _levelSelected = _levelData[row];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    BanderasController *b;
    CapitalesController *c;
    switch(_modo){
        case BANDERAS:
            b = segue.destinationViewController;
            b.continente = _continente;
            b.levelSelected = _levelSelected;
        break;
        case CAPITALES:
            c = segue.destinationViewController;
            c.continente = _continente;
            c.levelSelected = _levelSelected;
        break;
    }
}

- (IBAction)buttonContinue:(id)sender {
    switch(_modo){
        case BANDERAS:
            [self performSegueWithIdentifier:@"1" sender:self];
            break;
        case CAPITALES:
            [self performSegueWithIdentifier:@"2" sender:self];
            break;
    }
}
@end
