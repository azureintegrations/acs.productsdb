param location string = resourceGroup().location
param environment string
param sqlServerName string
param databaseName string
param sqlServerUserName string

resource sqlServer 'Microsoft.Sql/servers@2014-04-01' ={
  name: '${sqlServerName}-${environment}'
  location: location
  properties: {
    administratorLogin: sqlServerUserName
    administratorLoginPassword: 'NotToBeHardcoded_GetFromKeyVault'
  }
}

resource sqlServerDatabase 'Microsoft.Sql/servers/databases@2014-04-01' = {
  parent: sqlServer
  name: databaseName
  location: location
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    edition: 'Basic'
    maxSizeBytes: '1073741824'
    requestedServiceObjectiveName: 'Basic'
  }
}
