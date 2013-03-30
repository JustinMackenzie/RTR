//
//  PhysicsManager.h
//  RTRGame
//
//  Created by Justin Mackenzie on 13-02-25.
//
//

#import <Foundation/Foundation.h>
#import "Box2D.h"
#import "Updatable.h"

@interface PhysicsManager : NSObject <Updatable>
{
    b2World *_world;
    int32 _velocityIterations;
	int32 _positionIterations;
}

-(b2World *)getWorld;

@end
