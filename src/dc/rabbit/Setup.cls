Class dc.rabbit.Setup
{

ClassMethod StartProduction()
{
    
    Set exists = ##class(Ens.Config.Credentials).%ExistsId("RabbitCreds")
    if exists = 0 {
        Do ##class(Ens.Config.Credentials).SetCredential("RabbitCreds", "guest", "guest")
    }
    
    set prodClass = "dc.rabbit.RabbitProduction"
    do ##class(%EnsembleMgr).SetAutoStart($namespace, prodClass)
    job ##class(Ens.Director).StartProduction(prodClass)
}

}
