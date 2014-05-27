//
//  ViewController.m
//  testApp
//
//  Created by Jesse James on 12/18/13.
//  Copyright (c) 2013 Full Sail. All rights reserved.
//

#import "ViewController.h"
#import "MovieInfo.h"
#import "TheaterInfo.h"
#import "CustomCell.h"
#import "CustomTheaterCell.h"
#import "DetailViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    movies = [[NSMutableArray alloc]init];
    movies2 = [[NSMutableArray alloc]init];
    movies3 = [[NSMutableArray alloc]init];
    theaters = [[NSMutableArray alloc]init];
    TheaterInfo *theater1 = [[TheaterInfo alloc]initWithTitle:@"Harkins North Valley 16" location:@"Phoenix, AZ" image:[UIImage imageNamed:@"theater1.jpg"]];
    TheaterInfo *theater2 = [[TheaterInfo alloc]initWithTitle:@"Harkins Theaters Arcadia 8" location:@"Phoenix, AZ" image:[UIImage imageNamed:@"theater2.jpg"]];
    TheaterInfo *theater3 = [[TheaterInfo alloc]initWithTitle:@"Harkins Theaters Norterra 14" location:@"Phoenix, AZ" image:[UIImage imageNamed:@"theater3.jpg"]];
    MovieInfo *movie1 = [[MovieInfo alloc]initWithTitle:@"http://trailers.apple.com/trailers/wb/thehobbitthedesolationofsmaug/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"9:00AM",@"10:00AM",@"12:00PM", nil] names:@"The Hobbit The Desolation of Smaug" trailer:[NSURL URLWithString:@"http://trailers.apple.com/movies/wb/thehobbit2/thehobbitdesolationofsmaug-tlr1_r640s.mov"]theaterLoc:theater1];
    MovieInfo *movie2 = [[MovieInfo alloc]initWithTitle:@"http://trailers.apple.com/trailers/paramount/anchorman2/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"9:15AM",@"10:30AM",@"11:30AM", nil] names:@"Anchorman 2 The Legend Continues" trailer:[NSURL URLWithString:@"http://trailers.apple.com/movies/paramount/anchorman2/anchorman2-tlr3_480p.mov"]theaterLoc:theater1];
    MovieInfo *movie3 = [[MovieInfo alloc]initWithTitle:@"http://trailers.apple.com/trailers/lions_gate/tylerperrysamadeachristmas/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"11:10AM",@"1:15PM",@"4:10PM", nil] names:@"A Madea Christmas" trailer:[NSURL URLWithString:@"http://movietrailers.apple.com/movies/lionsgate/amadeachristmas/amadeachristmas-tlr2_480p.mov"] theaterLoc:theater1];
    MovieInfo *movie4 = [[MovieInfo alloc] initWithTitle:@"http://trailers.apple.com/trailers/disney/savingmrbanks/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"4:00PM",@"7:50PM",@"9:50PM", nil] names:@"Saving Mr. Banks" trailer:[NSURL URLWithString:@"http://movietrailers.apple.com/movies/disney/savingmrbanks/savingmrbanks-tlr1_480p.mov"] theaterLoc:theater1];
    MovieInfo *movie5 = [[MovieInfo alloc]initWithTitle:@"http://trailers.apple.com/trailers/fox/walkingwithdinosaurs/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"2:35PM",@"4:45PM",@"7:00PM", nil] names:@"Walking with Dinosaurs" trailer:[NSURL URLWithString:@"http://movietrailers.apple.com/movies/fox/walkingwithdinosaurs/walkingwithdinosaurs-tsr_480p.mov"] theaterLoc:theater1];
    
    MovieInfo *movie6 = [[MovieInfo alloc]initWithTitle:@"http://trailers.apple.com/trailers/lions_gate/thefrozenground/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"9:00AM",@"10:00AM",@"12:00PM", nil] names:@"The Frozen Ground" trailer:[NSURL URLWithString:@"http://movietrailers.apple.com/movies/lionsgate/thefrozenground/thefrozenground-tlr1_480p.mov"]theaterLoc:theater2];
    MovieInfo *movie7 = [[MovieInfo alloc]initWithTitle:@"http://trailers.apple.com/trailers/disney/frozen/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"9:15AM",@"10:30AM",@"11:30AM", nil] names:@"Frozen" trailer:[NSURL URLWithString:@"http://movietrailers.apple.com/movies/disney/frozen/frozen-tlr1_480p.mov"]theaterLoc:theater2];
    MovieInfo *movie8 = [[MovieInfo alloc]initWithTitle:@"http://trailers.apple.com/trailers/summit/endersgame/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"11:10AM",@"1:15PM",@"4:10PM", nil] names:@"Ender's Game" trailer:[NSURL URLWithString:@"http://movietrailers.apple.com/movies/summit/endersgame/endersgame-tlr2-58w33_480p.mov"] theaterLoc:theater2];
    MovieInfo *movie9 = [[MovieInfo alloc] initWithTitle:@"http://trailers.apple.com/trailers/lions_gate/oneforthemoney/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"4:00PM",@"7:50PM",@"9:50PM", nil] names:@"One for the Money" trailer:[NSURL URLWithString:@"http://movietrailers.apple.com/movies/lionsgate/oneforthemoney/oneforthemoney-tlr1_480p.mov"] theaterLoc:theater2];
    MovieInfo *movie10 = [[MovieInfo alloc]initWithTitle:@"http://trailers.apple.com/trailers/independent/reddawn/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"2:35PM",@"4:45PM",@"7:00PM", nil] names:@"Red Dawn" trailer:[NSURL URLWithString:@"http://movietrailers.apple.com/movies/independent/reddawn2/reddawn-tlr1_480p.mov"] theaterLoc:theater2];
    
    MovieInfo *movie11 = [[MovieInfo alloc]initWithTitle:@"http://trailers.apple.com/trailers/sony_pictures/cloudywithachanceofmeatballs2/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"9:00AM",@"10:00AM",@"12:00PM", nil] names:@"Cloudy with a Chance of Meatballs 2" trailer:[NSURL URLWithString:@"http://movietrailers.apple.com/movies/sony_pictures/cloudywithachanceofmeatballs2/cloudymeatballs2-tlr1_480p.mov"]theaterLoc:theater3];
    MovieInfo *movie12 = [[MovieInfo alloc]initWithTitle:@"http://trailers.apple.com/trailers/universal/despicableme2/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"9:15AM",@"10:30AM",@"11:30AM", nil] names:@"Despicable Me 2" trailer:[NSURL URLWithString:@"http://movietrailers.apple.com/movies/universal/despicableme2/despicableme2-dm32-tlr2_480p.mov"]theaterLoc:theater3];
    MovieInfo *movie13 = [[MovieInfo alloc]initWithTitle:@"http://trailers.apple.com/trailers/dreamworks/thecroods/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"11:10AM",@"1:15PM",@"4:10PM", nil] names:@"The Croods" trailer:[NSURL URLWithString:@"http://movietrailers.apple.com/movies/dreamworks/thecroods/croods-tlr2_480p.mov"] theaterLoc:theater3];
    MovieInfo *movie14 = [[MovieInfo alloc] initWithTitle:@"http://trailers.apple.com/trailers/universal/fastfurious6/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"4:00PM",@"7:50PM",@"9:50PM", nil] names:@"Fast and Furious 6" trailer:[NSURL URLWithString:@"http://movietrailers.apple.com/movies/universal/fastandfurious6/fastandfurious6-tlr3_480p.mov"] theaterLoc:theater3];
    MovieInfo *movie15 = [[MovieInfo alloc]initWithTitle:@"http://trailers.apple.com/trailers/paramount/worldwarz/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"2:35PM",@"4:45PM",@"7:00PM", nil] names:@"World War Z" trailer:[NSURL URLWithString:@"http://movietrailers.apple.com/movies/paramount/worldwarz/worldwarz-tlr2_480p.mov"] theaterLoc:theater3];
    [movies addObject:movie1];
    [movies addObject:movie2];
    [movies addObject:movie3];
    [movies addObject:movie4];
    [movies addObject:movie5];
    [movies2 addObject:movie6];
    [movies2 addObject:movie7];
    [movies2 addObject:movie8];
    [movies2 addObject:movie9];
    [movies2 addObject:movie10];
    [movies3 addObject:movie11];
    [movies3 addObject:movie12];
    [movies3 addObject:movie13];
    [movies3 addObject:movie14];
    [movies3 addObject:movie15];
    [theaters addObject:theater1];
    [theaters addObject:theater2];
    [theaters addObject:theater3];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section == 0) {
        return 5;
    }
    else if (section == 1)
    {
        return 5;
    }
    else if (section == 2)
    {
        return 5;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomMovieCell" owner:self options:nil];
    CustomCell *cell = (CustomCell *) [nib objectAtIndex:0];
    if (cell != nil) {
        if ([indexPath section] == 0) {
            MovieInfo *info = [movies objectAtIndex:indexPath.row];
            NSURL *imageURL = [NSURL URLWithString:info.movieIcon];
            NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
            UIImage *image = [UIImage imageWithData:imageData];            
            cell.movieTitle.text = info.movieName;
            cell.movieImage.image = image;
            cell.movieTime.text = [info timesForMovies];
        }else if ([indexPath section] == 1)
        {
            MovieInfo *info2 = [movies2 objectAtIndex:indexPath.row];
            NSURL *imageURL = [NSURL URLWithString:info2.movieIcon];
            NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
            UIImage *image = [UIImage imageWithData:imageData];
            cell.movieTitle.text = info2.movieName;
            cell.movieImage.image = image;
            cell.movieTime.text = [info2 timesForMovies];
        }else if ([indexPath section] == 2)
        {
            MovieInfo *info3 = [movies3 objectAtIndex:indexPath.row];
            NSURL *imageURL = [NSURL URLWithString:info3.movieIcon];
            NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
            UIImage *image = [UIImage imageWithData:imageData];
            cell.movieTitle.text = info3.movieName;
            cell.movieImage.image = image;            
            cell.movieTime.text = [info3 timesForMovies];
        }
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailView = [[DetailViewController alloc]initWithNibName:@"DetailViewController" bundle:nil];
    if (detailView != nil) {        
        MovieInfo *info = [movies objectAtIndex:indexPath.row];
        MovieInfo *info2 = [movies2 objectAtIndex:indexPath.row];
        MovieInfo *info3 = [movies3 objectAtIndex:indexPath.row];        
        if ([indexPath section] == 0) {
            detailView.movieDetails = info;
        }else if ([indexPath section] == 1)
        {
            detailView.movieDetails = info2;
        }else if ([indexPath section] == 2)
        {
            detailView.movieDetails = info3;
        }
        [self presentViewController:detailView animated:YES completion:nil];
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSArray *header = [[NSBundle mainBundle]loadNibNamed:@"CustomTheaterView" owner:self options:nil];
    CustomTheaterCell *view = (CustomTheaterCell *) [header objectAtIndex:0];
    TheaterInfo *theater = [theaters objectAtIndex:section];
    view.backgroundColor = [UIColor greenColor];
    if (view) {
        if (section == 0) {
            UIImage *images = theater.theaterImage;
            NSString *tName = theater.nameOfTheater;
            NSString *tlocation = theater.locationOfTheater;
            view.theaterImage.image = images;
            view.theaterLocation.text = tlocation;
            view.theaterName.text = tName;
        }else if (section == 1)
        {
            TheaterInfo *theater = [theaters objectAtIndex:1];
            UIImage *images = theater.theaterImage;
            NSString *tName = theater.nameOfTheater;
            NSString *tlocation = theater.locationOfTheater;
            view.theaterImage.image = images;
            view.theaterLocation.text = tlocation;
            view.theaterName.text = tName;
        }else if (section == 2)
        {
            TheaterInfo *theater = [theaters objectAtIndex:2];
            UIImage *images = theater.theaterImage;
            NSString *tName = theater.nameOfTheater;
            NSString *tlocation = theater.locationOfTheater;
            view.theaterImage.image = images;
            view.theaterLocation.text = tlocation;
            view.theaterName.text = tName;
        }
    }
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}


@end
