param environmentName string
param location string = resourceGroup().location
param serviceName string = 'web'
param principalId string = ''
param appCommandLine string = ''
param applicationInsightsName string = ''

// The application frontend
module web './core/host/appservice-python.bicep' = {
  name: '${serviceName}-appservice-python-module'
  params: {
    environmentName: environmentName
    location: location
    serviceName: serviceName
    appCommandLine: appCommandLine
    applicationInsightsName: applicationInsightsName
    appServicePlanId: appServicePlan.outputs.appServicePlanId
  }
}

// Create an App Service Plan to group applications under the same payment plan and SKU
module appServicePlan './core/host/appserviceplan-sites.bicep' = {
  name: 'appserviceplan'
  params: {
    environmentName: environmentName
    location: location
  }
}

output WEB_IDENTITY_PRINCIPAL_ID string = web.outputs.identityPrincipalId
output WEB_NAME string = web.outputs.name
output WEB_URI string = web.outputs.uri
