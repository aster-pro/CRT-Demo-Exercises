*** Settings ***
Library                QWeb
Suite Setup        OpenBrowser    about:blank    chrome

*** Variables ***
${GITHUB_URL}         https://github.com/login
${USERNAME}           your_username
${PASSWORD}           your_password


*** Test Cases ***
Login To GitHub And Validate User Page
    [Documentation]    Comprehensive test case to login to GitHub and validate user page elements
    [Tags]            github    login    user-validation    smoke
    
    # Navigate to GitHub login page
    Open Browser       ${GITHUB_URL}    chrome
    VerifyText         Sign in to GitHub
    VerifyText         Username or email address
    VerifyText         Password
    
    # Enter login credentials
    TypeText           Username or email address    ${USERNAME}
    TypeSecret         Password                     ${PASSWORD}
    
    # Submit login form
    ClickText          Sign in
    
    # Validate successful login by checking user page elements
    VerifyText         Dashboard
    VerifyText         Repositories
    VerifyText         Pull requests
    VerifyText         Issues
    VerifyText         Marketplace
    VerifyText         Explore
    
    # Navigate to user profile
    ClickText          ${USERNAME}
    VerifyText         Overview
    VerifyText         Repositories
    VerifyText         Projects
    VerifyText         Packages
    VerifyText         Stars
    
    # Verify user profile information
    VerifyText         ${USERNAME}
    VerifyText         Edit profile
    VerifyText         Follow
    
    # Validate profile sections are present
    ${profile_exists}=    IsText    Popular repositories    timeout=5
    IF                    ${profile_exists}
        VerifyText        Popular repositories
    END
    
    ${contributions_exist}=    IsText    Contribution activity    timeout=5
    IF                         ${contributions_exist}
        VerifyText             Contribution activity
    END
    
    # Verify user can access settings
    ClickText          Settings
    VerifyText         Public profile
    VerifyText         Account
    VerifyText         Appearance
    VerifyText         Accessibility
    
    # Navigate back to dashboard to confirm session is active
    ClickText          Dashboard
    VerifyText         Recent activity
    VerifyText         All activity
