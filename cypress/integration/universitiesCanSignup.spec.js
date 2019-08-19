describe("University can sign up", () => {
  beforeEach(function() {
    cy.server();
  });
  it("successfully", () => {
    cy.route({
      method: "POST",
      url: "http://localhost:3000/api/v0/registration",
      response: "fixture:successful_saving_universitiesAccount_response.json"
    })
    cy.university_signup("University","harvard","harvard@mail.com", "password", "password_confirmation");
    cy.get("#payment-form").within(() => {
      cy.get('select[id="payment-type"]').select("card-payment");
      cy.get('input[id="card-number"]').type("6666 6666 6666 6666");
      cy.get('input[id="card-owner"]').type("JOHN DOE FOSHO");
      cy.get('input[id="expiration date"]').type("10-21");
      cy.get('input[id="CVC"]').type("666");
    })
    cy.get("#submit-account-button").click();
  cy.contains("Payment successful! University Account successfully created!");
  })
});