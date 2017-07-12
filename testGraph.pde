// Badge myBadge;

Badge [] tankBadge;
Badge [] sensorBadge;
Badge [] arduinoBadge;
Badge [] locoM5Badge;
Badge [] pumpBadge;
Link  [] link;

PFont fontRoboto;

color backgroundColor;
int linksAmount;

color [] colorBadge = {
    color (121, 85, 72), // Tank - Brown 500
    color (255,235, 59), // Sensor - Yellow 500
    color (3,169,244),   // Arduino - Light blue 500
    color (158,158,158), // LocoM5 - Gray 500
    color (244, 67, 54)  // Pump - rgb(244,67,54)
};
char [] letterBadge = {
    'T', // Tank
    'S', // Sensor
    'A', // Arduino
    'L', // LocoM5
    'B'  // Pump
};
int [] badgeAmount = {
    2, // Water tanks
    6, // Sensors
    4, // Arduinos
    6, // LocoM5
    4  // Water pumps
};

int getWidth (int sector) {
    return (width / 16) * sector;
}
int getHeight (int sector) {
    return (height / 8) * sector;
}

// TODO: Simplify both pls
void setBadgeCoords () {
    tankBadge    [0].newGridCoords (2, 3);
    tankBadge    [1].newGridCoords (14, 3);
    sensorBadge  [0].newGridCoords (3, 5);
    sensorBadge  [1].newGridCoords (1, 2);
    sensorBadge  [2].newGridCoords (2, 2);
    sensorBadge  [3].newGridCoords (15, 2);
    sensorBadge  [4].newGridCoords (14, 2);
    sensorBadge  [5].newGridCoords (13, 5);
    arduinoBadge [0].newGridCoords (3, 6);
    arduinoBadge [1].newGridCoords (2, 1);
    arduinoBadge [2].newGridCoords (14, 1);
    arduinoBadge [3].newGridCoords (13, 6);
    pumpBadge    [0].newGridCoords (2, 6);
    pumpBadge    [1].newGridCoords (3, 2);
    pumpBadge    [2].newGridCoords (13, 2);
    pumpBadge    [3].newGridCoords (14, 6);
    locoM5Badge  [0].newGridCoords (5, 6);
    locoM5Badge  [1].newGridCoords (5, 2);
    locoM5Badge  [2].newGridCoords (6, 1);
    locoM5Badge  [3].newGridCoords (10, 1);
    locoM5Badge  [4].newGridCoords (11, 2);
    locoM5Badge  [5].newGridCoords (11, 6);
}
void setLinkCoords () {
    link [0]  = new Link (locoM5Badge [0], locoM5Badge  [1]);
    link [1]  = new Link (locoM5Badge [2], locoM5Badge  [3]);
    link [2]  = new Link (locoM5Badge [4], locoM5Badge  [5]);
    link [3]  = new Link (sensorBadge [0], arduinoBadge [0]);
    link [4]  = new Link (sensorBadge [1], arduinoBadge [1]);
    link [5]  = new Link (sensorBadge [2], arduinoBadge [1]);
    link [6]  = new Link (sensorBadge [3], arduinoBadge [2]);
    link [7]  = new Link (sensorBadge [4], arduinoBadge [2]);
    link [8]  = new Link (sensorBadge [5], arduinoBadge [3]);
    link [9]  = new Link (pumpBadge   [0], tankBadge    [0]);
    link [10] = new Link (pumpBadge   [1], tankBadge    [0]);
    link [11] = new Link (pumpBadge   [2], tankBadge    [1]);
    link [12] = new Link (pumpBadge   [3], tankBadge    [1]);
    link [13] = new Link (locoM5Badge [0], arduinoBadge [0]);
    link [14] = new Link (locoM5Badge [1], arduinoBadge [1]);
    link [15] = new Link (locoM5Badge [2], arduinoBadge [1]);
    link [16] = new Link (locoM5Badge [3], arduinoBadge [2]);
    link [17] = new Link (locoM5Badge [4], arduinoBadge [2]);
    link [18] = new Link (locoM5Badge [5], arduinoBadge [3]);
    link [19] = new Link (pumpBadge   [0], arduinoBadge [0]);
    link [20] = new Link (pumpBadge   [1], arduinoBadge [1]);
    link [21] = new Link (pumpBadge   [2], arduinoBadge [2]);
    link [22] = new Link (pumpBadge   [3], arduinoBadge [3]);
    link [23] = new Link (sensorBadge [1], tankBadge    [0]);
    link [24] = new Link (sensorBadge [2], tankBadge    [0]);
    link [25] = new Link (sensorBadge [3], tankBadge    [1]);
    link [26] = new Link (sensorBadge [4], tankBadge    [1]);
}
void renderBadges () {
    for (int i = 0; i < max (badgeAmount); i++) {
        if (i < badgeAmount [0]) tankBadge    [i].render ();
        if (i < badgeAmount [1]) sensorBadge  [i].render ();
        if (i < badgeAmount [2]) arduinoBadge [i].render ();
        if (i < badgeAmount [3]) locoM5Badge  [i].render ();
        if (i < badgeAmount [4]) pumpBadge    [i].render ();
    }
}
void renderLinks () {
    // boolean renderNow = true;
    //
    // for (int i = 0; i < linksAmount; i++) {
    //     if (link [i].check ()) {
    //         renderNow = false;
    //         break;
    //     }
    // }
    //
    // if (renderNow)
    for (int i = 0; i < linksAmount; i++) link [i].render ();
}

void clearScreen () {
    noStroke ();
    fill (backgroundColor);
    rect (0, 0, width, height);
}
void render () {
    clearScreen ();

    renderLinks  ();
    renderBadges ();
}

void setup () {
    backgroundColor = color      (33, 33, 30);
    linksAmount     = 27;
    fontRoboto      = createFont ("Roboto mono", 17);

    size        (1024, 576);
    // fullScreen ();
    background  (backgroundColor);
    ellipseMode (CENTER);
    rectMode    (CORNERS);
    textAlign   (CENTER, CENTER);
    frameRate   (30);
    textFont    (fontRoboto);
    // noStroke ();

    tankBadge    = new Badge [badgeAmount [0]]; // Four water tanks
    sensorBadge  = new Badge [badgeAmount [1]]; // Eight sensors (total)
    arduinoBadge = new Badge [badgeAmount [2]]; // Four arduinos
    locoM5Badge  = new Badge [badgeAmount [3]]; // Six locoM5
    pumpBadge    = new Badge [badgeAmount [4]]; // Four water pumps

    link         = new Link  [linksAmount]; // 27 links in total

    // TODO: Make all in 1 for loop
    for (int i = 0; i < max (badgeAmount); i++) {
        if (i < badgeAmount [0]) tankBadge    [i] = new Badge (0, "Tank " + i);
        if (i < badgeAmount [1]) sensorBadge  [i] = new Badge (1, "Sensor " + i);
        if (i < badgeAmount [2]) arduinoBadge [i] = new Badge (2, "Arduino " + i);
        if (i < badgeAmount [3]) locoM5Badge  [i] = new Badge (3, "LocoM5 " + i);
        if (i < badgeAmount [4]) pumpBadge    [i] = new Badge (4, "Water pump " + i);
    }

    setBadgeCoords ();
    renderBadges ();
    setLinkCoords ();
}

void draw () {
    render ();
}

// void toggleBadgeSelectForAll (Badge exception, boolean value) {
//     for (int i = 0; i < max (badgeAmount); i++) {
//         if (i < badgeAmount [0] && tankBadge    [i] != exception) { tankBadge    [i].toggleBadgeSelect (); }
//         if (i < badgeAmount [1] && sensorBadge  [i] != exception) { sensorBadge  [i].toggleBadgeSelect (); }
//         if (i < badgeAmount [2] && arduinoBadge [i] != exception) { arduinoBadge [i].toggleBadgeSelect (); }
//         if (i < badgeAmount [3] && locoM5Badge  [i] != exception) { locoM5Badge  [i].toggleBadgeSelect (); }
//         if (i < badgeAmount [4] && pumpBadge    [i] != exception) { pumpBadge    [i].toggleBadgeSelect (); }
//     }
// }

void mousePressed () {
    for (int i = 0; i < max (badgeAmount); i++) {
        if (i < badgeAmount [0] && tankBadge    [i].mouseOver ()) { tankBadge    [i].toggleBadgeSelect (); }
        if (i < badgeAmount [1] && sensorBadge  [i].mouseOver ()) { sensorBadge  [i].toggleBadgeSelect (); }
        if (i < badgeAmount [2] && arduinoBadge [i].mouseOver ()) { arduinoBadge [i].toggleBadgeSelect (); }
        if (i < badgeAmount [3] && locoM5Badge  [i].mouseOver ()) { locoM5Badge  [i].toggleBadgeSelect (); }
        if (i < badgeAmount [4] && pumpBadge    [i].mouseOver ()) { pumpBadge    [i].toggleBadgeSelect (); }
    }
}
// void keyPressed () {
//     boolean toggleNow = false;
//
//     for (int i = 0; i < max (badgeAmount); i++) {
//         if (i < badgeAmount [0] && tankBadge    [i].toggled) { toggleNow = true; break; }
//         if (i < badgeAmount [1] && sensorBadge  [i].toggled) { toggleNow = true; break; }
//         if (i < badgeAmount [2] && arduinoBadge [i].toggled) { toggleNow = true; break; }
//         if (i < badgeAmount [3] && locoM5Badge  [i].toggled) { toggleNow = true; break; }
//         if (i < badgeAmount [4] && pumpBadge    [i].toggled) { toggleNow = true; break; }
//     }
//
//     if (toggleNow && key == 'a')
//     for (int i = 0; i < max (badgeAmount); i++) {
//         if (i < badgeAmount [0]) tankBadge    [i].toggleBadgeRender (false);
//         if (i < badgeAmount [1]) sensorBadge  [i].toggleBadgeRender (false);
//         if (i < badgeAmount [2]) arduinoBadge [i].toggleBadgeRender (false);
//         if (i < badgeAmount [3]) locoM5Badge  [i].toggleBadgeRender (false);
//         if (i < badgeAmount [4]) pumpBadge    [i].toggleBadgeRender (false);
//     }
// }
