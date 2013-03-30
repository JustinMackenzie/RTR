//
//  CharacterStateObserver.m
//  RTRGame
//
//  Created by Justin Mackenzie on 13-02-25.
//
//

#import "CharacterStateObserver.h"
#import "Simulator.h"
#import "PhysicsManager.h"
#import "ObjectSystem.h"
#import "Tubby.h"
#import "CharacterStateManager.h"

@implementation CharacterStateObserver

-(void)Update
{
    if([[_subject State] isEqualToString:@"Jumping"])
    {
        [(Tubby *)[(CharacterStateManager *)_subject GameObject] Jump];
    }
    else if([[_subject State] isEqualToString:@"DoubleJumping"])
    {
        [(Tubby *)[(CharacterStateManager *)_subject GameObject] DoubleJump];
    }
}

@end
