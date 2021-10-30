import React, { useState } from "react";
import { Link , useHistory} from "react-router-dom";
import "../App.css";

function SignUpForm() {
  const [role, setRole] = useState("Patient");

  // constructor() {
  //   super();

  //   this.state = {
  //     email: "",
  //     password: "",
  //     name: "",
  //     hasAgreed: false,
  //   };
  //   // this.option={
  //   //   option:""
  //   // }

  //   this.handleChange = this.handleChange.bind(this);
  //   this.handleSubmit = this.handleSubmit.bind(this);
  // }

  // handleChange(event) {
  //   let target = event.target;
  //   let value = target.type === "checkbox" ? target.checked : target.value;
  //   let name = target.name;

  //   this.setState({
  //     [name]: value,
  //   });
  // }
  // // handleChangeSelect(val){
  // //   this.setState({option: val.target.value});
  // // }
  // handleSubmit(e) {
  //   e.preventDefault();

  //   console.log("The form was submitted with the following data:");
  //   console.log(this.state);
  // }

  // render() {
    let history = useHistory();
  const routeHome = () => {
    let path = '/createinsurance';
    history.push(path);
  };
  function handleRoleChange(e) {
    setRole(e.target.value);
  }
  return (
    <div className="formCenter">
      <form className="formFields">
        <select
          value={role}
          onChange={handleRoleChange}
          id="dropdown-basic-button"
        >
          <option>Patient</option>
          <option>Hospital Staff</option>
          <option>Insurance Company</option>
        </select>
        <input
          type="number"
          id="id"
          className="formFieldInput formField"
          placeholder="ID"
          name="id"
          disabled
        />

        <div className="formField">
          <label className="formFieldLabel" htmlFor="name">
            Full Name
          </label>
          <input
            type="text"
            id="name"
            required
            className="formFieldInput"
            placeholder={
              "Enter " +
              (role === "Hospital Staff" ? "Hospital" : role) +
              " Name"
            }
            name="name"
            //value={this.state.name}
            //onChange={this.handleChange}
          />
        </div>
        {role === "Hospital Staff" ? (
          <div>
            <div className="formField">
              <label className="formFieldLabel">Hospital Role</label>
              <input
                type="text"
                id="role"
                required
                className="formFieldInput"
                placeholder="Enter your role"
                name="role"
              />
            </div>
            <div className="formField">
              <label className="formFieldLabel">Hospital ID</label>
              <input
                type="number"
                id="hospital_id"
                required
                className="formFieldInput"
                placeholder="Enter your hospital ID"
                name="hospital_id"
              />
            </div>
          </div>
        ) : (
          <div></div>
        )}
        <div className="formField">
          <label className="formFieldLabel" htmlFor="email">
            E-Mail Address
          </label>
          <input
            type="email"
            id="email"
            required
            className="formFieldInput"
            placeholder="Enter your email"
            name="email"
            //value={this.state.email}
            //onChange={this.handleChange}
          />
        </div>
        <div className="formField">
          <label className="formFieldLabel">Phone Number</label>
          <input
            type="number"
            id="number"
            required
            className="formFieldInput"
            placeholder="Enter your number"
            name="number"
          />
        </div>
        <div className="formField">
          <label className="formFieldLabel">Address</label>
          <input
            required
            type="text"
            id="address"
            className="formFieldInput"
            placeholder="Enter your address"
            name="address"
          />
        </div>


        <div className="formField">
          <button type="submit" onClick={routeHome} className="formFieldButton">
            Sign Up
          </button>{" "}
          <Link to="/sign-in" className="formFieldLink">
            I'm already member
          </Link>
        </div>
      </form>
    </div>
  );
}
//}
export default SignUpForm;
