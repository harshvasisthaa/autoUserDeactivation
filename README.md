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
### 2. Click "Manage Auto Users Inactive" > "New" and create below record:
       Label : <Profile Nmae>
       Number of Daye: <Any positive integer value>
       From Last Login Date: <true|false>
  Please find below example of the records
  - Configuration where the users will be deactiavted if they do not login for 1 day:
    ![Example record 1](https://github.com/harshvasisthaa/autoUserDeactivation/blob/main/images/record_example_1.png?raw=true)
  - Configuration where the users will be deactiavted after 1 day regradless they login or not:
    ![Example record 1](https://github.com/harshvasisthaa/autoUserDeactivation/blob/main/images/record_example_2.png?raw=true)
