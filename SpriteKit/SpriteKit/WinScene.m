//
//  WinScene.m
//  SpriteKit
//
//  Created by DANIEL ANNIS on 5/29/14.
//  Copyright (c) 2014 Dinky_Details. All rights reserved.
//

#import "WinScene.h"

@implementation WinScene
AVAudioPlayer *_backgroundAudioPlayer;


-(id)initWithSize:(CGSize)size win:(NSInteger)score{
    [self startBackgroundMusic];
    if (self = [super initWithSize:size]) {
        
        //  [self runAction:[SKAction playSoundFileNamed:@"TempleFight.mp3" waitForCompletion:YES]];
        
        self.backgroundColor = [SKColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
        
        // text that goes to facebook as status
        statusText = [NSString stringWithFormat:@"I did %d points in Qwik Jump game. Try this its awesome!",[gameMechanics getTotalScore]+score];
        
        tmpScore = score;
        
        gameMechanics = [[GameMechanics alloc]init];

        // text that goes to facebook as status
        statusText = [NSString stringWithFormat:@"I just made %d points in Qwik Jump game. Its an iOS game, get it on your Phone now.",[gameMechanics getTotalScore]];
        
        if ([[GameCenterManager sharedManager] checkGameCenterAvailability]) {
            [[GameCenterManager sharedManager]saveAndReportScore:[gameMechanics getTotalScore]+score
                                                     leaderboard:@"qleaderboard1"
                                                       sortOrder:GameCenterSortOrderHighToLow];
        }
        
//
        if ([gameMechanics getTotalScore]+score >= 50 && ![gameMechanics getMedal:@"bronze"]) {
            [gameMechanics setMedal:YES :@"bronze"];
        }
        
        if ([gameMechanics getTotalScore]+score >= 100 && ![gameMechanics getMedal:@"silver"]) {
            [gameMechanics setMedal:YES :@"silver"];
        }
        
        if ([gameMechanics getTotalScore]+score >= 150 && ![gameMechanics getMedal:@"gold"]) {
            [gameMechanics setMedal:YES :@"gold"];
        }
        
        if ([gameMechanics getTotalScore]+score >= 300 && ![gameMechanics getMedal:@"platinum"]) {
            [gameMechanics setMedal:YES :@"platinum"];
        }
        
        if ([gameMechanics getTotalScore]+score >= 450 && ![gameMechanics getMedal:@"diamond"]) {
            [gameMechanics setMedal:YES :@"diamond"];
        }
        
        
        
        // Game Over Label
        SSBitmapFont *bitmapFont = [self bitmapFontForFile:@"ScorePanelFont"];
        gameWonLabel = [bitmapFont nodeFromString:@"YOU WON!"];
        gameWonLabel.position = ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)+200) : CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)+100));
        [self addChild:gameWonLabel];
        
        // show highscore
        highScoreLabel = [bitmapFont nodeFromString:[NSString stringWithFormat:@"Highscore: %d", [gameMechanics getTotalScore]+score]];
        highScoreLabel.position = ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)+80) : CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)+40));
        [self addChild:highScoreLabel];

        
        // Show score
        scoreLabel = [bitmapFont nodeFromString:[NSString stringWithFormat:@"Score: %d", score]];
        scoreLabel.position = ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)) : CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)));
        [self addChild:scoreLabel];
        

        
        [self createMenuButton];
        
        [self createReplayButton];
        
        [self createNextButton];
        
        [self createShareButton];
        
    }
    return self;
}

- (void)createMenuButton {
    //Add a Retry Button
    
    menu = [SKSpriteNode spriteNodeWithImageNamed:@"menu"];
    menu.position = ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ?
                     CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)-100) :
                     CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)-40));
    menu.zPosition = 0.3;
    [self addChild:menu];
}

- (void)createReplayButton {
    replay = [SKSpriteNode spriteNodeWithImageNamed:@"replay"];
    replay.position = ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ?
                       CGPointMake(CGRectGetMidX(self.frame), menu.position.y - (replay.size.height+40)) :
                       CGPointMake(CGRectGetMidX(self.frame), menu.position.y - (replay.size.height+20)));
    
    replay.zPosition = 0.3;
    [self addChild:replay];
}

- (void)createNextButton {
    next = [SKSpriteNode spriteNodeWithImageNamed:@"next"];
    next.position = ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ?
                     CGPointMake(CGRectGetMidX(self.frame), replay.position.y - (replay.size.height+40)) :
                     CGPointMake(CGRectGetMidX(self.frame), replay.position.y - (next.size.height+20)));
    next.zPosition = 0.3;
    [self addChild:next];
}

-(void)createShareButton{
    share = [SKSpriteNode spriteNodeWithImageNamed:@"share"];
    share.position = ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ?
                      CGPointMake(CGRectGetMidX(self.frame), next.position.y - (share.size.height+40)) :
                      CGPointMake(CGRectGetMidX(self.frame), next.position.y - (share.size.height+20)));
    share.zPosition = 0.3;
    [self addChild:share];
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint positionInScene = [touch locationInNode:self];
    
    if (CGRectContainsPoint(replay.frame, positionInScene)) {
        
#ifdef DEBUG
        NSLog(@"replay Button Tapped");
#endif
        
        // Set an action to the button
        [replay runAction:[SKAction sequence:@[[SKAction moveByX:0 y:-2 duration:0.1f], [SKAction moveByX:0 y:2 duration:0.1]]]completion:^{
            
            SKTransition *reveal = [SKTransition fadeWithDuration:.5f];
            MyScene *gameScene = [[MyScene alloc] initWithSize:self.size :[gameMechanics GetActiveLevel]];
            [self.scene.view presentScene:gameScene transition:reveal];
            
        }];
    } else if (CGRectContainsPoint(menu.frame, positionInScene)) {
        
#ifdef DEBUG
        NSLog(@"menu Button Tapped");
#endif
        
        // Set an action to the button
        [menu runAction:[SKAction sequence:@[[SKAction moveByX:0 y:-2 duration:0.1f], [SKAction moveByX:0 y:2 duration:0.1]]]completion:^{
            [gameMechanics addTotalScore:tmpScore];

                    [gameMechanics setLocalScores:[gameMechanics getTotalScore]];
            
            SKTransition *reveal = [SKTransition fadeWithDuration:.5f];
            MainScene *mainScene = [[MainScene alloc] initWithSize:self.size];
            [self.scene.view presentScene:mainScene transition:reveal];
            
        }];
    }
    else if (CGRectContainsPoint(next.frame, positionInScene)) {
        
#ifdef DEBUG
        NSLog(@"next Button Tapped");
#endif
        
        // Set an action to the button
        [next runAction:[SKAction sequence:@[[SKAction moveByX:0 y:-2 duration:0.1f], [SKAction moveByX:0 y:2 duration:0.1]]]completion:^{
            [gameMechanics addTotalScore:tmpScore];

            if ([gameMechanics GetActiveLevel]!=10) {
                SKTransition *reveal = [SKTransition fadeWithDuration:.5f];
                MyScene *gameScene = [[MyScene alloc] initWithSize:self.size :([gameMechanics GetActiveLevel]+1)];
                [self.scene.view presentScene:gameScene transition:reveal];
            }
            
        }];
    }
    else if (CGRectContainsPoint(share.frame, positionInScene)) {
        
#ifdef DEBUG
        NSLog(@"Share Button Tapped");
#endif
        
        // Set an action to the button
        [share runAction:[SKAction sequence:@[[SKAction moveByX:0 y:-2 duration:0.1f], [SKAction moveByX:0 y:2 duration:0.1]]]completion:^{
            
            [self onShareButtonTap];
        }];
    }
    
}

- (void)startBackgroundMusic
{
    NSError *err;
    NSURL *file = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"TempleFight.mp3" ofType:nil]];
    _backgroundAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:file error:&err];
    if (err) {
        NSLog(@"error in audio play %@",[err userInfo]);
        return;
    }
    [_backgroundAudioPlayer prepareToPlay];
    
    // this will play the music infinitely
    _backgroundAudioPlayer.numberOfLoops = -1;
    [_backgroundAudioPlayer setVolume:.5];
    [_backgroundAudioPlayer play];
}



- (SSBitmapFont *)bitmapFontForFile:(NSString *)filename
{
    // Generate a path to the font file
    NSString *path = [[NSBundle mainBundle] pathForResource:filename ofType:@"skf"];
    
    NSAssert(path, @"Could not find font file");
    
    // Create a new instance of SSBitmapFont using the font file and check for errors
    NSError *error;
    NSURL *url = [NSURL fileURLWithPath:path];
    SSBitmapFont *bitmapFont = [[SSBitmapFont alloc] initWithFile:url error:&error];
    
    NSAssert(!error, @"%@: %@", error.domain, error.localizedDescription);
    
    return bitmapFont;
}

#pragma mark - Facebook Sharing

// Perform check for active FBSession
-(void)onShareButtonTap{
    
    
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   @"Qwik Jump", @"name",
                                   @"Try this, its awesome!", @"caption",
                                    statusText, @"description",
                                   @"https://pixel-12.com", @"link",
                                   @"http://i.imgur.com/g3Qc1HN.png", @"picture",
                                   nil];
    
    // Show the feed dialog
    [FBWebDialogs presentFeedDialogModallyWithSession:nil
                                           parameters:params
                                              handler:^(FBWebDialogResult result, NSURL *resultURL, NSError *error) {
                                                  if (error) {
                                                      // An error occurred, we need to handle the error
                                                      // See: https://developers.facebook.com/docs/ios/errors
                                                      NSLog(@"Error publishing story: %@", error.description);
                                                  } else {
                                                      if (result == FBWebDialogResultDialogNotCompleted) {
                                                          // User cancelled.
                                                          NSLog(@"User cancelled.");
                                                      } else {
                                                          // Handle the publish feed callback
                                                          NSDictionary *urlParams = [self parseURLParams:[resultURL query]];
                                                          
                                                          if (![urlParams valueForKey:@"post_id"]) {
                                                              // User cancelled.
                                                              NSLog(@"User cancelled.");
                                                              
                                                          } else {
                                                              // User clicked the Share button
                                                              NSString *result = [NSString stringWithFormat: @"Posted story, id: %@", [urlParams valueForKey:@"post_id"]];
                                                              NSLog(@"result %@", result);
                                                          }
                                                      }
                                                  }
                                              }];
}

// A function for parsing URL parameters returned by the Feed Dialog.
- (NSDictionary*)parseURLParams:(NSString *)query {
    NSArray *pairs = [query componentsSeparatedByString:@"&"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    for (NSString *pair in pairs) {
        NSArray *kv = [pair componentsSeparatedByString:@"="];
        NSString *val =
        [kv[1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        params[kv[0]] = val;
    }
    return params;
}
    
//-(void)onShareButtonTap{
//    if (FBSession.activeSession.isOpen) {
//        
//        // Yes, we are open, so lets make a request for user details so we can get the user name.
//        
//        [self promptUserWithAccountNameForStatusUpdate];
//        
//        
//        
//    } else {
//        
//        // We don't have an active session in this app, so lets open a new facebook session with the appropriate permissions!
//        
//        // Firstly, construct a permission array. you can find more "permissions strings" at http://developers.facebook.com/docs/authentication/permissions/
//        
//        NSArray *permissions = [[NSArray alloc] initWithObjects:
//                                @"publish_actions",
//                                nil];
//        // OPEN Session!
//        [FBSession openActiveSessionWithPublishPermissions:permissions defaultAudience:FBSessionDefaultAudienceEveryone allowLoginUI:YES completionHandler:^(FBSession *session,
//                                                                                                                                                             FBSessionState status,
//                                                                                                                                                             NSError *error) {
//            // if login fails for any reason, we alert
//            if (error) {
//                
//                // show error to user.
//                
//            } else if (FB_ISSESSIONOPENWITHSTATE(status)) {
//                
//                // no error, so we proceed with requesting user details of current facebook session.
//                
//                [self promptUserWithAccountNameForStatusUpdate];
//            }
//        }];
//    }
//}
//
//-(void)promptUserWithAccountNameForStatusUpdate {
//    //    [self controlStatusUsable:NO];
//    [[FBRequest requestForMe] startWithCompletionHandler:
//     ^(FBRequestConnection *connection, NSDictionary<FBGraphUser> *user, NSError *error) {
//         if (!error) {
//             
//             UIAlertView *tmp = [[UIAlertView alloc]
//                                 initWithTitle:@"Publish to FB?"
//                                 message:[NSString stringWithFormat:@"Publish status to ""%@"" Account?", user.name]
//                                 delegate:self
//                                 cancelButtonTitle:nil
//                                 otherButtonTitles:@"No",@"Yes", nil];
//             tmp.tag = 200; // to update status
//             [tmp show];
//         }
//     }];
//}
//
//-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
//    
//    if (buttonIndex==1) { // yes answer
//        if (alertView.tag==200) {
//            // the post status
//            
//            [FBRequestConnection startForPostStatusUpdate:statusText completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
//                if (!error) {
//                    UIAlertView *tmp = [[UIAlertView alloc]
//                                        initWithTitle:@"Success"
//                                        message:@"Status Posted"
//                                        delegate:self
//                                        cancelButtonTitle:nil
//                                        otherButtonTitles:@"Ok", nil];
//                    
//                    [tmp show];
//                    
//                } else {
//                    UIAlertView *tmp = [[UIAlertView alloc]
//                                        initWithTitle:@"Error"
//                                        message:@"Some error happened"
//                                        delegate:self
//                                        cancelButtonTitle:nil
//                                        otherButtonTitles:@"Ok", nil];
//                    
//                    [tmp show];
//                }
//            }];
//        }
//        
//    }
//    
//}
@end
