public class CoordSystem {
    public int xAxis;
    public int yAxis;

    public CoordSystem () {
        this (width / 2, height / 2);
    }
    public CoordSystem (int xAxis, int yAxis) {
        this.xAxis = xAxis;
        this.yAxis = yAxis;
    }
}
