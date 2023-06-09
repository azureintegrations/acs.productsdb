@description('Environment short name.')
@allowed([
  'dev'
  'sit'
  'uat'
  'prd'
])
param environment string = 'dev'

param location string = 'Australia East'

var resourceNames     = {
  resourceGroup       : 'rg-acs-sqlserver-${environment}'
  sqlServer           :{
    name: 'acseaisql'
    username: 'sqladmin'
    productsDBName: 'ProductsDB'
  }
}

// modules
// module resourceGroupDeployment 'modules/resource_group.bicep' = {
//   name: 'Deploy Resource Group'
//   scope: subscription()  
//   params: {
//     resourceGroupName: 'rg-acs-sqlserver-${environment}'
//     resourceGroupLocation: location
//   }
// }

module sqlServerDBDeployement 'modules/sql_database.bicep' = {
  name: 'SQL Server DB Deployment'
  params: {
    location: location
    databaseName: resourceNames.sqlServer.productsDBName
    sqlServerName: resourceNames.sqlServer.name
    sqlServerUserName: resourceNames.sqlServer.username
    environment: environment
  }
}
