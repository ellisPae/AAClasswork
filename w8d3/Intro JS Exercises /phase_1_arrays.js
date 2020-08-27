
// Array.prototype.uniq = function() {
//     var uniqueValues = [];

//     for (let i = 0; i < this.length; i++) {
//         var num = this[i];
//         if (!uniqueValues.includes(num)) {
//             uniqueValues.push(num);
//         }
//     }
//     return uniqueValues;
// }

// // "this" === array we want to look at

// [1,2,2,3,3,3].uniq() //=> [1,2,3])


// Array.prototype.twoSum = function() {
//     let twoSumPairs = [];

//     for (let i = 0; i < this.length ; i++) {
//         for (let j = i + 1; j < this.length; j++) {
//            if   (this[i] + this[j] === 0) {
//                twoSumPairs.push([i, j]);
//            }
//         }
//      }

//     return twoSumPairs;
// }

// // [-1, 1, -4, 4].twoSum();   //=> [ [ 0, 1 ], [ 2, 3 ] ]
// // [0, 5, 1, -5, 0].twoSum(); //=> [ 0, 4 ], [ 1, 3 ] ]

Array.prototype.transpose = function() {
    const rows = this.length;
    const cols = this[0].length;
    const transposed = Array.from({length: cols}, function() {
       return Array.from({length: rows})
    });
    
    for (let i = 0; i < rows; i++) {
        for (let j = 0; j < cols; j++) {
            transposed[j][i] = this[i][j];
        }
    } 
    return transposed;
}

// Array.prototype.transpose = function () {
// let [row] = this;
// return row.map((value, col) => this.map(row=>row[col]));
// }

var arr1 = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]

];

console.log(arr1.transpose());

//arr1.map do |row|   row => [1,2,3]
 //   row * 2 = []
//  console.log(Array.from('foo'));
// // expected output: Array ["f", "o", "o"]
// console.log(Array.from([1, 2, 3], x => x + x));
// // expected output: Array [2, 4, 6]

