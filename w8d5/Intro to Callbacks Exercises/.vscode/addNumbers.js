const readline = require("readline");

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

const addNumbers = (sum, numsLeft, completionCallback) => {
    if (numsLeft > 0) {
        reader.question("Enter a number: ", numberStr => {
            sum += parseInt(numberStr);

            console.log(sum);

            addNumbers(sum, numsLeft - 1, completionCallback);
        });
    } else {
        completionCallback(sum);
    }
}



addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));