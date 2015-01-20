double a = 10;
double[] vertices = {0, 1024, 1024, 1024, 512, 0};
public void setup()
{
	size(1024,1024);
}
public void draw()
{
	noStroke();
	background(0);
	fill(255);
	textSize(36);
	text("Area: " + (float)a, 0., 36.);
	sierpinski(vertices);
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
		if(keyCode == UP && a <= 500000)
		{
			a *= sqrt(10);
		}
		else if(keyCode == DOWN && a >= 0)
		{
			a /= sqrt(10);
		}
	}
}
public void sierpinski(double[] vertices) 
{
	double area = Math.abs(vertices[0]*vertices[3] +vertices[1]*vertices[4] +vertices[2]*vertices[5] -vertices[0]*vertices[5] -vertices[1]*vertices[2] -vertices[3]*vertices[4])/2;
	if(area > a)
	{
		double[] averts = {vertices[0],		vertices[1],	(vertices[0] +vertices[2])/2,	(vertices[1] +vertices[3])/2,	(vertices[0] +vertices[4])/2,	(vertices[1] +vertices[5])/2};
		sierpinski(averts);
		double[] bverts = {(vertices[0] +vertices[2])/2,	(vertices[1] +vertices[3])/2,	vertices[2],	vertices[3],	(vertices[2] +vertices[4])/2,	(vertices[3] +vertices[5])/2};
		sierpinski(bverts);
		double[] cverts = {(vertices[0] +vertices[4])/2,	(vertices[1] +vertices[5])/2,	(vertices[2] +vertices[4])/2,	(vertices[3] +vertices[5])/2,	vertices[4],	vertices[5]};
		sierpinski(cverts);
		
	}
	else 
	{
		triangle((float)vertices[0], (float)vertices[1], (float)vertices[2], (float)vertices[3], (float)vertices[4], (float)vertices[5]);		
	}
}