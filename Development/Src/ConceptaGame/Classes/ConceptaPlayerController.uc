/**
 * Copyright 1998-2012 Epic Games, Inc. All Rights Reserved.
 */
class ConceptaPlayerController extends GamePlayerController
	config(Game);

state PlayerFlying
{
	
		function PlayerMove(float DeltaTime)
	{
		local vector X,Y,Z;

		GetAxes(Rotation,X,Y,Z);

		Acceleration = PlayerInput.aForward*X + PlayerInput.aStrafe*Y + PlayerInput.aUp*vect(0,0,1) - Velocity*200;
		
		UpdateRotation(DeltaTime);

		if (Role < ROLE_Authority) // then save this move and replicate it
		{
			ReplicateMove(DeltaTime, Acceleration, DCLICK_None, rot(0,0,0));
		}
		else
		{
			ProcessMove(DeltaTime, Acceleration, DCLICK_None, rot(0,0,0));
		}
	}
}
	
	
	
defaultproperties
{

}