//
//  ViewController.m
//  MoviesRecord
//
//  Created by Eduardo de Diego lucas on 5/1/15.
//  Copyright (c) 2015 Eduardo de Diego lucas. All rights reserved.
//

#import "ViewController.h"
#import "InfoViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Initialize movies
    _movies = [[NSMutableArray alloc] init];
    
    //Create one movie - Terminator
    Movie *movie = [[Movie alloc] init];
    movie.title = @"Terminator";
    movie.genre = @"Action/Sciencie-Fiction";
    movie.year = 1984;
    movie.director = @"James Cameron";
    movie.star = @"Arnold Schwarzenegger";
    movie.company = @"Orion";
    movie.cover = [UIImage imageNamed:@"terminator.jpg"];
    movie.plot = @"On May 12, 1984, two beings from the year 2029 arrive in Los Angeles: one is a Terminator T-800 Model 101 (Arnold Schwarzenegger), a cyborg assassin programmed to kill a woman named Sarah Connor (Linda Hamilton); the other is Kyle Reese (Michael Biehn), a human resistance fighter sent to protect her. After the Terminator kills Sarah's roommate Ginger (Bess Motta), and two other women named \"Sarah Connor\" listed in the telephone directory, it eventually tracks its target to a nightclub. Kyle shows up and saves Sarah from the Terminator's attack, and the two escape.\n\nKyle explains to Sarah that in the near future, an artificial intelligence defense network called Skynet will become self-aware and initiate a nuclear holocaust of mankind, also explaining that he himself was born after it. Sarah's yet-to-be-conceived son John will rally the survivors and lead a resistance movement against Skynet and its army of machines. With the Resistance on the verge of victory, Skynet has sent a Terminator back in time to kill Sarah before John is born, as a last-ditch effort to avert the formation of the Resistance. The Terminator is an efficient killing machine with a powerful metal endoskeleton, but with an external layer of living tissue that makes it resemble a human being.\n\nKyle and Sarah are again attacked by the Terminator, leading to a car chase. Their cars eventually crash and break down. Kyle and Sarah are caught by the police, but the Terminator disappears. Kyle is questioned by criminal psychologist Dr. Silberman (Earl Boen) who concludes that he is paranoid and delusional. Sarah is also questioned by Lieutenant Traxler (Paul Winfield) and Sergeant Vukovich (Lance Henriksen) about the events that happened. The Terminator attacks the police station, killing many police officers, including Traxler and Vukovich, in its attempt to locate Sarah; however, Sarah and Kyle manage to escape and seek refuge in a motel. Kyle confesses that he has long been in love with Sarah; her son John had inexplicably given him given a photograph of her shortly after he met John. Sarah reciprocates Kyle's feelings and they have sex.\n\nLater that night, the Terminator tracks them to the motel and Kyle and Sarah escape in a pickup truck. In the ensuing chase, Kyle throws pipe bombs at the Terminator in an effort to destroy it. Kyle is wounded by the Terminator's gunfire; Sarah manages to knock the Terminator off its motorbike but loses control of the pickup truck, which flips over. As the Terminator gets up, it is struck by a gasoline tank truck that drags it a short distance. The Terminator hijacks the truck and resumes the chase. Kyle slides a pipe bomb on to the truck's fuel trailer causing a massive explosion. The Terminator emerges from the burning truck and collapses, seemingly destroyed.\n\nThe Terminator, with its flesh covering burned away, unexpectedly rises up and continues to pursue them into a factory. Kyle attacks the Terminator with a metal pipe but it knocks him down. Though dazed, he jams his final pipe bomb into its abdomen, causing an explosion which severely damages it; the explosion kills Kyle and injures Sarah. Now a one-armed torso and still partially functional, the Terminator resumes its attempt to kill Sarah. She leads it into a hydraulic press which crushes and finally deactivates it. Sarah is later taken out of the factory by an ambulance as Kyle's body is taken away.\n\nSeveral months later, a pregnant Sarah is traveling through Mexico. Along the way she records audio tapes which she intends to pass on to her unborn son, John. She debates whether to tell him that Kyle is his father. While stopping at a gas station, a small boy takes a Polaroid photograph of her which she purchases—the same photograph that John will later give Kyle. Sarah then drives on toward approaching storm clouds.";
    [_movies addObject:movie];
    
    //Create another movie - Die hard
    movie = [[Movie alloc] init];
    movie.title = @"Die hard";
    movie.genre = @"Action";
    movie.year = 1988;
    movie.director = @"John McTiernan";
    movie.star = @"Bruce Willis";
    movie.company = @"20th Century Fox";
    movie.cover = [UIImage imageNamed:@"dieHard.jpg"];
    movie.plot = @"On Christmas Eve, New York City Police Detective Lieutenant John McClane arrives in Los Angeles to reconcile with his estranged wife, Holly. McClane is driven to the Nakatomi Plaza building for a company Christmas party by Argyle. While McClane changes clothes, the party is disrupted by the arrival of Hans Gruber and his heavily armed group: Karl, Franco, Tony, Theo, Alexander, Marco, Kristoff, Eddie, Uli, Heinrich, Fritz, and James. The group seize the tower and secure those inside as hostages except for McClane who manages to slip away.\n\nGruber singles out Nakatomi executive Joseph Takagi claiming he intends to teach the Corporation a lesson for its greed. Away from the hostages, Gruber interrogates Takagi for the code to the building's vault. Gruber admits that they are using terrorism as a distraction while they attempt to steal $640 million in bearer bonds in the vault. Takagi refuses to cooperate and is executed by Gruber as McClane secretly observes. McClane accidentally gives himself away and is pursued by Tony. McClane manages to kill Tony, taking his weapon and radio, which he uses to contact the Los Angeles Police Department (LAPD). Sgt. Al Powell is sent to investigate, while Gruber sends Heinrich and Marco to stop McClane but both of them ended up getting killed by McClane. Powell, having been greeted by Eddie, who poses as a receptionist, finds nothing strange about the building. He attempts to leave, but McClane drops Marco's corpse onto Powell's car, alerting the LAPD who surround the building. McClane takes Heinrich's bag containing C-4 explosives and detonators.\n\nA SWAT team assaults the building, but the attack is anticipated, and James and Alexander massacre the SWAT team with rockets. McClane uses the C-4 to blow up the building floor occupied by James and Alexander, killing them both. Holly's coworker Harry Ellis attempts to mediate between Hans and McClane for the return of the detonators. McClane refuses to return them, causing Gruber to execute Ellis. While checking the explosives attached to the roof, Gruber is confronted by McClane. Gruber passes himself off as an escaped hostage and is given a gun by McClane. Gruber attempts to shoot McClane but finds that the gun is unloaded. Before McClane can act, Karl, Franco, and Fritz arrive. McClane kills Fritz and Franco, but is forced to flee, leaving the detonators behind.\n\nFBI agents arrive and take command of the police situation outside, ordering the building's power be shut off. The power loss disables the vault's final lock as Gruber had anticipated. Gruber demands that a helicopter arrive on the roof for transport—his intention is to detonate the explosives on the roof to kill the hostages and to fake the deaths of his men and himself. Karl finds McClane and the two fight. Meanwhile Gruber views a news report by Richard Thornburg that features McClane's children, causing Gruber to realize that McClane is Holly's husband. The terrorists order the hostages to the roof, but Gruber takes Holly with him to use against McClane. McClane seemingly kills Karl and heads to the roof. He kills Uli and sends the hostages back downstairs before the explosives detonate, destroying the roof and the FBI helicopter.\n\nTheo goes to the parking garage to retrieve their getaway vehicle but is knocked unconscious by Argyle who had been trapped in the garage during the siege. A weary McClane finds Holly with Gruber and his remaining men and knocks Kristoff unconscious. McClane surrenders his machine gun to spare Holly, but then distracts Gruber and Eddie by laughing, allowing him to grab a concealed handgun (holding his last two bullets) taped to his back. McClane shoots Gruber in the shoulder and then kills Eddie with his final shot. Gruber is sent crashing through a window. Gruber prevents himself from falling by holding onto Holly by her watch. McClane manages to release the watch and Gruber falls to his death on the street below.\n\nMcClane and Holly are escorted from the building and meet Powell in person. Karl emerges from the building disguised as a hostage and attempts to shoot McClane, but he is gunned down by Powell. Argyle crashes through the parking garage door in the limo. Thornburg arrives and attempts to interview McClane, but is punched by Holly. McClane and Holly are driven away by Argyle.";
    [_movies addObject:movie];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - TableView Methods

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Select the cell to modifiy and show
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    //Select the first element in the Movies array
    Movie *movie = [_movies objectAtIndex:indexPath.row];
    UILabel *label = (UILabel *) [cell viewWithTag:42];
    label.text = movie.title;
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [_movies count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    InfoViewController *infoViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"InfoViewController"];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:infoViewController];
    infoViewController.movieSelected = [_movies objectAtIndex:indexPath.row];
    [self presentViewController:navigationController animated:YES completion:nil];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [_movies removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - NewMovie Methods

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"segue"]){
        UINavigationController *navigationController = (UINavigationController *)segue.destinationViewController;
        NewMovieViewController *newMovieViewController = (NewMovieViewController *)navigationController.topViewController;
        newMovieViewController.movies = _movies;
        newMovieViewController.delegate = self;
    }
}

-(void)newMoviewViewController:(NewMovieViewController *)controller createdNewMovie:(Movie *)newMovie{
    int newRow = [_movies count];
    [_movies addObject:newMovie];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRow inSection:0];
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
