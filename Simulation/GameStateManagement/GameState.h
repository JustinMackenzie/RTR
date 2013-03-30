//
//  GameState.h
//  RTRGame
//
//  Created by Justin Mackenzie on 13-03-14.
//
//

#import <Foundation/Foundation.h>

@class GameStateManager;

@protocol GameState <NSObject>

-(NSString *)State;
-(void)Back:(GameStateManager *)context;
-(void)How:(GameStateManager *)context;
-(void)About:(GameStateManager *)context;
-(void)Settings:(GameStateManager *)context;
-(void)Play:(GameStateManager *)context;
-(void)Pause:(GameStateManager *)context;
-(void)Quit:(GameStateManager *)context;
-(void)Restart:(GameStateManager *)context;
-(void)Done:(GameStateManager *)context;

@end
