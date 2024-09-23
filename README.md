# Auto User Deactivation

## Features
The "Auto User Deactivation" package supports below features:
- Set the deactivate date of the user during the creation
  - In this case, users of the profile will be deactivated on the given day, regardless user has logged in to salesforce at any given days.
- Set the user inactive from last login days.
  - In this case, users of the profile will be deactivetd if they do not login for given number of days.
 
## Installation
A package to install in Salesforce using
- From this repository
  - As the code is open-source, you can download this repository and deploy the component in-to salesforce.
- Using URL:
  - We have created package to install in salesforce orgs. Please find below URL:
    - Sandboxes: https://test.salesforce.com/packaging/installPackage.apexp?p0=04tIg000000omVo
    - Production: https://login.salesforce.com/packaging/installPackage.apexp?p0=04tIg000000omVo

## Setup
Please find below steps to setup the system after installation:
### 1. Go to "Setup" > "Custom Metadata Types" > "Auto User Inactive", The custom metadata will look like below:
![Auto user inactive custom metadata](https://github.com/harshvasisthaa/autoUserDeactivation/blob/main/images/custom_metadata.png?raw=true)
