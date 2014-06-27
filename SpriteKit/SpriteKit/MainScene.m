//
//  MainScene.m
//  SpriteKit
//
//  Created by DANIEL ANNIS on 5/28/14.
//  Copyright (c) 2014 Dinky_Details. All rights reserved.
//

#import "MainScene.h"


@implementation MainScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        // setup your scene here
        
        gameMechanics = [[GameMechanics alloc]init];
        [gameMechanics setActiveLevel:1];
        
        [self createBackground];
        [self createPlayButton];
        [self createHelpButton];
        [self createCreditsButton];
        [self createLeaderboardButton];
        [self createAchievementButton];
        [self createHighscoreButton];
    }
    return self;
}


// create background
-(void) createBackground{
    SKTexture *bgTexture = [SKTexture textureWithImageNamed:@"mainBG"];
    self.background = [SKSpriteNode spriteNodeWithTexture:bgTexture];
    self.background.position = (CGPoint) {CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)};
    [self addChild:self.background];
}

// create Play button
- (void) createPlayButton {
    self.playButton = [SKSpriteNode spriteNodeWithImageNamed:@"play"];
    self.playButton.position = (CGPoint) {CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)+self.playButton.size.height};
    [self addChild:self.playButton];
}


-(void)createLeaderboardButton{
    self.leaderBoardButton = [SKSpriteNode spriteNodeWithImageNamed:@"leaderboard"];
    self.leaderBoardButton.position = (CGPoint) {CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - self.leaderBoardButton.frame.size.height/2};
    [self addChild:self.leaderBoardButton];
}

-(void)createAchievementButton{
    self.achievementButton = [SKSpriteNode spriteNodeWithImageNamed:@"achievement"];
    self.achievementButton.position = (CGPoint) {CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - self.achievementButton.frame.size.height * 2};
    [self addChild:self.achievementButton];
}

-(void)createHighscoreButton{
    self.highScore = [SKSpriteNode spriteNodeWithImageNamed:@"highScore"];
    self.highScore.position = (CGPoint) {CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)-self.highScore.frame.size.height*3.5};;
    [self addChild:self.highScore];
}

// create help button
-(void)createHelpButton {
    self.helpButton = [SKSpriteNode spriteNodeWithImageNamed:@"howTo"];
    self.helpButton.position = (CGPoint) {CGRectGetMidX(self.frame)+self.helpButton.size.width*0.6, CGRectGetMidY(self.frame)-self.helpButton.frame.size.height * 5};
    [self addChild:self.helpButton];
}

// create credits button
-(void) createCreditsButton {
    self.creditsButton = [SKSpriteNode spriteNodeWithImageNamed:@"credits"];
    self.creditsButton.position = (CGPoint) {CGRectGetMidX(self.frame)-self.creditsButton.size.width*0.6, CGRectGetMidY(self.frame) - self.creditsButton.frame.size.height * 5};
    [self addChild:self.creditsButton];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    // Get the touch
    UITouch *touch = [touches anyObject];
    
    // Get the position in the scene
    CGPoint positionInScene = [touch locationInNode:self];
    
    // Check if the Play button is tapped
    if (CGRectContainsPoint(self.playButton.frame, positionInScene))
    {
#ifdef DEBUG
        NSLog(@"Play button tapped");
#endif
        
        // Set an action to the button
        [self.playButton runAction:[SKAction sequence:@[[SKAction moveByX:0 y:-2 duration:0.1f], [SKAction moveByX:0 y:2 duration:0.1f]]] completion:^{
            
            [gameMechanics setTotalScore:0];
            
            NSLog(@"total scor = %d",[gameMechanics getTotalScore]);
            
            SKTransition *reveal = [SKTransition fadeWithDuration:.5f];
            MyScene *gameScene = [[MyScene alloc] initWithSize:self.size :[gameMechanics GetActiveLevel]];
            [self.scene.view presentScene:gameScene transition:reveal];
        }];
    } // End Play button tapped
    
    
    // Check if the help button is tapped
    else if (CGRectContainsPoint(self.helpButton.frame, positionInScene))
    {
#ifdef DEBUG
        NSLog(@"Help button tapped");
#endif
        
        // Set an action to the button
        [self.helpButton runAction:[SKAction sequence:@[[SKAction moveByX:0 y:-2 duration:0.1f], [SKAction moveByX:0 y:2 duration:0.1f]]] completion:^{
            
            SKTransition *reveal = [SKTransition fadeWithDuration:.5f];
            HelpScene *helpScene = [[HelpScene alloc] initWithSize:self.size];
            [self.scene.view presentScene:helpScene transition:reveal];
        }];
    } // End Help button pressed
    
    
    // Check if the Credits button is tapped
    else if (CGRectContainsPoint(self.creditsButton.frame, positionInScene))
    {
#ifdef DEBUG
        NSLog(@"Help button tapped");
#endif
        
        // Set an action to the button
        [self.creditsButton runAction:[SKAction sequence:@[[SKAction moveByX:0 y:-2 duration:0.1f], [SKAction moveByX:0 y:2 duration:0.1f]]] completion:^{
            
            SKTransition *reveal = [SKTransition fadeWithDuration:.5f];
            CreditsScene *helpScene = [[CreditsScene alloc] initWithSize:self.size];
            [self.scene.view presentScene:helpScene transition:reveal];
        }];
    } // End Credits button pressed
    
    
    // Check if the LeaderBoard button is tapped
    else if (CGRectContainsPoint(self.leaderBoardButton.frame, positionInScene))
    {
#ifdef DEBUG
        NSLog(@"leaderboard button tapped");
#endif
        
        // Set an action to the button
        [self.leaderBoardButton runAction:[SKAction sequence:@[[SKAction moveByX:0 y:-2 duration:0.1f], [SKAction moveByX:0 y:2 duration:0.1f]]] completion:^{

            if ([[GameCenterManager sharedManager] checkGameCenterAvailability]) {
                UIViewController *vc = self.view.window.rootViewController;
                [[GameCenterManager sharedManager] presentLeaderboardsOnViewController:vc];
            }
        }];
    } // End Credits button pressed

    
    // Check if the Highscore button is tapped
    else if (CGRectContainsPoint(self.highScore.frame, positionInScene))
    {
#ifdef DEBUG
        NSLog(@"leaderboard button tapped");
#endif
        
        // Set an action to the button
        [self.highScore runAction:[SKAction sequence:@[[SKAction moveByX:0 y:-2 duration:0.1f], [SKAction moveByX:0 y:2 duration:0.1f]]] completion:^{
            
            SKTransition *reveal = [SKTransition fadeWithDuration:.5f];
            LocalHighScores *highScoresScene = [[LocalHighScores alloc] initWithSize:self.size];
            [self.scene.view presentScene:highScoresScene transition:reveal];
        }];
    } // End Credits button pressed
    
    
    // Check if the Highscore button is tapped
    else if (CGRectContainsPoint(self.achievementButton.frame, positionInScene))
    {
#ifdef DEBUG
        NSLog(@"leaderboard button tapped");
#endif
        
        // Set an action to the button
        [self.achievementButton runAction:[SKAction sequence:@[[SKAction moveByX:0 y:-2 duration:0.1f], [SKAction moveByX:0 y:2 duration:0.1f]]] completion:^{
            
            SKTransition *reveal = [SKTransition fadeWithDuration:.5f];
            Achievement *achievement = [[Achievement alloc] initWithSize:self.size];
            [self.scene.view presentScene:achievement transition:reveal];
        }];
    } // End Credits button pressed

    
}



@end
