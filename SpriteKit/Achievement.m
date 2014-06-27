//
//  Achievement.m
//  SpriteKit
//
//  Created by DANIEL ANNIS on 5/28/14.
//  Copyright (c) 2014 Dinky_Details. All rights reserved.
//

#import "Achievement.h"

@implementation Achievement
-(id)initWithSize:(CGSize)size{
    if (self =[super initWithSize:size]) {
        [self createBackground];
        
        gameMechanics = [[GameMechanics alloc]init];
        
        bronze = [SKSpriteNode spriteNodeWithImageNamed:@"stars_red"];
        bronze.position =((UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad)? CGPointMake(150, CGRectGetMaxY(self.frame)-200) : CGPointMake(50, CGRectGetMaxY(self.frame)-100));
        [bronze setScale:0.6];
        
        if (![gameMechanics getMedal:@"bronze"]) {
            bronze.alpha = 0.1;
        } else {
            bronze.alpha = 1;
        }
        [self addChild:bronze];
        
        
        silver = [SKSpriteNode spriteNodeWithImageNamed:@"stars_orange"];
        silver.position =((UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad)? CGPointMake(255, CGRectGetMaxY(self.frame)-200) : CGPointMake(100, CGRectGetMaxY(self.frame)-100));
        [silver setScale:0.8];
        if (![gameMechanics getMedal:@"silver"]) {
            silver.alpha = 0.1;
        } else {
            silver.alpha = 1;}
        [self addChild:silver];
        
        
        gold = [SKSpriteNode spriteNodeWithImageNamed:@"stars_yellow"];
        gold.position =((UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad)? CGPointMake(CGRectGetMidX(self.frame), CGRectGetMaxY(self.frame)-200) : CGPointMake(CGRectGetMidX(self.frame), CGRectGetMaxY(self.frame)-100));
        //    [gold setScale:0.25];
        if (![gameMechanics getMedal:@"gold"]) {
            gold.alpha = 0.1;
        } else {
            gold.alpha = 1;}
        [self addChild:gold];
        
        
        platinum = [SKSpriteNode spriteNodeWithImageNamed:@"stars_limegreen"];
        platinum.position =((UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad)? CGPointMake(CGRectGetMaxX(self.frame)-255, CGRectGetMaxY(self.frame)-200) : CGPointMake(CGRectGetMaxX(self.frame)-100, CGRectGetMaxY(self.frame)-100));
        [platinum setScale:0.8];
        if (![gameMechanics getMedal:@"platinum"]) {
            platinum.alpha = 0.1;
        } else {
            platinum.alpha = 1;}
        [self addChild:platinum];
        
        
        diamond = [SKSpriteNode spriteNodeWithImageNamed:@"stars_green"];
        diamond.position =((UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad)? CGPointMake(CGRectGetMaxX(self.frame)-150, CGRectGetMaxY(self.frame)-200) : CGPointMake(CGRectGetMaxX(self.frame)-50, CGRectGetMaxY(self.frame)-100));
        [diamond setScale:0.6];
        if (![gameMechanics getMedal:@"diamond"]) {
            diamond.alpha = 0.1;
        } else {
            diamond.alpha = 1;}
        [self addChild:diamond];
        
        
        [self createBackButton];
        
        SSBitmapFont *bitmapFont = [self bitmapFontForFile:@"ScorePanelFont"];
        SSBitmapFontLabelNode * achivement = [bitmapFont nodeFromString:@"Achievement"];
        achivement.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMaxY(self.frame)- achivement.size.height*2);
        
        [self addChild:achivement];
        [self basicAchievements];
        
        [self specialAchievements];
        
    }
    return self;
}

-(void) createBackground{
    SKTexture *bgTexture = [SKTexture textureWithImageNamed:@"achivement_bg"];
    self.background = [SKSpriteNode spriteNodeWithTexture:bgTexture];
    self.background.position = (CGPoint) {CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)};
    [self addChild:self.background];
}

-(void)specialAchievements{
    
    if (![gameMechanics getMedal:@"special1"]) {
        achievement1 = [SKSpriteNode spriteNodeWithImageNamed:@"stars4"];
        [achievement1 setScale:0.6];
        achievement1.alpha = 0.2;
    } else {
        achievement1 = [SKSpriteNode spriteNodeWithImageNamed:@"stars1"];
        [achievement1 setScale:0.6];
        achievement1.alpha = 1;
    }
    
    if (![gameMechanics getMedal:@"special2"]) {
        achievement2 = [SKSpriteNode spriteNodeWithImageNamed:@"stars4"];
        [achievement2 setScale:0.6];
        achievement2.alpha = 0.2;
    } else {
        achievement2 = [SKSpriteNode spriteNodeWithImageNamed:@"stars2"];
        [achievement2 setScale:0.6];
        achievement2.alpha = 1;
    }
    
    if (![gameMechanics getMedal:@"special3"]) {
        achievement3 = [SKSpriteNode spriteNodeWithImageNamed:@"stars4"];
        [achievement3 setScale:0.6];
        achievement3.alpha = 0.2;
    } else {
        achievement3 = [SKSpriteNode spriteNodeWithImageNamed:@"stars3"];
        [achievement3 setScale:0.6];
        achievement3.alpha = 1;
    }
    
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
        achievement1.position = CGPointMake(achievement1.size.width, CGRectGetMidY(self.frame)+ achievement1.size.height);
        achievement2.position = CGPointMake(achievement2.size.width, CGRectGetMidY(self.frame)- achievement2.size.height*0.7);
        achievement3.position = CGPointMake(achievement3.size.width, CGRectGetMidY(self.frame)- achievement3.size.height*2.45);
    } else {
        achievement1.position = CGPointMake(achievement1.size.width, CGRectGetMidY(self.frame)+ achievement1.size.height*1.4);
        achievement2.position = CGPointMake(achievement2.size.width, CGRectGetMidY(self.frame)- achievement2.size.height);
        achievement3.position = CGPointMake(achievement3.size.width, CGRectGetMidY(self.frame)- achievement3.size.height*3.2);
    }
    
    
    
    [self addChild:achievement1];
    [self addChild:achievement2];
    [self addChild:achievement3];
}


-(void)basicAchievements{
    
    
    
}

-(void)createBackButton{
    self.backButton = [SKSpriteNode spriteNodeWithImageNamed:@"back"];
    [self.backButton setScale:1.15];
    self.backButton.position = (CGPoint){CGRectGetMidX(self.frame),self.backButton.size.height};
    [self addChild:self.backButton];
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

@end
