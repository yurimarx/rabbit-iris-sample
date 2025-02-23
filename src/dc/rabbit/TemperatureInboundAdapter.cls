Class dc.rabbit.TemperatureInboundAdapter Extends Ens.InboundAdapter
{

Property Latitude As %String;

Property Longitude As %String;

Property SSLConfig As %String;

Parameter SERVER = "api.open-meteo.com";

Property Feed As %String;

Parameter SETTINGS = "SSLConfig:Basic:sslConfigSelector,Latitude:Basic,Longitude:Basic";

Method OnInit() As %Status
{
    If (..SSLConfig = "" || ..Latitude = "" || ..Longitude = "") {
        return $$$ERROR(5001, "SSLConfig required")
    }
    
    Quit $$$OK
}

Method OnTask() As %Status
{
    If ((..SSLConfig = "" || ..Latitude = "" || ..Longitude = "")) {
        Return $$$OK 
    }
    
    Set tSC = 1
    // HTTP Request
    
    #dim httprequest as %Net.HttpRequest
    #dim httpResponse as %Net.HttpResponse
    
    Try {
        Set httprequest = ##class(%Net.HttpRequest).%New()
        
        Do httprequest.ServerSet(..#SERVER)
        Do httprequest.SSLConfigurationSet(..SSLConfig)
        
        Set requestString = "/v1/forecast?latitude="_..Latitude_"&longitude="_..Longitude_"&current=temperature_2m&temperature_unit=fahrenheit&forecast_days=1"
        
        Do httprequest.Get(requestString)
        Set httpResponse = httprequest.HttpResponse
        
        If (httpResponse.StatusCode '=200) {
            $$$ThrowStatus($$$ERROR(5001, "HTTP StatusCode = "_httpResponse.StatusCode))
        } 
        
        Set apiResult = {}.%FromJSON(httpResponse.Data)
        Set temperature = ##class(dc.rabbit.TemperatureMessage).%New() 
        Set temperature.Latitude = ..Latitude
        Set temperature.Longitude = ..Longitude
        Set temperature.Temperature = apiResult.current."temperature_2m"
        Set temperature.TemperatureDate = apiResult.current.time    
        $$$ThrowOnError(..BusinessHost.ProcessInput(temperature))
        
    } Catch ex {
        Do ex.Log()
        Set tSC = ex.AsStatus()
    }
    Set ..BusinessHost.%WaitForNextCallInterval=1
    Quit tSC
}

}
