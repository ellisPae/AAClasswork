function sum() {
    let args = Array.prototype.slice.call(arguments)
    return args.reduce((acc, el) => acc + el);

    // let summing = 0;
    // for(let i=0; i < arguments.length; i++){
    //     summing += arguments[i];
    // };

    // return summing;
};

console.log(sum(1, 2, 3, 4));    // === 10;
console.log("--------------")
console.log(sum(1, 2, 3, 4, 5));    // === 15;



function newSum(...nums) {
    return nums.reduce((acc, el) => acc + el);
}


console.log(newSum(1, 2, 3, 4));    // === 10;
console.log("--------------")
console.log(newSum(1, 2, 3, 4, 5));    // === 15;


/***********************************************************************/


// Function.prototype.myBind = function(ctx) {
//     const that = this;
//     let bindArgs = Array.from(arguments).slice(1);
// //bind time

// //calltime
//     return function () {
//         // let bindArgs = Array.prototype.slice.call(arguments) 
//         let callArgs = Array.from(arguments);
//         return that.apply(ctx, bindArgs.concat(callArgs));
//     };
// }




//we have thisfunction A
//we need to bind a's context to function b

    //A                //bind            //this context
//Function.prototype.myBind = function (ctx) {
    //return context    //using this function
    // return function (b) {
        
        
    // }
// }

Function.prototype.myBind = function (context, ...bindArgs) {
  const that = this;
  return function (...callArgs) {
    return that.apply(context, bindArgs.concat(callArgs));
  };
};




class Cat {
    constructor(name) {
        this.name = name;
    }

    says(sound, person) {
        console.log(`${this.name} says ${sound} to ${person}!`);
        return true;
    }
}

class Dog {
    constructor(name) {
        this.name = name;
    }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true

// // bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(pavlov, "meow", "Kush")();
// // Pavlov says meow to Kush!
// // true

// // no bind time args (other than context), call time args are "meow" and "a tree"
// markov.says.myBind(pavlov)("meow", "a tree");
// // Pavlov says meow to a tree!
// // true

// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(pavlov, "meow")("Markov");
// // Pavlov says meow to Markov!
// // true

// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");
// // Pavlov says meow to me!
// // true





/***********************************************************************/




function curriedSum(numArgs) {

    const nums = [];

    function _curriedSum(n) {
        nums.push(n);

        if(nums.length === numArgs){
            return nums.reduce((acc, el) => acc + el);
        }

        return _curriedSum;
    }

    return _curriedSum;

};

const cSum = curriedSum(5);
console.log(cSum(5)(30)(20)(1)); // => 56


/***********************************************************************/

//numargs
    //the number of arguments that our function is going to handle
//the arguments are handled inside the private function _curried
//those are pushed into an array
//when the array.length has the correct number of arguments(numArgs),
    //do something?? return?

Function.prototype.curry = function (numArgs) {
    let that = this;
    const args = [];

    function _curried (arg) {
        args.push(arg)

        // let arr = Array.from(arguments)
        // arr.forEach(ele => nums.push(ele));

        if (args.length === numArgs) {
            return that.apply(null, args)
            // context === this -> we don't care what the context is in this scenario

            // via spread:
            // return that(...args);
        } else {
            return _curried;
        }
    }    

    
    return _curried;
}




const adder = (n1, n2, n3) => {
    return n1 + n2 + n3;
};


let curried = adder.curry(3)
console.log(curried(1)(2)(3));




// const curried = curry(4);
// console.log(curried(5)(30)(20)(1));

// function toArray(args){
//   return Array.prototype.slice.call(args);
// }

// // curry function v0.1
// function myCurry1(fn){
//   var args = Array.prototype.slice.call(arguments, 1);
//   return function () {
//     return fn.apply(this, args.concat(toArray(arguments)));
//   };
// }