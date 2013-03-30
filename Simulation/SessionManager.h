//
//  SessionManager.h
//  RTRGame
//
//  Created by Justin Mackenzie on 13-03-14.
//
//

#import <Foundation/Foundation.h>
#import "Updatable.h"

@class Tubby;
@class GameStateManager;

@interface SessionManager : NSObject <Updatable>
{
    float _score;
    float _scrollSpeed;
    Tubby *_tubby;
    GameStateManager *_gameStateManager;
    float _timeSincePlatformSpawn;
    float _timeSinceCoinSpawn;
    float _timeSinceBrussellSproutSpawn;
}

-(id)initWithGameStateManager:(GameStateManager *)manager;

-(int)getScore;
-(void)addScore:(int)points;

-(float)getScrollSpeed;
-(void)setScrollSpeed:(float)scrollSpeed;

-(void)StartGame;

@end
