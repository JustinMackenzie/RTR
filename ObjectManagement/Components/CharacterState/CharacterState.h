//
//  CharacterState.h
//  Game
//
//  Created by Justin Mackenzie on 13-01-21.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CharacterStateManager;

@protocol CharacterState <NSObject>

-(void)Jump:(CharacterStateManager *)context;
-(void)Done:(CharacterStateManager *)context;
-(NSString *)State;

@end
