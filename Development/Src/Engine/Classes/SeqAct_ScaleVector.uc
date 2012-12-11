class SeqAct_ScaleVector extends SequenceAction;

var vector InVector;
var float InFloat;
var vector OutVector;

event Activated()
{
	OutVector.X = InVector.X * InFloat;
	OutVector.Y = InVector.Y * InFloat;
	OutVector.Z = InVector.Z * InFloat;

	OutputLinks[0].bHasImpulse = True;
}

defaultProperties
{
	ObjName="Scale Vector"
	ObjCategory="Math"

	VariableLinks.Empty
	VariableLinks(0)=(ExpectedType=class'SeqVar_Vector',LinkDesc="Vector",PropertyName=InVector)
	VariableLinks(1)=(ExpectedType=class'SeqVar_Float',LinkDesc="Scalar",PropertyName=InFloat)
	VariableLinks(2)=(ExpectedType=class'SeqVar_Vector',LinkDesc="Output",bWriteable=True,PropertyName=OutVector)
}