import { When, Then, Given } from "@badeball/cypress-cucumber-preprocessor";


Given('I have launched the swag labs application', function () {
    cy.visit('https://www.saucedemo.com/v1/index.html')
})

When('I enter the correct username and password', function () {
    cy.login('standard_user', 'secret_sauce')

})

When('I click on the Login Button', function () {
    const login_btn = '#login-button'
    cy.get(login_btn).click()
})

Then('I should land on the products page', function () {
    cy.get('div.product_label').should("have.text", 'Products')
})


When(`I enter the incorrect username and password`, () => {
    // [When] Describes the action or event that triggers the scenario.
    cy.login('standard_user', 'sqdtest')
});


Then(`I should get the error message {string}`, (Message) => {
    // [Then] Describes the expected outcome or result of the scenario.
    const error_msg = 'h3'
    cy.get(error_msg).should("have.text", Message)

});

When('I enter the username as {string} and password as {string}', (UserN, Pass) => {
    cy.login(UserN, Pass)
})