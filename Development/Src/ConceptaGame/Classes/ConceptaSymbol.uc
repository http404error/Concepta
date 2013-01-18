class ConceptaSymbol extends InterpActor
	placeable;

var ConceptaPawn player;

simulated function PostBeginPlay()
{	
	local ConceptaPawn A;

	//Super.PostBeginPlay;

	foreach AllActors(class'ConceptaPawn', A)  {
		player = A;
	}
}
	
event Tick (float DeltaTime)
{

	SetRotation(player.GetViewRotation());

}
	
	
	
defaultproperties
{

}