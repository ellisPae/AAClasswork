const readline = require("readline");

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

const askIfGreaterThan = (el1, el2, callback) => {
    reader.question(`Is ${el1} greater than ${el2}? `, ans => {
        ans === 'yes' ? callback(true) : callback(false);
    }); 
}


const innerBubbleSort = (arr, i, madeAnySwaps, outerBubbleSortLoop) => {
    
    if (i == (arr.length - 1)) {
        outerBubbleSortLoop(madeAnySwaps);
        return arr;
    };

    if ( i < arr.length - 1 ) {
        askIfGreaterThan(arr[i], arr[i + 1], function (isGreaterThan) {
            if (isGreaterThan) {
                [arr[i], arr[i + 1]] = [arr[i+1], arr[i]];
                madeAnySwaps = true;
            }
            
            innerBubbleSort(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
        });
    }
}


const absurdBubbleSort = (arr, sortCompletionCallback) => {
    const outerBubbleSortLoop = madeAnySwaps => {
        // function outerBubbleSortLoop(booleanValue) {

        madeAnySwaps ? innerBubbleSort(arr, 0, false, outerBubbleSortLoop) : sortCompletionCallback(arr);
    };

    outerBubbleSortLoop(true);
}




absurdBubbleSort([3, 2, 1], function (arr) {
    console.log("Sorted array: " + JSON.stringify(arr));
    reader.close();
});