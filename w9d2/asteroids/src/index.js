const MovingObject = require("./moving_object.js");
window.MovingObject = MovingObject;


document.getElementById("DOMContentLoaded", function () {
    const canvasEl = document.getElementsByTagName("canvas")[0];
    canvasEl.width = Game.DIM_X;
    canvasEl.height = Game.DIM_Y;

    const ctx = canvasEl.getContext("2d");
    const game = new Game();
    new GameView(game, ctx).start();
});