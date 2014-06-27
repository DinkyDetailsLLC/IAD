//
//  Achievement.h
//  SpriteKit
//
//  Created by DANIEL ANNIS on 5/28/14.
//  Copyright (c) 2014 Dinky_Details. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "MainScene.h"
#import "SSBitmapFont.h"
#import "SSBitmapFontLabelNode.h"
#import "GameMechanics.h"

@interface Achievement : SKScene
{
    GameMechanics * gameMechanics;

    SKSpriteNode * bronze;
    SKSpriteNode * silver;
    SKSpriteNode * gold;
    SKSpriteNode * platinum;
    SKSpriteNode * diamond;
    
    SKSpriteNode * achievement1;
    SKSpriteNode * achievement2;
    SKSpriteNode * achievement3;

    BOOL iPhone5;

}
@property (nonatomic, retain) SKSpriteNode * backButton;
@property (nonatomic, retain) SKSpriteNode * background;

@end
