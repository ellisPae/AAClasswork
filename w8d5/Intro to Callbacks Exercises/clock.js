
class Clock {

    constructor() {   //=> initialize
        // 1. Create a Date object.
        let time = new Date();
        // Ruby: time = Date.new()

        // 2. Store the hours, minutes, and seconds.
        this.hours = time.getHours();
        this.minutes = time.getMinutes();
        this.seconds = time.getSeconds();

        // 3. Call printTime.
        this.printTime();
        
        debugger
        // 4. Schedule the tick at 1 second intervals.
        setInterval(this._tick.bind(this), 1000);
    }


    printTime() {
        // Format the time in HH:MM:SS
        let timeFormat = `${this.hours}:${this.minutes}:${this.seconds}`;
        // Use console.log to print it.
        console.log(timeFormat);
    }

    _tick() {
        // 1. Increment the time by one second.
        this.seconds++;

        if (this.seconds > 59) {
            this.minutes++;
            this.seconds = 0;
        }

        if (this.minutes > 59) {
            this.hours++;
            this.minutes = 0;
        }

        // 2. Call printTime.
        this.printTime();
    }


}

const clock = new Clock();