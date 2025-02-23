Class dc.rabbit.TemperatureService Extends Ens.BusinessService
{

Property Adapter As dc.rabbit.TemperatureInboundAdapter;

Parameter ADAPTER = "dc.rabbit.TemperatureInboundAdapter";

Method OnProcessInput(pInput As dc.rabbit.TemperatureMessage, pOutput As %RegisteredObject) As %Status
{
    #dim rabbitMesssage As EnsLib.RabbitMQ.Message
    Set rabbitMesssage = ##class(EnsLib.RabbitMQ.Message).%New()
    Do pInput.%JSONExportToString(.content)
    Do rabbitMesssage.SetEncodedContent(content)
    Set rabbitMesssage.appId = "IRIS"
    Set rabbitMesssage.exchange = "temperature" 
    Set rabbitMesssage.routingKey = "temperature.current"
    Return ..SendRequestAsync("SendTemperatureOperation", rabbitMesssage)
}

}
