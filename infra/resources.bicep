param environmentName string
param location string = resourceGroup().location
param serviceName string = 'web'
param principalId string = ''
param appCommandLine string = ''
param applicationInsightsName string = ''

// The application frontend
module web './core/host/appservice.bicep' = {
  name: '${serviceName}-appservice-python-module'
  params: {
    environmentName: environmentName
    location: location
    appCommandLine: appCommandLine
    applicationInsightsName: applicationInsightsName
    appServicePlanId: appServicePlan.outputs.appServicePlanId
    runtimeName: 'python'
    runtimeVersion: '3.8'
    scmDoBuildDuringDeployment: true
    serviceName: serviceName
  }
}

// Create an App Service Plan to group applications under the same payment plan and SKU
module appServicePlan './core/host/appserviceplan.bicep' = {
  name: 'appserviceplan'
  params: {
    environmentName: environmentName
    location: location
    sku: {
      name: 'B1'
    }
  }
}

output WEB_IDENTITY_PRINCIPAL_ID string = web.outputs.identityPrincipalId
output WEB_NAME string = web.outputs.name
output WEB_URI string = web.outputs.uri
