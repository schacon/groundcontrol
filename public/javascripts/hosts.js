if (typeof GroundControl == "undefined"){ var GroundControl = {}; }


// create the first class
GroundControl.Hosts = {};

// initialize the page refreshing for the watch_exercise view
GroundControl.Hosts.watch_exercise_init = function(exercise_div_id, exercise_id) {
    if (exercise_id <= 0) return exercise_id; // allow a pass thru for testing/mocking
    
    var refreshId = setInterval(function() {
         $('#' + exercise_div_id).load('/hosts/exercise/' + exercise_id); // this line uses jquery
    }, 3000);
    return refreshId;
}

GroundControl.Hosts.run_performance_test = function(submit_to_url) {
    var aut_version = prompt("Enter build number (optional)");
    var aut_note    = prompt("Enter any notes you care to record for this test (optional)");
    
    // makes use of the Prototype JS lib
    var form_el                = new Element('form',  {'method': 'POST',  'action': submit_to_url});
    var form_field_aut_version = new Element('input', {  'type': 'hidden', 'value': aut_version});
    var form_field_aut_note    = new Element('input', {  'type': 'hidden', 'value': aut_note});
    Element.insert(document.body, form_el);
    Element.insert(form_el, form_field_aut_version);
    Element.insert(form_el, form_field_aut_note);
    form_el.submit();
}
