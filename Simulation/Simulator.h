//
//  Simulator.h
//  Game
//
//  Created by Justin Mackenzie on 13-01-20.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputHandler.h"
#import "b2World.h"
#import "Updatable.h"

@class CommandManager;
@class GameStateManager;
@class PhysicsManager;
@class SessionManager;

@interface Simulator : NSObject <Updatable>
{
    CommandManager *_commandManager;
    GameStateManager *_gameStateManager;
    id<InputHandler> _inputHandler;
    PhysicsManager *_physicsManager;
    SessionManager *_sessionManager;
    
    NSString *_difficulty;
}

+(Simulator *)SharedSimulator;
-(id<InputHandler>)getInputHandler;
-(b2World *)GetWorld;
-(SessionManager *)getSessionManager;
-(NSString *)GameState;
-(void)StartGame;
-(void)StopGame;
-(NSString *)Difficulty;
-(void)SetDifficulty:(NSString *)difficulty;

@end
