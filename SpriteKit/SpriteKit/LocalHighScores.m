//
//  LocalHighScores.m
//  SpriteKit
//
//  Created by DANIEL ANNIS on 5/29/14.
//  Copyright (c) 2014 Dinky_Details. All rights reserved.
//
#import "LocalHighScores.h"

@implementation LocalHighScores
-(id)initWithSize:(CGSize)size{
    if (self = [super initWithSize:size]) {
        
        self.backgroundColor = [SKColor colorWithRed:255.0f green:255.0f blue:25.0f alpha:1.0f];
        
        gameMechanics = [[GameMechanics alloc]init];
        
        
        bronze = [SKSpriteNode spriteNodeWithImageNamed:@"bronze"];
        bronze.position =((UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad)? CGPointMake(100, CGRectGetMaxY(self.frame)-200) : CGPointMake(50, CGRectGetMaxY(self.frame)-100));
        [bronze setScale:0.15];
        
        if (![gameMechanics getMedal:@"bronze"]) {
            bronze.alpha = 0.1;
        } else {
            bronze.alpha = 1;
        }
        [self addChild:bronze];
        
        
        silver = [SKSpriteNode spriteNodeWithImageNamed:@"silver"];
        silver.position =((UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad)? CGPointMake(200, CGRectGetMaxY(self.frame)-200) : CGPointMake(100, CGRectGetMaxY(self.frame)-100));
        [silver setScale:0.20];
        if (![gameMechanics getMedal:@"silver"]) {
            silver.alpha = 0.1;
        } else {
            silver.alpha = 1;}
        [self addChild:silver];
        
        
        gold = [SKSpriteNode spriteNodeWithImageNamed:@"gold"];
        gold.position =((UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad)? CGPointMake(CGRectGetMidX(self.frame), CGRectGetMaxY(self.frame)-200) : CGPointMake(CGRectGetMidX(self.frame), CGRectGetMaxY(self.frame)-100));
        [gold setScale:0.25];
        if (![gameMechanics getMedal:@"gold"]) {
            gold.alpha = 0.1;
        } else {
            gold.alpha = 1;}
        [self addChild:gold];

        
        platinum = [SKSpriteNode spriteNodeWithImageNamed:@"platinum"];
        platinum.position =((UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad)? CGPointMake(CGRectGetMaxX(self.frame)-200, CGRectGetMaxY(self.frame)-200) : CGPointMake(CGRectGetMaxX(self.frame)-100, CGRectGetMaxY(self.frame)-100));
        [platinum setScale:0.20];
        if (![gameMechanics getMedal:@"platinum"]) {
            platinum.alpha = 0.1;
        } else {
            platinum.alpha = 1;}
        [self addChild:platinum];

        
        diamond = [SKSpriteNode spriteNodeWithImageNamed:@"diamond"];
        diamond.position =((UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad)? CGPointMake(CGRectGetMaxX(self.frame)-100, CGRectGetMaxY(self.frame)-200) : CGPointMake(CGRectGetMaxX(self.frame)-50, CGRectGetMaxY(self.frame)-100));
        [diamond setScale:0.15];
        if (![gameMechanics getMedal:@"diamond"]) {
            diamond.alpha = 0.1;
        } else {
            diamond.alpha = 1;}
        [self addChild:diamond];

        
        
        SSBitmapFont *bitmapFont = [self bitmapFontForFile:@"ScorePanelFont"];

        
        localScoreLabel1 = [bitmapFont nodeFromString:[NSString stringWithFormat:@"Highscore: %d", [gameMechanics getLocalScore1]]];
        localScoreLabel1.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)+localScoreLabel1.size.height*3);
        [self addChild:localScoreLabel1];
        
        
        localScoreLabel2 = [bitmapFont nodeFromString:[NSString stringWithFormat:@"Highscore: %d", [gameMechanics getLocalScore2]]];
        localScoreLabel2.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)+localScoreLabel2.size.height*1.5);
        [self addChild:localScoreLabel2];
        
        localScoreLabel3 = [bitmapFont nodeFromString:[NSString stringWithFormat:@"Highscore: %d", [gameMechanics getLocalScore3]]];
        localScoreLabel3.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        [self addChild:localScoreLabel3];
        
        
        localScoreLabel4 = [bitmapFont nodeFromString:[NSString stringWithFormat:@"Highscore: %d", [gameMechanics getLocalScore4]]];
        localScoreLabel4.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)-localScoreLabel4.size.height*1.5);
        [self addChild:localScoreLabel4];
        
        
        localScoreLabel5 = [bitmapFont nodeFromString:[NSString stringWithFormat:@"Highscore: %d", [gameMechanics getLocalScore5]]];
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
