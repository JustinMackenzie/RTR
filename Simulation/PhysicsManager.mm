//
//  PhysicsManager.m
//  RTRGame
//
//  Created by Justin Mackenzie on 13-02-25.
//
//

#import "PhysicsManager.h"
#import "cocos2d.h"

#define PTM_RATIO 32

@implementation PhysicsManager

-(id)init
{
    self = [super init];
    
    if(self)
    {
        b2Vec2 gravity;
        gravity.Set(0.0f, -10.0f);
        
        _world = new b2World(gravity);
        
        _world->SetAllowSleeping(true);
        
        _world->SetContinuousPhysics(true);
        
        _velocityIterations = 8;
        
        _positionIterations = 1;
    }
    
    return self;
}

-(b2World *)getWorld
{
    return _world;
}

-(void)update:(float)dt
{	
	// Instruct the world to perform a single step of simulation. It is
	// generally best to keep the time step and iterations fixed.
	_world->Step(dt, _velocityIterations, _positionIterations);
    
    for (b2Body* b = _world->GetBodyList(); b; b = b->GetNext())
    {
		if (b->GetUserData() != NULL) {
			//Synchronize the AtlasSprites position and rotation with the corresponding body
			CCSprite *myActor = (CCSprite*)b->GetUserData();
			myActor.position = CGPointMake( b->GetPosition().x * PTM_RATIO,
                                           b->GetPosition().y * PTM_RATIO);
			myActor.rotation = -1 * CC_RADIANS_TO_DEGREES(b->GetAngle());
		}
	}
}

-(void)dealloc
{
    delete _world;
	_world = NULL;
    
    [super dealloc];
}

@end
