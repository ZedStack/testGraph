public class Badge {
    private int    _diameter;
    private int    _status; // 0->green || 1->red || 2->grey
    private int    _badgeType; // 0->Tank || 1->Sensor || 2-> Arduino || 3->LocoM5
    private char   _letter;
    private String _label; // Sort of ID thingy
    private float  _lightenValue;
    private float  _darkenValue;
    private color  _green;
    private color  _red;
    private color  _gray;
    private color  _badgeColor;
    private color  _badgeColorSelected;
    private color  _rectangleColor;

    public boolean toggled; // to draw the badge or the data
    public boolean selected; // to draw the data of the selected badge
    public CoordSystem coord;

    private color _getColorStatus () {
        return ((_status == 0)? _green : ((_status == 1)? _red : _gray));
    }
    private color _newColorByBrightness (color c, float value) {
        return color (red (c) * value, green (c) * value, blue (c) * value);
    }
    public boolean mouseOver () {
        return sqrt(sq(coord.xAxis - mouseX) + sq(coord.yAxis - mouseY)) < _diameter / 2;
    }
    // Not really necesary right now...
    private boolean _mousePressed () {
        return mousePressed && mouseButton == LEFT;
    }

    private void _firstCircle () {
        fill (mouseOver ()? _newColorByBrightness (_getColorStatus (), _lightenValue) : _getColorStatus ());
        ellipse (
            coord.xAxis,
            coord.yAxis,
            _diameter,
            _diameter
        );
    }
    private void _secondCircle () {
        fill (mouseOver ()? _newColorByBrightness (_badgeColor, _lightenValue) : _badgeColor);
        ellipse (
            coord.xAxis,
            coord.yAxis,
            _diameter * 0.75,
            _diameter * 0.75
        );

        fill (color (0));
        textSize (17);
        textAlign (CENTER, CENTER);
        text (
            _letter,
            coord.xAxis,
            coord.yAxis - 2
        );
    }
    private void _lowerRectangle () {
        if (mouseOver () || selected) {
            fill (_rectangleColor);
            rect (
                0,
                height,
                width,
                height - 30
            );

            fill (0);
            textSize (13);
            textAlign (LEFT, BOTTOM);
            text (_label, 0, height - 6);


        }
    }
    private void _selectedCircle () {
        // fill (mouseOver ()? _newColorByBrightness (_badgeColorSelected, _lightenValue) : _badgeColorSelecte);
        fill (255, 0, 0);
        ellipse (
            coord.xAxis,
            coord.yAxis,
            _diameter * 1.2,
            _diameter * 1.2
        );
    }

    public Badge (int xAxis, int yAxis, int badgeType, String label) {
        coord = new CoordSystem (xAxis, yAxis);
        toggled = true;
        selected = false;

        _badgeType = badgeType;
        _label     = label;

        _status = 0; // For testing only

        _green          = color (100, 221, 23); // Ok - Light green A500
        _red            = color (213, 0, 0);    // Warning - Red A500
        _gray           = color (66, 66, 66);   // Inactive - Geay 800
        _rectangleColor = color (96, 125, 139);

        _lightenValue = 1.2;
        _darkenValue = 0.8;

        _diameter = 40;

        _letter             = letterBadge [_badgeType];
        _badgeColor         = colorBadge  [_badgeType];
        _badgeColorSelected =              _badgeColor;
    }
    public Badge (int badgeType, String lavel) {
        this (width / 2, height / 2, badgeType, lavel);
    }
    public Badge (int badgeType) {
        this (width / 2, height / 2, badgeType, "?");
    }

    public void render () {
        // Render settings
        noStroke ();
        textSize (15);
        // Render settings

        // Draw
        if (toggled) {
            if (selected) _selectedCircle ();
            _firstCircle ();
            _secondCircle ();
            _lowerRectangle ();
        }
        else {
            fill (0);
            rect (0, 0, 300, 300);
        }
        // Draw
    }

    public void newCoordX (int newCoord) {
        coord.xAxis = newCoord;
    }
    public void newCoordY (int newCoord) {
        coord.yAxis = newCoord;
    }
    public void newCoords (int newCoordX, int newCoordY) {
        newCoordX (newCoordX);
        newCoordY (newCoordY);
    }
    public void newGridCoords (int x, int y) {
        newCoordX ((width / 16) * x);
        newCoordY ((height / 8) * y);
    }

    public void newLabel (String newLabel) {
        _label = newLabel;
    }

    // TODO: Finish this
    public void loadData (/* Some global strings here */) {

    }
    public void toggleBadgeRender () {
        toggled = !toggled;
    }
    public void toggleBadgeRender (boolean state) {
        toggled = state;
    }
    public void toggleBadgeSelect () {
        selected = !selected;
    }
    public void toggleBadgeSelect (boolean state) {
        selected = state;
    }
}
