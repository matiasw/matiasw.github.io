function setup() {
    let canvas = createCanvas(800, 800);
	canvas.parent('sketch-container');
    ellipseMode(RADIUS);
    strokeWeight(5);
}
function draw() {
    background(128);
    let R0 = 250;
    let t = millis() / 1000 / 3;
    let R1 = R0 * (t - floor(t));
    let R2 = R0 - R0 * (t - floor(t));
    let c1 = color(0, 80, 180);
    let c2 = color(200, 100, 80);
    if (int(floor(t)) % 2 == 0) {
        c2 = color(0, 80, 180);
        c1 = color(200, 100, 80);
    } else {
        c1 = color(0, 80, 180);
        c2 = color(200, 100, 80);
    }
    let k = (4 * (sqrt(2) - 1)) / 3;
    translate(width / 2, height / 2);
    fill(c1);
    circle(0, 0, R0);
    rotate(HALF_PI + PI + t * 0.2); //larger drop:
    fill(c2);
    beginShape();
    vertex(-R1 - (R0 - R1), 0); // Starting point
    let x1 = -R1 - (R0 - R1);
    let y1 = -k * R1;
    let x2 = -k * R1 - (R0 - R1);
    let y2 = -R1;
    let x3 = 0 - (R0 - R1);
    let y3 = -R1; //square(x1, y1, 10);
    //square(x2, y2, 10);
    //square(x3, y3, 10);
    bezierVertex(x1, y1, x2, y2, x3, y3); // First half of the first semicircle
    x1 = k * R1 - (R0 - R1);
    y1 = -R1;
    x2 = R1 - (R0 - R1);
    y2 = -k * R1;
    x3 = R1 - (R0 - R1);
    y3 = 0; //square(x1, y1, 10);
    //square(x2, y2, 10);
    //square(x3, y3, 10);
    bezierVertex(x1, y1, x2, y2, x3, y3); // Second half of the first semicircle
    x1 = x3;
    y1 = k * R2;
    x2 = k * R2 + (R0 - 2 * R2);
    y2 = R2;
    x3 = R0 - R2;
    y3 = R2;
    bezierVertex(x1, y1, x2, y2, x3, y3); // First half of the second semicircle
    //square(x1, y1, 10);
    //square(x2, y2, 10);
    //square(x3, y3, 10);
    x1 = x3; //k*R2 + R0-R2;
    y1 = y3; //R2;
    x2 = R0;
    y2 = R2;
    x3 = R0;
    y3 = 0; //square(x1, y1, 10);
    //square(x2, y2, 10);
    //square(x3, y3, 10);
    bezierVertex(x1, y1, x2, y2, x3, y3); // Second half of the second semicircle
    x1 = x3;
    y1 = k * R0;
    x2 = 0 + k * R0;
    y2 = R0;
    x3 = 0;
    y3 = R0; //square(x1, y1, 10);
    //square(x2, y2, 10);
    //square(x3, y3, 10);
    bezierVertex(x1, y1, x2, y2, x3, y3); // First half of the outer arc
    x1 = -k * R0;
    y1 = R0;
    x2 = -R0;
    y2 = k * R0;
    x3 = -R0;
    y3 = 0; //square(x1, y1, 10);
    //square(x2, y2, 10);
    //square(x3, y3, 10);
    bezierVertex(x1, y1, x2, y2, x3, y3); // Second half of the outer arc
    endShape();
}
