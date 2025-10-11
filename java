
abstract class GeometricObject {

    private String colour;
    private double weight;

    public GeometricObject() {
        this.colour = "white";
        this.weight = 1.0;
    }
    public GeometricObject(String colour, double weight) {
        this.colour = colour;
        this.weight = weight;
    }

    public String getColour() {
        return colour;
    }

    public double getWeight() {
        return weight;
    }

    public abstract double findArea();
    public abstract double Circumference();
}

class Circle extends GeometricObject {
    private double radius;

    public Circle(double radius) {
        super();
        this.radius = radius;
    }

    public Circle(double radius, String colour, double weight) {
        super(colour, weight); // calls parameterized constructor
        this.radius = radius;
    }

    public double findArea() {
        return Math.PI * radius * radius;
    }

    public double Circumference() {
        return 2 * Math.PI * radius;
    }
}

public class Main {
    public static void main(String[] args) {
        Circle circle = new Circle(5.0, "red", 2.0);

        System.out.println("Colour: " + circle.getColour());
        System.out.println("Weight: " + circle.getWeight());
        System.out.println("Area: " + circle.findArea());
        System.out.println("Circumference: " + circle.Circumference());
    }
}