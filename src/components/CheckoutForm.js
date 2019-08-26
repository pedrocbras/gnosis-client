import React, { Component } from "react";
import {
  CardNumberElement,
  CardExpiryElement,
  CardCvcElement,
  injectStripe
} from "react-stripe-elements";
import axios from "axios";
import { connect } from "react-redux";
import { Form, Button, Card, Container } from "semantic-ui-react";

class CheckoutForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      success: "",
      error: "",
      renderStripeForm: true
    };
  }

  // submitPayment = async () => {
  //   try {
  //     let token = await this.props.stripe.createToken();
  //     let response = await axios.post("/subscriptions", {
  //       body: token.id
  //     });
  //     if (response.status === 200) {
  //       this.setState({
  //         success: response.data.message,
  //         renderStripeForm: false
  //       });
  //     }
  //   } catch (error) {
  //     this.setState({ error: error.response.data.error });
  //   }
  // };

  submitPayment = async ev => {
    ev.preventDefault();
    await this.props.stripe.createToken().then(({ token }) => {
      if (token) {
        this.stripePayment(token.id);
      } else {
        this.props.dispatchFlash("Something went wrong, please try again.");
      }
    });
  };

  stripePayment = async stripeToken => {
    try {
      let response = await axios.post("/subscriptions", {
        body: stripeToken.id
      });
      if (response.status === 200) {
        this.props.dispatchFlash(response.data.message, "success"),
        this.setState({renderStripeForm: false})
        };
    } catch (error) {
      this.props.dispatchFlash(error.response.data.error, "error");
    }
  };

  render() {
    let stripeForm;
    let paymentStatus;

    if (this.state.renderStripeForm) {
      stripeForm = (
        <Form id="payment-form">
          <Form.Field>
            <label>Select your subscription type:</label>
            <Form.Field>
              <Card>
                <Card.Content header="Yearly" />
                <Card.Content description="10 000 SEK" />
              </Card>
            </Form.Field>
          </Form.Field>
          <Form.Field>
            <label>Credit Card Number:</label>
            <Form.Field>
              <CardNumberElement />
            </Form.Field>
          </Form.Field>
          <Form.Field>
            <label>Expire Date:</label>
            <Form.Field>
              <CardExpiryElement />
            </Form.Field>
          </Form.Field>
          <Form.Field>
            <label>CVC Number:</label>
            <Form.Field>
              <CardCvcElement />
            </Form.Field>
          </Form.Field>
          <Form.Field>
            <Button onClick={this.submitPayment} id="submit-payment-button">
              Proceed with Payment
            </Button>
          </Form.Field>
        </Form>
      );
    }

    if (this.state.success !== "") {
      paymentStatus = (
        <Card>
          <Card.Content header={this.state.success} />
        </Card>
      );
    }

    if (this.state.error !== "") {
      paymentStatus = (
        <Card>
          <Card.Content header={this.state.error} />
        </Card>
      );
    }
    return (
      <Container>
        {paymentStatus}
        {stripeForm}
      </Container>
    );
  }
}

const mapDispatchToProps = {
  dispatchFlash: (message, status) => ({
    type: "SHOW_FLASH_MESSAGE",
    payload: { flashMessage: message, status: status }
  }),
};

export default connect(mapDispatchToProps)(LoginForm);

export default injectStripe(CheckoutForm);
