Class dc.rabbit.Temperature Extends %Persistent
{

Property Temperature As %Double;

Property Longitude As %String;

Property Latitude As %String;

Property TemperatureDate As %String;

Storage Default
{
<Data name="TemperatureDefaultData">
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
<DataLocation>^dc.rabbit.TemperatureD</DataLocation>
<DefaultData>TemperatureDefaultData</DefaultData>
<IdLocation>^dc.rabbit.TemperatureD</IdLocation>
<IndexLocation>^dc.rabbit.TemperatureI</IndexLocation>
<StreamLocation>^dc.rabbit.TemperatureS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
