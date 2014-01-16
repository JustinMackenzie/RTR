RTR
===

Run Tubby Run

This is an endless runner platforming game for iOS6. The game consists of three main modules: Simulation, 
Object Management and Interface Management. 

The Simulation module deals mainly with the logic of the system and can be loosely compared to the controller 
of the MVC architecture. The simulation module contains the following:

Command Management: A component that handles all of the commands from the user in the system. This component is based
off of the command pattern.

Input Management: A component that handles the input of the user and turns them into commands for the command management
component to handle.

Game State Management: A component that handles the game state (paused, playing, main screen, etc...)

The Object Management module deals with the organization of and implementation of the entities of the game. The module
is based off of the entity-component pattern often used in games, where the logic of a game entity is stored in objects
called "Components" that are simply used in aggregation. This method avoids large hierarchies through inheritance.

The Game Engine module deals with displaying information to the user. It contains the cocos2d scenes and layers 
for rendering the game to the user. Game Engine is a poor name for the purpose of this module, but that was the decision early on and it was not changed.
