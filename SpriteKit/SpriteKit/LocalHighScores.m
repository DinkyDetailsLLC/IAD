//
//  LocalHighScores.m
//  SpriteKit
//
//  Created by DANIEL ANNIS on 5/28/14.
//  Copyright (c) 2014 Dinky_Details. All rights reserved.
//

#import "LocalHighScores.h"

@implementation LocalHighScores
-(id)initWithSize:(CGSize)size{
    if (self = [super initWithSize:size]) {
        
        self.backgroundColor = [SKColor colorWithRed:255.0f green:255.0f blue:25.0f alpha:1.0f];
        
        gameMechanics = [[GameMechanics alloc]init];
        
                
        
        SSBitmapFont *bitmapFont = [self bitmapFontForFile:@"ScorePanelFont"];

        
        localScoreLabel1 = [bitmapFont nodeFromString:[NSString stringWithFormat:@"Highscore 1: %d", [gameMechanics getLocalScore1]]];
        localScoreLabel1.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)+localScoreLabel1.size.height*3);
        [self addChild:localScoreLabel1];
        
        
        localScoreLabel2 = [bitmapFont nodeFromString:[NSString stringWithFormat:@"Highscore 2: %d", [gameMechanics getLocalScore2]]];
        localScoreLabel2.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)+localScoreLabel2.size.height*1.5);
        [self addChild:localScoreLabel2];
        
        localScoreLabel3 = [bitmapFont nodeFromString:[NSString stringWithFormat:@"Highscore 3: %d", [gameMechanics getLocalScore3]]];
        localScoreLabel3.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        [self addChild:localScoreLabel3];
        
        
        localScoreLabel4 = [bitmapFont nodeFromString:[NSString stringWithFormat:@"Highscore 4: %d", [gameMechanics getLocalScore4]]];
        localScoreLabel4.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)-localScoreLabel4.size.height*1.5);
        [self addChild:localScoreLabel4];
        
        
        localScoreLabel5 = [bitmapFont nodeFromString:[NSString stringWithFormat:@"Highscore 5: %d", [gameMechanics getLocalScore5]]];
        localScoreLabel5.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)-localScoreLabel1.size.height*3);
        [self addChild:localScoreLabel5];
        
        
        [self createBackButton];
        
    }
    return self;
}


-(void)createBackButton{
    self.backButton = [SKSpriteNode spriteNodeWithImageNamed:@"back"];
    [self.backButton setScale:1.15];
    self.backButton.position = (CGPoint){CGRectGetMidX(self.frame),70};
    [self addChild:self.backButton];
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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    // Get the touch
    UITouch * touch = [touches anyObject];
    
    // Get the position in the scene
    CGPoint positionInScene = [touch locationInNode:self];
    
    
    if (CGRectContainsPoint(self.backButton.frame, positionInScene)) {
#ifdef DEBUG
        NSLog(@"Back Button Tapped");
#endif
        
        // Set an action to the button
        [self.backButton runAction:[SKAction sequence:@[[SKAction moveByX:0 y:-2 duration:0.1f], [SKAction moveByX:0 y:2 duration:0.1]]]completion:^{
            
            SKTransition *reveal = [SKTransition fadeWithDuration:0.5f];
            MainScene * mainScene = [[MainScene alloc]initWithSize:self.size];
            [self.scene.view presentScene:mainScene transition:reveal];
        }];
    }
    
    
}

@end
