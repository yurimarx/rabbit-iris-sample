Class dc.rabbit.RabbitTemperatureOperation Extends Ens.BusinessOperation
{

Property Adapter As Ens.OutboundAdapter;

Parameter ADAPTER = "Ens.OutboundAdapter";

Method ProcessRabbitTemperature(pInput As EnsLib.RabbitMQ.Message, Output pOutput As %RegisteredObject) As %Status
{
    Set content = {}.%FromJSON(pInput.encodedContent)

    Set temperature = ##class(Temperature).%New()
    Set temperature.Latitude = content.Latitude
    Set temperature.Longitude = content.Longitude
    Set temperature.Temperature = content.Temperature
    Set temperature.TemperatureDate = content.TemperatureDate
    Set tSC = temperature.%Save()

    Return tSC
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="EnsLib.RabbitMQ.Message">
    <Method>ProcessRabbitTemperature</Method>
  </MapItem>
</MapItems>
}

}
