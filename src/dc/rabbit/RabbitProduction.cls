Class dc.rabbit.RabbitProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="dc.rabbit.RabbitProduction" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="GetCurrentTemperature" Category="" ClassName="dc.rabbit.TemperatureService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Latitude">61.22246</Setting>
    <Setting Target="Adapter" Name="Longitude">-149.86769</Setting>
    <Setting Target="Adapter" Name="SSLConfig">pm.community.intersystems.com</Setting>
  </Item>
  <Item Name="SendTemperatureOperation" Category="" ClassName="EnsLib.RabbitMQ.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">RabbitCreds</Setting>
    <Setting Target="Adapter" Name="MQHost">rabbitmq</Setting>
  </Item>
  <Item Name="RabbitTemperatureOperation" Category="" ClassName="dc.rabbit.RabbitTemperatureOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="RabbitTemperatureClientService" Category="" ClassName="EnsLib.RabbitMQ.Service" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigNames">RabbitTemperatureOperation</Setting>
    <Setting Target="Adapter" Name="Credentials">RabbitCreds</Setting>
    <Setting Target="Adapter" Name="MQHost">rabbitmq</Setting>
    <Setting Target="Adapter" Name="QueueName">temperature</Setting>
  </Item>
</Production>
}

}
