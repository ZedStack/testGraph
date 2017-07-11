public class Badge {
    // TODO: Each badge needs a ID (not unique)
    private int         _radius;
    private int         _status;    // 0->green || 1->red    || 2->grey
    private int         _badgeType; // 0->Tank  || 1->Sensor || 2-> Arduino || 3->LocoM5
    private char        _letter;
    private String      _label;
    private color       _green;
    private color       _red;
    private color       _gray;
    private color       _badgeColor;

    public CoordSystem coord;

    private color _getColorStatus () {
        return ((_status == 0)? _green : ((_status == 1)? _red : _gray));
    }

    public Badge (int xAxis, int yAxis, int badgeType, String label) {
        // _xAxis     = xAxis;
        // _yAxis     = yAxis;
        coord = new CoordSystem (xAxis, yAxis);

        _badgeType = badgeType;
        _label     = label;

        _status = 2; // For testing only

        _green = color (100, 221, 23); // Ok - Light green A500
        _red   = color (213, 0, 0);    // Warning - Red A500
        _gray  = color (66, 66, 66);   // Inactive - Geay 800

        _radius  = 40;
        _radius = 40;

        _letter     = letterBadge [_badgeType];
        _badgeColor = colorBadge  [_badgeType];
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
        fill (_getColorStatus ());
        ellipse (
            coord.xAxis,
            coord.yAxis,
            _radius,
            _radius
        );

        fill (_badgeColor);
        ellipse (
            coord.xAxis,
            coord.yAxis,
            _radius * 0.75,
            _radius * 0.75
        );

        fill (color (0));
        text (
            _letter,
            coord.xAxis,
            coord.yAxis - 2
        );
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

    public void newLabel (String newLabel) {
        _label = newLabel;
    }
}
