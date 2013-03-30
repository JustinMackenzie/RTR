//
//  Colletables.cpp
//  RTR_newPhysics
//
//  Created by Scott van Heesch on 13-03-12.
//
//

#include "Colletables.h"
#import "PhysicsSprite.h"


@implementation Collectables



-(id)initWithWorld:(b2World *)world
{
    self = [super init];
    
    if(self)
    {
        _world = world;
        hit = false;
    }
    
    return self;
}

-(void)createCollectablesInWorld:(b2World *)theWorld S1:(CCSprite*)S1 location:(CGPoint)location speed:(float)speed {
    
    burgers = [self createCollectableBox:theWorld withSprite:(S1) location:ccp(location.x, location.y) size:CGSizeMake(0.2, 0.2)];
    burgers -> SetLinearVelocity(b2Vec2(-1*speed,0.0f));
    //CLocation = location;
}

-(CGPoint)getPosition
{
    return ccp((burgers ->GetPosition()).x, (burgers ->GetPosition()).y);
}



-(void) updateMovementSpeed:(float)dt {
    
    //r = arc4random() % 9;
    
    pos =  burgers -> GetPosition();
    
    if (pos.x < -2){
       // delete it
        
    }
    
    
    
    b2ContactEdge* burgerSensorEdge = burgers->GetContactList();
    
    while (burgerSensorEdge)
    {
        b2Contact* contact = burgerSensorEdge->contact;
        
        if (contact->IsTouching()) {
           //add one to coin count
            // delete it
            hit = true;
        }
        burgerSensorEdge = burgerSensorEdge->next;
    }
    
}

-(bool)Hit
{
    return hit;
}



-(b2Body*) createCollectableBox:(b2World*)newWorld withSprite:(CCSprite*)withSprite location:(CGPoint)location size:(CGSize)size;{
    
    
    b2BodyDef bodyDef;
    bodyDef.type = b2_kinematicBody;
    bodyDef.position = b2Vec2(location.x, location.y);
    bodyDef.allowSleep = false;
    
    
    
    b2Body *body = newWorld->CreateBody(&bodyDef);
    body->SetUserData(withSprite);
    b2PolygonShape shape;
    shape.SetAsBox(size.width, size.height);
    
    b2FixtureDef fixtureDef;
    fixtureDef.shape = &shape;
    fixtureDef.isSensor = true;
    fixtureDef.filter.groupIndex = -9;
    
    
    body->CreateFixture(&fixtureDef);
    
    
    return body;
}


@end