import React from 'react';

class Calculator extends React.Component{
  constructor(props){
    super(props);
    //your code here
    this.state = {
        num1: '',
        num2: '',
        result: 0
    };

    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);

    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
  }

  //your code here
  setNum1(e) {
    const num1 = e.target.value ? parseInt(e.target.value) : '';
    this.setState({num1});
  }
  
  setNum2(e) {
    const num2 = e.target.value ? parseInt(e.target.value) : ''; 
    this.setState({num2});
  }

  add(e){
    e.preventDefault();
    const result = this.state.num1 + this.state.num2;
    this.setState({result});
  }

  substract(e){

  }

  multiply(e){

  }

  divide(e) {

  }

  clear(e){

  }

  render(){
    // object deconstructuring?
    debugger
    const { num1, num2, result } = this.state;
    return (
      <div>
        <h1>{result}</h1>

        <input onChange={this.setNum1} value={num1}/>
        <input onChange={this.setNum2} value={num2}/>

        <button onClick={this.add}>+</button>



      </div>
    );
  }
}

export default Calculator;
