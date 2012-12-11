class SeqAct_AddVector extends SequenceAction;

var vector InVector1;
var vector InVector2;
var vector OutVector;

event Activated()
{
	OutVector.X = InVector1.X + InVector2.X;
	OutVector.Y = InVector1.Y + InVector2.Y;
	OutVector.Z = InVector1.Z + InVector2.Z;

	OutputLinks[0].bHasImpulse = True;
}

defaultProperties
{
	ObjName="Add Vector"
	ObjCategory="Math"

	VariableLinks.Empty
	VariableLinks(0)=(ExpectedType=class'SeqVar_Vector',LinkDesc="Input Vector 1",PropertyName=InVector1)
	VariableLinks(1)=(ExpectedType=class'SeqVar_Vector',LinkDesc="Input Vector 2",PropertyName=InVector2)
	VariableLinks(2)=(ExpectedType=class'SeqVar_Vector',LinkDesc="Output Vector",bWriteable=True,PropertyName=OutVector)
}