if (typeof GroundControl == "undefined"){ var GroundControl = {}; }


// initialize the class
GroundControl.Hosts = {};

// initialize the page refreshing for the watch_exercise view.
GroundControl.Hosts.watch_exercise_init = function(exercise_div_id, exercise_id) {
    if (exercise_id <= 0) return exercise_id; // allow a pass thru for testing/mocking
    
    var refreshId = setInterval(function() {
         $('#' + exercise_div_id).load('/hosts/exercise/' + exercise_id); // this line uses jquery
    }, 3000);
    return refreshId;
}


GroundControl.Hosts.show_exercise_form = function(element_id) {
    $(element_id).show();
}

GroundControl.Hosts.hide_exercise_form = function(element_id) {
    $(element_id).hide();
}
