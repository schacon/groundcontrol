if (typeof GroundControl == "undefined"){ var GroundControl = {}; }


// create the first class
GroundControl.Hosts = {};
// initialize the page refreshing for the watch_exercise view

GroundControl.Hosts.watch_exercise_init = function(exercise_div_id, exercise_id) {
    if (exercise_id <= 0) return exercise_id; // allow a pass thru for testing/mocking
    
    var refreshId = setInterval(function() {
         $(exercise_div_id).load('/hosts/exercise/' + exercise_id);
    }, 3000);
    return refreshId;
}
