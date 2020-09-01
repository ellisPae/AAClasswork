Function.prototype.inherits = function(SuperClass){
    function Surrogate() {};
    Surrogate.prototype = SuperClass.prototype
    this.prototype = new Surrogate();
    this.prototype.constructor = this;

};



Function.prototype.inherits2 = function (SuperClass) {
    this.prototype = Object.create(SuperClass.prototype);
    this.prototype.constructor = this;
}
 

function MovingObject () {
}

function Ship () {}
Ship.inherits2(MovingObject);
// console.log(Ship.prototype)
// console.log(MovingObject.prototype)

function Asteroid () {}
Asteroid.inherits2(MovingObject);
// console.log(Asteroid.prototype.__proto__)






MovingObject.prototype.velocity = (function (dist, time) {
    return (dist / time);
});

Ship.prototype.shoots = (function () {
    console.log("Pew Pew");
}
);

Asteroid.prototype.collide = (function () {
    console.log("gotcha!");
}); 

let mo = new MovingObject();
let s = new Ship();
let a = new Asteroid ();

// console.log(mo.velocity(1000, 10));
// console.log(s.velocity(1000, 10));
// console.log(a.velocity(100, 10));

console.log("-------------------------")

s.shoots(); // good
// mo.shoots(); // bad
// a.shoots();  // bad

console.log("-------------------------")

a.collide(); //good
// mo.collide(); //bad
// s.collide(); // bad
