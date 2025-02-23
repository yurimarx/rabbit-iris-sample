Class dc.rabbit.TemperatureMessage Extends (%Persistent, %JSON.Adaptor, Ens.Util.ResponseBodyMethods)
{

Property Temperature As %Double;

Property Longitude As %String;

Property Latitude As %String;

Property TemperatureDate As %String;

Storage Default
{
<Data name="TemperatureMessageDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Temperature</Value>
</Value>
<Value name="3">
<Value>Longitude</Value>
</Value>
<Value name="4">
<Value>Latitude</Value>
</Value>
<Value name="5">
<Value>TemperatureDate</Value>
</Value>
</Data>
<DataLocation>^dc.rabbit.TemperatureMessageD</DataLocation>
<DefaultData>TemperatureMessageDefaultData</DefaultData>
<IdLocation>^dc.rabbit.TemperatureMessageD</IdLocation>
<IndexLocation>^dc.rabbit.TemperatureMessageI</IndexLocation>
<StreamLocation>^dc.rabbit.TemperatureMessageS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
