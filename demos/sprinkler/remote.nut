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
// Define your programs here.  Hunter supports 3 or 4 programs depending
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
    "top of driveway, pine and beds east, and beds north"
    "laurels northeast (top right) of driveway"
    "jasmine under deck, basement, deck pots, brick pots south of patio"
    "front walk middle"
    "front walk south"
    "(unknown)"
    "horseshoe around roses, then north of office along fence"
    "front walkway along north fence"
    "north roses and planting north of family room and office"
    "east jasmine, rose semicircle, utility path and pots near guest room"
    "middle jasmine and center of redwoods"
    "west jasmine and steps to planting beds"
    "rose garden below path toward driveway"
    "planting boxes"
    "rose garden below path near planting boxes"
    "fruit trees at west and southwest lower fence"
    "drip lines at south lower fence"
    "(unknown)"
    "hedges above pool and rose pots"
    "bottom east (right) driveway"
    "planting on east (right) side of driveway"
    "(unknown)"
    "west (left) of driveway"
    "(unknown)"
    "(unknown)"
    "top left (west) of driveway"
    "(unknown)"
    "east (right) side along driveway"
    "(no connection)"
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
