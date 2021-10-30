
import React, { useState,useCallback } from "react";
import moment from "moment-timezone";
import Datetime from "react-datetime";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faCalendarAlt } from '@fortawesome/free-solid-svg-icons';
import { Col, Row, Card, Form, Button, InputGroup, FormLabel } from '@themesberg/react-bootstrap';
import {useDropzone} from 'react-dropzone'

import  './dropbox.css'
export const GeneralInfoForm = () => {
  const [claimdate, setClaimDate] = useState("");
  const onDrop = useCallback(acceptedFiles => {
    // Do something with the files
  }, [])
  const {getRootProps, getInputProps, isDragActive} = useDropzone({onDrop})

  return (
    <Card border="light" className="bg-white shadow-sm mb-4">
      <Card.Body>
        <h5 className="mb-4">Insurance Form</h5>
        <Form>
          
            
              <Form.Group id="firstName">
                <Form.Label>Insurance Company Name</Form.Label>
                <Form.Control required type="text" placeholder="Enter your first name" />
              </Form.Group>
           
          
              <Form.Group id="lastName">
                <Form.Label>Hospital Name</Form.Label>
                <Form.Control required type="text" placeholder="Also your last name" />
              </Form.Group>
            
          
            
              <Form.Group id="claimdate">
                <Form.Label>Claim Date</Form.Label>
                <Datetime
                  timeFormat={false}
                  onChange={setClaimDate}
                  renderInput={(props, openCalendar) => (
                    <InputGroup>
                      <InputGroup.Text><FontAwesomeIcon icon={faCalendarAlt} /></InputGroup.Text>
                      <Form.Control
                        required
                        type="text"
                        value={claimdate ? moment(claimdate).format("MM/DD/YYYY") : ""}
                        placeholder="mm/dd/yyyy"
                        onFocus={openCalendar}
                        onChange={() => { }} />
                    </InputGroup>
                  )} />
              </Form.Group>
          
            <Form.Group id="claimamount">
                <FormLabel>Claim Amount</FormLabel>
                <Form.Control required type="number" placeholder="0.0" />
            </Form.Group>
            <Row>
          <Form.Group id="fileupload" >
          <div style={{align:'center'}} {...getRootProps()}>
      <input {...getInputProps()} />
      {
        isDragActive ?
          <div className="container">
            <div className="drop-container">
              <p>Drop the files here ...</p> 
              
            </div>
          </div>   
          :
          <div className="container">
            <div className="drop-container">
              
              <p>Drag 'n' drop some files here, or click to select files</p>
            </div>
          </div> 
          
      }
    </div>
    
    </Form.Group>
    </Row>
          <div className="mt-3">
            <Button variant="primary" type="submit">Save All</Button>
          </div>
        </Form>
      </Card.Body>
    </Card>
  );
};
