public  class Link {
    private CoordSystem _from;
    private CoordSystem _to;
    private CoordSystem _firstComparationCoord;
    private CoordSystem _secondComparationCoord;
    private CoordSystem _arc;
    private int         _arcOffset; // This is a diameter, not a radius
    private int         _sector;
    private boolean     _oneLine;
    private Badge _badgeFrom;
    private Badge _badgeTo;

    private void _setFromToCoords (Badge badgeFrom, Badge badgeTo) {
        _badgeFrom = badgeFrom;
        _badgeTo = badgeTo;
        _from = new CoordSystem (_badgeFrom.coord.xAxis, _badgeFrom.coord.yAxis);
        _to = new CoordSystem (_badgeTo.coord.xAxis, _badgeTo.coord.yAxis);

        if (_from.xAxis == _to.xAxis || _from.yAxis == _to.yAxis) _oneLine = true;
        else _oneLine = false;
    }
    private void _setComparationCoords () {
        if (!_oneLine) {
            _firstComparationCoord  = new CoordSystem (_from.xAxis, _to.yAxis);
            _secondComparationCoord = new CoordSystem (_to.xAxis, _from.yAxis);
        }
        else {
            _firstComparationCoord  = new CoordSystem ();
            _secondComparationCoord = new CoordSystem ();
        }
    }
    private void _setArcCoords () {
        if (!_oneLine) {
            if (get (_firstComparationCoord.xAxis, _firstComparationCoord.yAxis) == backgroundColor)
                _arc = _firstComparationCoord;
            else
                _arc = _secondComparationCoord;
        }
    }
    private void _setSector () {
        if (!_oneLine) {
            if (_from.xAxis > _arc.xAxis || _to.xAxis > _arc.xAxis) { // 3 or 2
                if (_from.yAxis > _arc.yAxis || _to.yAxis > _arc.yAxis) { // 3
                    _sector = 3;
                }
                else {
                    _sector = 2;
                }
            }
            else { // 4 or 1
                if (_from.yAxis > _arc.yAxis || _to.yAxis > _arc.yAxis) {
                    _sector = 4;
                }
                else {
                    _sector = 1;
                }
            }
        }
    }
    private void _arrow () {
        if (!_oneLine) {
            line ( // From the origin
                _from.xAxis,
                _from.yAxis,
                (_arc.yAxis == _from.yAxis)? ( // if
                    (_arc.xAxis > _from.xAxis)? ( // if
                        _arc.xAxis - _arcOffset / 2
                    ):( // else
                        _arc.xAxis + _arcOffset / 2
                    )
                ):( // else
                    _arc.xAxis
                ),
                (_arc.xAxis == _from.xAxis)? (
                    (_arc.yAxis > _from.yAxis)? (
                        _arc.yAxis -_arcOffset / 2
                    ):(
                        _arc.yAxis + _arcOffset / 2
                    )
                ):(
                    _arc.yAxis
                )
            );
            line ( // From the relative
                _to.xAxis,
                _to.yAxis,
                (_arc.yAxis == _to.yAxis)? ( // if
                    (_arc.xAxis > _to.xAxis)? ( // if
                        _arc.xAxis - _arcOffset / 2
                    ):( // else
                        _arc.xAxis + _arcOffset / 2
                    )
                ):( // else
                    _arc.xAxis
                ),
                (_arc.xAxis == _to.xAxis)? (
                    (_arc.yAxis > _to.yAxis)? (
                        _arc.yAxis -_arcOffset / 2
                    ):(
                        _arc.yAxis + _arcOffset / 2
                    )
                ):(
                    _arc.yAxis
                )
            );
            _arc (); // The arc
        }
        else
            line (
                _from.xAxis,
                _from.yAxis,
                _to.xAxis,
                _to.yAxis
            );
    }
    private void _arc () {
        if (!_oneLine)
            arc (
                _arc.xAxis - (
                    ((_from.xAxis > _arc.xAxis || _to.xAxis > _arc.xAxis)? (
                        -_arcOffset
                    ):(
                        _arcOffset
                    )) / 2
                ),
                _arc.yAxis - (
                    ((_from.yAxis > _arc.yAxis || _to.yAxis > _arc.yAxis)? (
                        -_arcOffset
                    ):(
                        _arcOffset
                    )) / 2
                ),
                _arcOffset,
                _arcOffset,
                radians (90 * (_sector - 1)),
                radians (90 * _sector)
            );
    }
    // TODO: Somthing with reflections or mirroring coordinates.
    private void _triangle () {
        // Is this really necesary?
    }

    public boolean check () {
        return !_badgeFrom.toggled && !_badgeTo.toggled;
    }

    public Link (Badge badgeFrom, Badge badgeTo) {
        _arcOffset = 40; // in px

        _setFromToCoords (badgeFrom, badgeTo);
        _setComparationCoords ();
        // _setDistances ();
        _setArcCoords ();
        _setSector ();
    }

    public void render () {
        // Render settings
        strokeWeight (4);
        strokeCap (SQUARE); // Ends of the lines
        noFill ();
        // Render settings

        // Draw
        // TODO: Change link color by status
        stroke (250); // Color
        _arrow ();
        // Draw
    }
}
