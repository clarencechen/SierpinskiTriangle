int n = 5;
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
	text("Iterations: " + n, 0., 36.);
	sierpinski(vertices, n);
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
public void sierpinski(double[] vertices, int n) 
{
	if(n > 1)
	{
		double[] averts = {vertices[0],		vertices[1],	(vertices[0] +vertices[2])/2,	(vertices[1] +vertices[3])/2,	(vertices[0] +vertices[4])/2,	(vertices[1] +vertices[5])/2};
		sierpinski(averts, n -1);
		double[] bverts = {(vertices[0] +vertices[2])/2,	(vertices[1] +vertices[3])/2,	vertices[2],	vertices[3],	(vertices[2] +vertices[4])/2,	(vertices[3] +vertices[5])/2};
		sierpinski(bverts, n -1);
		double[] cverts = {(vertices[0] +vertices[4])/2,	(vertices[1] +vertices[5])/2,	(vertices[2] +vertices[4])/2,	(vertices[3] +vertices[5])/2,	vertices[4],	vertices[5]};
		sierpinski(cverts, n -1);
		
	}
	else 
	{
		triangle((float)vertices[0], (float)vertices[1], (float)vertices[2], (float)vertices[3], (float)vertices[4], (float)vertices[5]);		
	}
}