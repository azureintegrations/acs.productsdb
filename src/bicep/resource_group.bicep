targetScope='subscription'

param resourceGroupName string = 'rg-acs-sqlserver-dev'
param resourceGroupLocation string = 'Australia East'

resource sqlServerRG 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
}
