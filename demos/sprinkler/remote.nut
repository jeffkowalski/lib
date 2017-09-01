// Sprinkler Remote Demo
//
// See readme.txt for more information.
//
// This work is released under the Creative Commons Zero (CC0) license.
// See http://creativecommons.org/publicdomain/zero/1.0/dofile("sd:/lib/buses/hunter/hunter.nut");

require("GPIO");

// Include the Hunter bus class
dofile("sd:/lib/buses/hunter/hunter.nut");

//
sr Define your programs here.  Hunter supports 3 or 4 programs depending
// on the model.
//
programs <- [
    // Program A
    "Everything"
];

//
// Define your zones here in numerical order starting with zone 1.
//
zones <- [
    "back lawn north (right)"
    "back lawn south (left)"
    "rock garden south (left) of lawn and maple pots on back deck"
    "jasmine under deck, basement, deck pots, brick pots south of patio"
    "laurels northeast (top right) of driveway"
    "northeast (top right) pine and beds north of driveway"
    "northeast (top right) corner and beds east of driveway"
    "front walkway along north fence"
    "front walk south"
    "front walk middle"
    "horseshoe around roses, then north of office along fence"
    "north roses and planting north of family room and office"
    "utility path and pots near guest room"
    "east jasmine, rose semicircle"
    "west jasmine and steps to planting beds"
    "rose garden below path toward driveway"
    "south planting boxes"
    "north planting boxes"
    "fruit trees at west and southwest lower fence"
    "drip lines at south lower fence"
    "rose garden below path near planting boxes"
    "hedges above pool and rose pots"
    "planting on east (right) side of driveway"
    "east (right) side along driveway"
    "bottom east (right) driveway"
    "top right (east) and bottom left (west) of driveway"
    "left (west) or driveway against field"
    "west (left) of driveway"
    "top left (west) of driveway"
    "(no connection)"
    "walkway near iron gate"
    "middle jasmine and center of redwoods"
];

function init()
{
    //
    // Enable the bus output
    //
    oe <- GPIO(2);
    oe.low();
    oe.output();

    //
    // Create the hunter instance
    //
    hunter <- Hunter(0);
}

//
// ERPC functions
//
function getZones()
{
    return zones;
}

function getPrograms()
{
    return programs;
}

function startZone(params)
{
  	hunter.start(params[0] + 1, params[1]);
}

function startProgram(params)
{
   	hunter.program(params[0] + 1);
}

function stop()
{
    hunter.stop();
}

//
// Initialize the nut
//
init();
