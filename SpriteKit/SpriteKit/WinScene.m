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


-(id)initWithSize:(CGSize)size win:(NSInteger)score life:(int)lostLife jump:(int)successfulJump{
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
            
            if ([gameMechanics GetActiveLevel]==1 && lostLife <=0 && ![gameMechanics getMedal:@"special1"]) {
                [gameMechanics setMedal:YES :@"special1"];
            }
            
            if ([gameMechanics GetActiveLevel]==2 && lostLife <=0 && ![gameMechanics getMedal:@"special2"]) {
                [gameMechanics setMedal:YES :@"special2"];
            }

            if ([gameMechanics GetActiveLevel] == 1 && ![gameMechanics getMedal:@"bronze"]) {
                [gameMechanics setMedal:YES :@"bronze"];
            }
            
            if ([gameMechanics GetActiveLevel] == 2 && ![gameMechanics getMedal:@"silver"]) {
                [gameMechanics setMedal:YES :@"silver"];
            }
            
            if ([gameMechanics GetActiveLevel] == 3 && ![gameMechanics getMedal:@"gold"]) {
                [gameMechanics setMedal:YES :@"gold"];
            }
            
            if ([gameMechanics GetActiveLevel] == 4 && ![gameMechanics getMedal:@"platinum"]) {
                [gameMechanics setMedal:YES :@"platinum"];
            }
            
            if ([gameMechanics GetActiveLevel] == 5 && ![gameMechanics getMedal:@"diamond"]) {
                [gameMechanics setMedal:YES :@"diamond"];
            }

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

            if ([gameMechanics GetActiveLevel]!=5) {
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
@end
