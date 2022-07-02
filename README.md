# zku.ONE

## Background Assignment
### Circuits
```circom
// Specifying compiler version for the .circom file 
pragma circom 2.0.3;

// Defining a template to multiply two input signals
template Multiplier2() {
   // Declaring input signals
   signal input in1;
   signal input in2;
   // Declaring output signal
   signal output out;
   // Assigning out to be the product of input signals in1 and in2 
   out <== in1 * in2;
   // Printing the output signal
   log(out);
}

// Initializing a 'Multiplier2()' component 'main' while defining the input signals in1 and in2 to be public
component main {public [in1,in2]} = Multiplier2();

/* INPUT = {
    "in1": "2",
    "in2": "9"
} */

```
![](./background_assignment/circuits/run.png)

### Smart Contracts
#### Safe Remote Purchase
```solidity
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;
contract Purchase {
    uint confirmedAt;

    ...

    function confirmPurchase()
        external
        inState(State.Created)
        condition(msg.value == (2 * value))
        payable
    {
        ...
        buyer = payable(msg.sender);
        confirmedAt = block.timestamp;
        state = State.Locked;
    }

    ...

    function completePurchase()
        external
        inState(State.Locked)
        condition(msg.sender == buyer || block.timestamp - confirmedAt >= 5 * 60)
    {
        emit ItemReceived();
        state = State.Release;
        buyer.transfer(value);

        emit SellerRefunded();
        state = State.Inactive;
        seller.transfer(3 * value);
    }
}
```
##### Contract Deployed
![](./background_assignment/smart_contracts/images/contract_deployed.png)
##### Purchase Confirmed
![](./background_assignment/smart_contracts/images/purchase_confirmed.png)
##### Seller Fails
![](./background_assignment/smart_contracts/images/seller_fails.png)
##### Seller Succeeds
![](./background_assignment/smart_contracts/images/seller_succeeds.png)

## Links
<!-- - [Background Assignment](https://docs.google.com/document/d/1EkelvfHdveddZ-wVLX-jiOMCK3NhqEi6NvF9pnCX_2o/edit?usp=sharing) -->
