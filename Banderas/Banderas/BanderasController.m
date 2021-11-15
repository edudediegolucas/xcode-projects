//
//  BanderasController.m
//  Banderas
//
//  Created by Eduardo de Diego lucas on 4/8/15.
//  Copyright (c) 2015 Eduardo de Diego lucas. All rights reserved.
//

#import "BanderasController.h"
#import "Country.h"
#import "ContinentesController.h"

@interface BanderasController ()
@property (strong, nonatomic) IBOutlet UILabel *labelMarcador;
@property (strong, nonatomic) IBOutlet UIButton *button1;
@property (strong, nonatomic) IBOutlet UIButton *button2;
@property (strong, nonatomic) IBOutlet UIButton *button3;
@property (strong, nonatomic) IBOutlet UIButton *button4;
@property (strong, nonatomic) IBOutlet UIImageView *imageBandera;
@property CGPoint pointMensaje;
- (IBAction)action1:(id)sender;
- (IBAction)action2:(id)sender;
- (IBAction)action3:(id)sender;
- (IBAction)action4:(id)sender;
- (IBAction)closeWindow:(id)sender;

enum{
    TAG = 0,
};

@end

@implementation BanderasController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Declaramos donde se van a situar los mensajes de acierto/fallo
    _pointMensaje.x = 180.0;
    _pointMensaje.y = 260.0;
    
    //Comprobamos si '_continente' es 'TODOS' para convertirlo a 'ALL'
    if([_continente isEqualToString:@"TODOS"]){
        _continente = @"all";
    }
    
    //Leemos el fichero json
    NSString *filePath = [[NSBundle mainBundle] pathForResource:[_continente lowercaseString] ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:nil];
    NSDictionary *root = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:nil];
    NSDictionary *continent = [root objectForKey:[_continente lowercaseString]];
    
    //Obtenemos el número de países y sus propiedades
    _total = [[continent objectForKey:@"total"] intValue];
    _countries = [continent objectForKey:@"countries"];
    _aciertos = 0;
    _fallos = 0;
    
    //Iniciamos el juego
    _array = [NSMutableArray arrayWithObjects: nil];
    [self calcularJuego];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Metodos clase

-(int)traducirLevelSelected{
    int level = 10;
    if([_levelSelected isEqualToString:@"10"]){
        level = 10;
    }
    if([_levelSelected isEqualToString:@"20"]){
        level = 20;
    }
    if([_levelSelected isEqualToString:@"30"]){
        level = 30;
    }
    if([_levelSelected isEqualToString:@"Todas"]){
        level = _total;
    }
    return level;
}

-(void)crearBandera:(long)tamanio{
    BOOL aniadido = false;
    while(!aniadido){
        //Calcular bandera
        Country* c = [self calcularBandera];
        for(int j=0;j<tamanio;j++){
            if([[_array objectAtIndex:j] isEqualToString:c.name]){
                //se ha encontrado
                aniadido = true;
                break;
            }
        }
        if(!aniadido){
            aniadido = true;
            [_array insertObject:c.name atIndex:_aciertos+_fallos];
            [self pintarBanderaMarcador:c];
        }else
            aniadido = false;
    }
}

-(Country *)calcularBandera{
    //Generamos numero aleatorio
    int num = arc4random_uniform(_total)+1;
    NSString *numPais = [NSString stringWithFormat:@"%@.%d", [_continente lowercaseString], num];
    NSDictionary *dic = [_countries objectForKey:numPais];
    
    //Creamos el objeto 'Country'
    Country *country =[[Country alloc] init];
    country = [country transformFromDictionary:dic];
    
    return country;
}

-(void)pintarBanderaMarcador:(Country *)country{
    _bandera = country.name;
    //NSLog(_bandera);
    
    //Pintamos la bandera
    NSString *filePath = [[NSBundle mainBundle] pathForResource:country.picture ofType:@"png"];
    NSData *imageData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:nil];
    UIImage *imagen = [UIImage imageWithData:imageData];
    [_imageBandera setImage:imagen];
    
    //Pintamos el marcador
    _labelMarcador.text = [NSString stringWithFormat:@"Aciertos: %d | Fallos: %d", _aciertos, _fallos];
}

-(void)calcularBotones{
    //Generamos cuatro numeros aleatorios NO repetidos
    Country *country1 = [self randomCountry];
    Country *country2 = [self randomCountry];
    Country *country3 = [self randomCountry];
    Country *country4 = [self randomCountry];
    
    //Asignamos los botones
    [_button1 setTitle:country1.name forState:UIControlStateNormal];
    [_button2 setTitle:country2.name forState:UIControlStateNormal];
    [_button3 setTitle:country3.name forState:UIControlStateNormal];
    [_button4 setTitle:country4.name forState:UIControlStateNormal];
    
    //Aleatoriamente forzamos a que un boton sea la solucion
    int numSolucion = arc4random_uniform(4)+1;
    switch (numSolucion) {
        case 1:
            [_button1 setTitle:_bandera forState:UIControlStateNormal];
            break;
        case 2:
            [_button2 setTitle:_bandera forState:UIControlStateNormal];
            break;
        case 3:
            [_button3 setTitle:_bandera forState:UIControlStateNormal];
            break;
        case 4:
            [_button4 setTitle:_bandera forState:UIControlStateNormal];
            break;
    }
}

-(Country *)randomCountry{
    BOOL ok = true;
    Country *country;
    while(ok){
        int num = arc4random_uniform(_total)+1;
        NSString *numPais = [NSString stringWithFormat:@"%@.%d", [_continente lowercaseString], num];
        NSDictionary *dic = [_countries objectForKey:numPais];
        country =[[Country alloc] init];
        country = [country transformFromDictionary:dic];
        if(![country.name isEqualToString:_bandera]){
            ok = false;
        }
    }
    return country;
}

-(void)calcularJuego{
    int level = [self traducirLevelSelected];
    long tamanio = [_array count];
    if(level == tamanio){
        //Pintamos el marcador
        _labelMarcador.text = [NSString stringWithFormat:@"Aciertos: %d | Fallos: %d", _aciertos, _fallos];
        //Hemos llegado al tamanio maximo
        NSString *mensaje;
        if(_aciertos>_fallos){
            if(_fallos==0){
                mensaje = @"¡ENHORABUENA!, ha acertado todas las banderas";
            }else{
                mensaje = @"¡Muy bien!, inténtelo la próxima vez";
            }
        }else{
            if(_aciertos==0){
                mensaje = @"¡LÁSTIMA!, debe esforzarse más...";
            }else{
                mensaje = @"¡Vaya!, la próxima vez le saldrá mejor";
            }
        }
        mensaje = [mensaje stringByAppendingString:@"\n¿Desea jugar otra vez?"];
        //Creamos la alerta con el mensaje
        UIAlertView *alerta = [[UIAlertView alloc]initWithTitle:@"¡FIN!" message:mensaje delegate:self cancelButtonTitle:@"No..." otherButtonTitles:@"¡Sí!", nil];
        alerta.tag = TAG;
        [alerta show];
        
        //Ocultamos los botones
        [_button1 setHidden:true];
        [_button2 setHidden:true];
        [_button3 setHidden:true];
        [_button4 setHidden:true];
    }else{
        //Recalculamos el juego
        [self crearBandera:tamanio];
        [self calcularBotones];
    }
}

#pragma mark - Metodos popUps y labels

- (void)showAcierto:(CGPoint)point {
    const CGFloat fontSize = 24;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"Helvetica-Bold" size:fontSize];
    label.text = @"Acierto!";
    label.textColor = [UIColor greenColor];
    [label sizeToFit];
    label.center = point;
    [self.view addSubview:label];
    
    [UIView animateWithDuration:0.7 delay:1 options:0 animations:^{
        label.alpha = 0;
    } completion:^(BOOL finished) {
        label.hidden = YES;
        [label removeFromSuperview];
    }];
}

- (void)showFallo:(CGPoint)point texto:(NSString*)string{
    const CGFloat fontSize = 14;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"Helvetica-Bold" size:fontSize];
    label.text = [NSString stringWithFormat:@"Fallo! Lo correcto era: %@", string];
    label.textColor = [UIColor redColor];
    [label sizeToFit];
    label.center = point;
    [self.view addSubview:label];
    
    [UIView animateWithDuration:0.7 delay:1 options:0 animations:^{
        label.alpha = 0;
    } completion:^(BOOL finished) {
        label.hidden = YES;
        [label removeFromSuperview];
    }];
}

- (void)showMessage:(NSString*)message atPoint:(CGPoint)point {
    const CGFloat fontSize = 24;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"Helvetica-Bold" size:fontSize];
    label.text = message;
    label.textColor = [UIColor blueColor];
    [label sizeToFit];
    label.center = point;
    [self.view addSubview:label];
    
    [UIView animateWithDuration:0.7 delay:1 options:0 animations:^{
        label.alpha = 0;
    } completion:^(BOOL finished) {
        label.hidden = YES;
        [label removeFromSuperview];
    }];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(alertView.tag == TAG){
        switch(buttonIndex){
            case 0:
                //Cancel button
                [self dismissViewControllerAnimated:YES completion:nil];
            break;
            case 1:
                //Accept button
                [self viewDidLoad];
                //Mostramos los botones
                [_button1 setHidden:false];
                [_button2 setHidden:false];
                [_button3 setHidden:false];
                [_button4 setHidden:false];
            break;
        }
    }
}


#pragma mark - Metodos botones

- (IBAction)action1:(id)sender {
    NSString *name1 = [_button1 currentTitle];
    if([name1 isEqualToString:_bandera]){
        [self showAcierto:_pointMensaje];
        _aciertos++;
    }else{
        [self showFallo:_pointMensaje texto:_bandera];
        _fallos++;
    }
    //Recalculamos el juego
    [self calcularJuego];
}

- (IBAction)action2:(id)sender {
    NSString *name2 = [_button2 currentTitle];
    if([name2 isEqualToString:_bandera]){
        [self showAcierto:_pointMensaje];
        _aciertos++;
    }else{
        [self showFallo:_pointMensaje texto:_bandera];
        _fallos++;
    }
    //Recalculamos el juego
    [self calcularJuego];
}

- (IBAction)action3:(id)sender {
    NSString *name3 = [_button3 currentTitle];
    if([name3 isEqualToString:_bandera]){
        [self showAcierto:_pointMensaje];
        _aciertos++;
    }else{
        [self showFallo:_pointMensaje texto:_bandera];
        _fallos++;
    }
    //Recalculamos el juego
    [self calcularJuego];
}

- (IBAction)action4:(id)sender {
    NSString *name4 = [_button4 currentTitle];
    if([name4 isEqualToString:_bandera]){
        [self showAcierto:_pointMensaje];
        _aciertos++;
    }else{
        [self showFallo:_pointMensaje texto:_bandera];
        _fallos++;
    }
    //Recalculamos el juego
    [self calcularJuego];
}

- (IBAction)closeWindow:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ContinentesController *c = segue.destinationViewController;
}

@end
