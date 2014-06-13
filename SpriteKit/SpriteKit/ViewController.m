//
//  ViewController.m
//  SpriteKit
//
//  Created by DANIEL ANNIS on 5/7/14.
//  Copyright (c) 2014 Dinky_Details. All rights reserved.
//

#import "ViewController.h"
#import "MainScene.h"



@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [[GameCenterManager sharedManager]setupManager];
    [[GameCenterManager sharedManager]setDelegate:self];

    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = NO;
    skView.showsNodeCount = NO;
    
    
    // Create and configure the scene.
    SKScene * scene = [MainScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

//- (NSUInteger)supportedInterfaceOrientations
//{
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
//        return UIInterfaceOrientationMaskAllButUpsideDown;
//    } else {
//        return UIInterfaceOrientationMaskAll;
//    }
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - GameCenterManager Delegate

- (void)gameCenterManager:(GameCenterManager *)manager authenticateUser:(UIViewController *)gameCenterLoginController {
    // Login Delegate
    [self presentViewController:gameCenterLoginController animated:YES completion:^{
#ifdef DEBUG
        NSLog(@"Finished Presenting Game Kit Authentication Controller");
#endif
    }];
}

- (void)gameCenterManager:(GameCenterManager *)manager availabilityChanged:(NSDictionary *)availabilityInformation {
    NSLog(@"Availability Information: %@", availabilityInformation);
}

/// Delegate Method called when the there is an error with GameCenter or GC Manager
- (void)gameCenterManager:(GameCenterManager *)manager error:(NSError *)error {
    NSLog(@"Error: %@", error);
}


@end
