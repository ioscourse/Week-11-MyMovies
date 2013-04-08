//
//  Trailer1ViewController.m
//  MyMovies1
//
//  Created by Charles Konkol on 4/8/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//

#import "Trailer1ViewController.h"



@implementation Trailer1ViewController



- (void)viewDidLoad
{
    NSString *url = [[NSBundle mainBundle]
                     pathForResource:@"movie1"
                     ofType:@"mp4"];
    
    player = [[MPMoviePlayerController alloc]
              initWithContentURL:[NSURL fileURLWithPath:url]];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(movieFinishedCallback:)
     name:MPMoviePlayerPlaybackDidFinishNotification
     object:player];
    
    //—set the size of the movie view and then add it to the View window—
    player.view.frame = CGRectMake(10, 40, 550,250);
    [self.view addSubview:player.view];
    
    //—play movie—
    [player play];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
     //—called when the movie is done playing—
 - (void) movieFinishedCallback:(NSNotification*) aNotification {
         MPMoviePlayerController *moviePlayer = [aNotification object];
         [[NSNotificationCenter defaultCenter]
          removeObserver:self
          name:MPMoviePlayerPlaybackDidFinishNotification
          object:moviePlayer];
         [moviePlayer.view removeFromSuperview];
         [player release];
     }
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
    {
        // Return YES for supported orientations
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    }
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
