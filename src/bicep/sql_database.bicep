param location string = resourceGroup().location

resource sqlServer 'Microsoft.Sql/servers@2014-04-01' ={
  name: 'acs-sql-server-dev'
  location: location
  properties: {
    administratorLogin: 'sqladmin'
    administratorLoginPassword: 'NotToBeHardcoded_GetFromKeyVault'
  }
}

resource sqlServerDatabase 'Microsoft.Sql/servers/databases@2014-04-01' = {
  parent: sqlServer
  name: 'productsdb'
  location: location
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    edition: 'Basic'
    maxSizeBytes: '1073741824'
    requestedServiceObjectiveName: 'Basic'
  }
}
