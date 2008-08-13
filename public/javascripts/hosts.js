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

// initiates a performance test, gathers AUT info from the user.
// aut_version_field_name, aut_note_field_name are passed as args to avoid storing model field names here in JS.
GroundControl.Hosts.exercise_performance = function(submit_to_url, aut_version_field_name, aut_note_field_name) {
    var is_test     = (arguments[3] == true); // if passed, ths 4th arg indicates that this method is called as part of an automated test
    var aut_version = is_test ? '': prompt("Enter build number (optional)");
    var aut_note    = is_test ? '': prompt("Enter any notes you care to record for this test (optional)");
    // makes use of the Prototype JS lib
    var form_el                = new Element('form',  {'method':'POST',  'action':submit_to_url});
    var form_field_aut_version = new Element('input', {  'type':'hidden',  'name':aut_version_field_name, 'value':aut_version});
    var form_field_aut_note    = new Element('input', {  'type':'hidden',  'name':aut_note_field_name,    'value':aut_note});
    Element.insert(document.body, form_el);
    Element.insert(form_el,       form_field_aut_version);
    Element.insert(form_el,       form_field_aut_note);
    if (is_test) return form_el;
    form_el.submit();
}

GroundControl.Hosts.show_exercise_form = function(element_id) {
    $(element_id).show();
}

GroundControl.Hosts.hide_exercise_form = function(element_id) {
    $(element_id).hide();
}
