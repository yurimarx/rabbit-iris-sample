Class dc.rabbit.Setup
{

ClassMethod CreateRabbitCreds()
{
    
    Do ##class(Ens.Config.Credentials).SetCredential("RabbitCreds", "guest", "guest")
}

}
