import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class SierpinskiTriangle extends PApplet {

int n = 5;
double[] vertices = {0, 1024, 1024, 1024, 512, 0};
int[] colors = {color(255, 0, 0), color(0, 255, 0), color(0, 0, 255)};
public void setup()
{
	size(1024,1024, P2D);
}
public void draw()
{
	noStroke();
	background(0);
	fill(255);
	textSize(36);
	text("Iterations: " + n, 0.f, 36.f);
	sierpinski(vertices, colors, n);
}
public void mouseDragged()//optional
{
	if(mouseX >= 0 && mouseX < 1024 && mouseY >= 0 && mouseY < 1024)
	{
		if(Math.abs(mouseX -vertices[0])*Math.abs(mouseX -vertices[0]) +Math.abs(mouseY -vertices[1])*Math.abs(mouseY -vertices[0]) < 256)
		{
			vertices[0] = mouseX;
			vertices[1] = mouseY;
		}
		else if(Math.abs(mouseX -vertices[2])*Math.abs(mouseX -vertices[2]) +Math.abs(mouseY -vertices[3])*Math.abs(mouseY -vertices[3]) < 256)
		{
			vertices[2] = mouseX;
			vertices[3] = mouseY;
		}
		else if(Math.abs(mouseX -vertices[4])*Math.abs(mouseX -vertices[4]) +Math.abs(mouseY -vertices[5])*Math.abs(mouseY -vertices[5]) < 256)
		{
			vertices[4] = mouseX;
			vertices[5] = mouseY;
		}
	}

}
public void keyPressed()
{
	if(key == CODED)
	{
		if(keyCode == UP && n < 10)
		{
			n++;
		}
		else if(keyCode == DOWN && n > 1)
		{
			n--;
		}
	}
}
public void sierpinski(double[] vertices, int[] colors, int n) 
{
	if(n > 1)
	{
		double[] averts = {vertices[0],		vertices[1],	(vertices[0] +vertices[2])/2,	(vertices[1] +vertices[3])/2,	(vertices[0] +vertices[4])/2,	(vertices[1] +vertices[5])/2};
		double[] bverts = {(vertices[0] +vertices[2])/2,	(vertices[1] +vertices[3])/2,	vertices[2],	vertices[3],	(vertices[2] +vertices[4])/2,	(vertices[3] +vertices[5])/2};
		double[] cverts = {(vertices[0] +vertices[4])/2,	(vertices[1] +vertices[5])/2,	(vertices[2] +vertices[4])/2,	(vertices[3] +vertices[5])/2,	vertices[4],	vertices[5]};
		int[] acolors = {colors[0],					(colors[0] +colors[1])/2,	(colors[0] +colors[2])/2};
		int[] bcolors = {(colors[0] +colors[1])/2,	colors[1],					(colors[1] +colors[2])/2};
		int[] ccolors = {(colors[0] +colors[2])/2,	(colors[1] +colors[2])/2,	colors[2]};
		println("acolors: " + acolors[0] + " " + acolors[1] + " " + acolors[2]);
		sierpinski(averts, acolors, n -1);
		sierpinski(bverts, bcolors, n -1);
		sierpinski(cverts, ccolors, n -1);
		
	}
	else 
	{
		beginShape(TRIANGLES);
		fill(colors[0]);
		vertex((float)vertices[0], (float)vertices[1]);
		fill(colors[1]);
		vertex((float)vertices[2], (float)vertices[3]);
		fill(colors[2]);
		vertex((float)vertices[4], (float)vertices[5]);
		endShape();
	}
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "SierpinskiTriangle" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
