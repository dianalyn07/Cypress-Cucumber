

@AllLogin
Feature: This feature file will be used to test the login related scenarios
    Background: Launch the site
        Given I have launched the swag labs application

    @Login_Success
    Scenario: Login Success

        When I enter the correct username and password
        And I click on the Login Button
        Then I should land on the products page


    @Login_Failure
    Scenario: Login Failure

        When I enter the incorrect username and password
        And I click on the Login Button
        Then I should get the error message "Epic sadface: Username and password do not match any user in this service"


    @DataDriven
    Scenario: Login Failure test using data driven

        When I enter the username as "standard_user" and password as "sqdtest"
        And I click on the Login Button
        Then I should get the error message "Epic sadface: Username and password do not match any user in this service"

    @DataDrivenLockedOut
    Scenario: Login Failure test using Multiple user

        When I enter the username as "<UserName>" and password as "<Password>"
        And I click on the Login Button
        Then I should get the error message "<Error>"

        Examples:
            | UserName        | Password     | Error                                                                     |
            | standard_user   | abc1234      | Epic sadface: Username and password do not match any user in this service |
            | locked_out_user | secret_sauce | Epic sadface: Sorry, this user has been locked out.                       |