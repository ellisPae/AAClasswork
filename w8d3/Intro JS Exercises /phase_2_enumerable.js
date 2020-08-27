const NUMS = [1, 2, 3, 4, 5];

Array.prototype.myEach = function(callback) {
    for (let i = 0; i < this.length; i++) {
        callback(this[i]);
    }
}

NUMS.myEach((num) => {console.log(num*2)}));


/*********************************************************************/

Array.prototype.myMap = function(callback) {
    var mapped = [];
    for (let i = 0; i < this.length; i++) {
        mapped.push(callback(this[i]));
    }
    return mapped;
}

NUMS.myMap((num) => {return num * num})



/*********************************************************************/


Array.prototype.myReduce = function(callback, initialValue) {

    let arr = this;

    if (initialValue === undefined) {
        initialValue = arr[0];
        arr.shift();
    }

    let accum = initialValue
    arr.myEach(el => accum = callback(accum, el));

    return accum;
}

[0, 1, 2, 3, 4].reduce((accumulator, currentValue, currentIndex, array) => accumulator + currentValue)


// without initialValue
[1, 2, 3].myReduce(function(acc, el) {
    return acc + el;
  }); // => 6
  
  // with initialValue
  [1, 2, 3].myReduce(function(acc, el) {
    return acc + el;
  }, 25); // => 31
  

/*********************************************************************/


Array.prototype.bubbleSort = function() {
    let sorted = false;
    
    while (sorted===false) {
        sorted = true;

        for (let i = 0; i < this.length - 1; i++) {
            if (this[i] > this[i + 1]) {
                [this[i], this[i + 1]] = [this[i+1], this[i]];
                sorted = false;
            }
        }
    }
    return this; 
}

arr15 = [3,9,0,1,6,2];
arr15.bubbleSort();


/*********************************************************************/

String.prototype.substrings = function() {
    let subs = [];

    for (let i = 0; i < this.length; i++) {
        for (let j = i + 1; j < this.length; j++) {
            subs.push(this.slice(i, j));
        }
    }

    return subs;
}

"cats".substrings();

