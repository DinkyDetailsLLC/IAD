//
//  GameMechanics.m
//  SpriteKit
//
//  Created by DANIEL ANNIS on 5/28/14.
//  Copyright (c) 2014 Dinky_Details. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>



@protocol GameMechanicsDelegate <NSObject>

//@property (nonatomic, retain) NSDictionary *config;

@end

@interface GameMechanics : NSObject{
    
    id <GameMechanicsDelegate> mainViewDelegate;
    SKAction *menuSound;
    
    int localScore[5];
    int localScore1;
    int localScore2;
    int localScore3;
    int localScore4;
    int localScore5;

}
- (int) GetActiveLevel;
- (void) setActiveLevel:(int)level;


- (int) getLocalScore1;
- (int) getLocalScore2;
- (int) getLocalScore3;
- (int) getLocalScore4;
- (int) getLocalScore5;
-(void)setLocalScores: (int)Score;

-(int)getTotalScore;
-(void)setTotalScore:(int)Score;
-(void)addTotalScore:(int)Score;


-(BOOL)getMedal :(NSString*)key;
-(void)setMedal :(BOOL)boolean :(NSString*)key;

@property (nonatomic, retain) id <GameMechanicsDelegate> mainViewDelegate;


@end
