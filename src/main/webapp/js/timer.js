function startTimer(durationMinutes, display) {
    var timer = durationMinutes * 60, minutes, seconds;
    var interval = setInterval(function () {
        minutes = parseInt(timer / 60, 10);
        seconds = parseInt(timer % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.textContent = minutes + ":" + seconds;

        if (--timer < 0) {
            clearInterval(interval);
            alert("Time is up! Submitting your quiz.");
            document.getElementById("quizForm").submit();
        }
    }, 1000);
}
