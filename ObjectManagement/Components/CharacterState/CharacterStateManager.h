//
//  CharacterStateManager.h
//  Game
//
//  Created by Justin Mackenzie on 13-01-21.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "Component.h"
#import "Observable.h"
#import "CharacterState.h"

@interface CharacterStateManager : Component <Observable>
{
    id<CharacterState> _characterState;
    NSMutableArray *_observers;
}

-(id)initWithGameObject:(GameObject *)gameObject;
-(void)Jump;
-(void)Done;
-(void)SetCharacterState:(id<CharacterState>)characterState;

@end
