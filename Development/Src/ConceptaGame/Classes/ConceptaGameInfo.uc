/**
 * Copyright 1998-2012 Epic Games, Inc. All Rights Reserved.
 */
class ConceptaGameInfo extends GameInfo;

auto State PendingMatch
{
Begin:
	StartMatch();
}

defaultproperties
{
	HUDType=class'GameFramework.MobileHUD'
	PlayerControllerClass=class'ConceptaGame.ConceptaPlayerController'
	DefaultPawnClass=class'ConceptaGame.ConceptaPawn'
	bDelayedStart=false
}


