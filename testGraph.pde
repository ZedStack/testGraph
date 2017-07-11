// Badge myBadge;

Badge [] tankBadge;
Badge [] sensorBadge;
Badge [] arduinoBadge;
Badge [] locoM5Badge;
Badge [] pumpBadge;
Link  [] link;

// Link myLink1;
// Link myLink2;
// Link myLink3;
// Link myLink4;
// Link myLink5;

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

// TODO: Simplify both pls
void setBadgeCoords () {
    tankBadge [0].newCoords (
        width / 8,
        (height / 8) * 3
    );
    tankBadge [1].newCoords (
        (width / 8) * 7,
        (height / 8) * 3
    );

    sensorBadge [0].newCoords (
        (width / 16) * 3,
        (height / 8) * 5
    );
    sensorBadge [1].newCoords (
        width / 16,
        height / 4
    );
    sensorBadge [2].newCoords (
        width / 8,
        height / 4
    );
    sensorBadge [3].newCoords (
        (width / 16) * 15,
        height / 4
    );
    sensorBadge [4].newCoords (
        (width / 16) * 14,
        height / 4
    );
    sensorBadge [5].newCoords (
        (width / 16) * 13,
        (height / 8) * 5
    );

    arduinoBadge [0].newCoords (
        (width / 16) * 3,
        (height / 4) * 3
    );
    arduinoBadge [1].newCoords (
        width / 8,
        height / 8
    );
    arduinoBadge [2].newCoords (
        (width / 8) * 7,
        height / 8
    );
    arduinoBadge [3].newCoords (
        (width / 16) * 13,
        (height / 4) * 3
    );

    pumpBadge [0].newCoords (
        width / 8,
        (height / 4) * 3
    );
    pumpBadge [1].newCoords (
        (width / 16) * 3,
        height / 4
    );
    pumpBadge [2].newCoords (
        (width / 16) * 13,
        height / 4
    );
    pumpBadge [3].newCoords (
        (width / 16) * 14,
        (height / 4) * 3
    );

    locoM5Badge [0].newCoords (
        (width / 16) * 5,
        (height / 4) * 3
    );
    locoM5Badge [1].newCoords (
        (width / 16) * 5,
        height / 4
    );
    locoM5Badge [2].newCoords (
        (width / 8) * 3,
        height / 8
    );
    locoM5Badge [3].newCoords (
        (width / 8) * 5,
        height / 8
    );
    locoM5Badge [4].newCoords (
        (width / 16) * 11,
        height / 4
    );
    locoM5Badge [5].newCoords (
        (width / 16) * 11,
        (height / 4) * 3
    );
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
    for (int i = 0; i < linksAmount; i++) link [i].render ();
}
void render () {
    renderLinks  ();
    renderBadges ();
}

void setup () {
    backgroundColor = color (33, 33, 30);
    linksAmount     = 27;

    size        (1024, 576);
    // fullScreen ();
    background  (backgroundColor);
    ellipseMode (CENTER);
    textAlign   (CENTER, CENTER);
    frameRate (30);
    // noStroke ();

    tankBadge    = new Badge [badgeAmount [0]]; // Four water tanks
    sensorBadge  = new Badge [badgeAmount [1]]; // Eight sensors (total)
    arduinoBadge = new Badge [badgeAmount [2]]; // Four arduinos
    locoM5Badge  = new Badge [badgeAmount [3]]; // Six locoM5
    pumpBadge    = new Badge [badgeAmount [4]]; // Four water pumps

    link         = new Link  [linksAmount]; // 27 links in total

    // TODO: Make all in 1 for loop
    for (int i = 0; i < max (badgeAmount); i++) {
        if (i < badgeAmount [0]) tankBadge    [i] = new Badge (0);
        if (i < badgeAmount [1]) sensorBadge  [i] = new Badge (1);
        if (i < badgeAmount [2]) arduinoBadge [i] = new Badge (2);
        if (i < badgeAmount [3]) locoM5Badge  [i] = new Badge (3);
        if (i < badgeAmount [4]) pumpBadge    [i] = new Badge (4);
    }

    setBadgeCoords ();
    renderBadges ();
    setLinkCoords ();

    // It will be added to the 'draw' function later
    render ();
}

void draw () {
    // render ();
}
