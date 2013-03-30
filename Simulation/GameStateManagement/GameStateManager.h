//
//  GameStateManager.h
//  RTRGame
//
//  Created by Justin Mackenzie on 13-03-14.
//
//

#import <Foundation/Foundation.h>
#import "GameState.h"
#import "Observable.h"

@interface GameStateManager : NSObject <Observable>
{
    id<GameState> _gameState;
    NSMutableArray *_observers;
}

-(void)About;
-(void)Back;
-(void)Settings;
-(void)How;
-(void)Play;
-(void)Pause;
-(void)Restart;
-(void)Quit;
-(void)Done;
-(void)SetGameState:(id<GameState>)gameState;

@end
