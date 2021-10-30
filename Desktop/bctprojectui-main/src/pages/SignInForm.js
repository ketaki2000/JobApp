import React, { Component } from "react";
import { Link, useHistory } from "react-router-dom";

function SignInForm() {
  //   constructor() {
  //     super();

  //     this.state = {
  //       email: "",
  //       password: "",
  //     };

  //     this.handleChange = this.handleChange.bind(this);
  //     this.handleSubmit = this.handleSubmit.bind(this);
  //   }

  //   handleChange(event) {
  //     let target = event.target;
  //     let value = target.type === "checkbox" ? target.checked : target.value;
  //     let name = target.name;

  //     this.setState({
  //       [name]: value,
  //     });
  //   }

  //   handleSubmit(event) {
  //     event.preventDefault();

  //     console.log("The form was submitted with the following data:");
  //     console.log(this.state);
  //   }

  //
  //   render() {
  let history = useHistory();
  const routeHome = () => {
    let path = "/createinsurance";
    history.push(path);
  };
  return (
    <div className="formCenter">
      <form className="formFields">
        <div className="formField">
          <label className="formFieldLabel" htmlFor="email">
            E-Mail Address
          </label>
          <input
            type="email"
            id="email"
            className="formFieldInput"
            placeholder="Enter your email"
            name="email"
            required
            //value={this.state.email}
          />
        </div>

        <div className="formField">
          <label className="formFieldLabel" htmlFor="password">
            Password
          </label>
          <input
            type="password"
            id="password"
            className="formFieldInput"
            placeholder="Enter your password"
            name="password"
            required
            //value={this.state.password}
          />
        </div>

        <div className="formField">
          <button onClick={routeHome} className="formFieldButton">
            Log In
          </button>{" "}
          <Link to="/" className="formFieldLink">
            Create an account
          </Link>
        </div>
      </form>
    </div>
  );
}

export default SignInForm;
