# Auto User Deactivation

## Features
The "Auto User Deactivation" package supports below features:
1. Set the deactivate date of the user during the creation
    - In this case, users of the profile will be deactivated (recurring) after the given day, regardless user has logged in to salesforce at any given days.
2. Set the user inactive from last login days.
    - In this case, users of the profile will be deactivetd if they do not login for given number of days.

The process will only deactivate the users, the enablement has to be executed manually.
 
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
### Go to "Setup" > "Custom Metadata Types" > "Auto User Inactive", The custom metadata will look like below:
![Auto user inactive custom metadata](https://github.com/harshvasisthaa/autoUserDeactivation/blob/main/images/custom_metadata.png?raw=true)
### Click "Manage Auto Users Inactive" > "New" and create below record:
       Label : <Profile Nmae>
       Number of Daye: <Any positive integer value>
       From Last Login Date: <true|false>
  Please find below example of the records
  - Setup 1st feature (Please find below example)
      - Configuration where the users will be deactiavted after 1 day regradless they login or not:
        ![Example record 1](https://github.com/harshvasisthaa/autoUserDeactivation/blob/main/images/record_example_2.png?raw=true)
  - Setup 2nd feature (Please find below example)
      - Configuration where the users will be deactiavted if they do not login for 1 day:
        ![Example record 1](https://github.com/harshvasisthaa/autoUserDeactivation/blob/main/images/record_example_1.png?raw=true)

### Schedule the process. Go to "Setup" > "Apex Classes" > click on "Schedule Apex" and schedule the batch class named "DeactivateUsersBatch".
  I would recommend to schedule the batch process once a week. We could schedule it to be executed daily.
  Please find below example, where batch will run on every sunday and deactiavte the required users:
  ![Batch Setip](https://github.com/harshvasisthaa/autoUserDeactivation/blob/main/images/sample_batch_scheduled_weekly_sunday.png?raw=true)
