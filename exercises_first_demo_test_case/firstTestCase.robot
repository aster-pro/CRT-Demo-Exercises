*** Settings ***

Documentation                   New test suite
Library                         QWeb
Suite Setup                     Open Browser                about:blank    chrome
Suite Teardown                  Close All Browsers

*** Test Cases ***
Explore Web Store
    # Go to Web Page
    GoTo                        https://shop.qualibrate.io/
    
    # Verify the Menu Names
    VerifyText                  Home
    VerifyText                  All Products
    VerifyText                  iPhone
    VerifyText                  iPad
    VerifyText                  Watch
    VerifyText                  Mac
    VerifyText                  Welcome to your advanced webshop!
    
    # Click on the Menu Sections
    ClickText                   All Products
    ClickText                   iPhone
    ClickText                   iPad
    ClickText                   Watch
    ClickText                   Mac

    # Add a new item to the cart
    ClickText                   iPhone
    ClickText                   AirPods Pro
    VerifyText                  AirPods Pro
    ClickText                   Add to cart
    ClickText                   AirPods Pro
    ClickText                   Home
    
     # Go to the Cart
    ClickText                   Cart
    VerifyText                  AirPods Pro
    VerifyText                  Your cart
    VerifyText                  AirPods Pro

    # Checkout and verify the total price
    ClickText                   Check out
    VerifyText                  Subtotal
    VerifyText                  Total
    VerifyText                  €249.00
