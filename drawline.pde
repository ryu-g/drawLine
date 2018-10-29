boolean push = false;
int x,y,px,py;

void setup() {
    stroke(0);
    size(512, 512);    
}

void draw() {
    x=mouseX;
    y=mouseY;
    if(push==true){
        drawLine(px,py,x,y);
    }
    px=x;
    py=y;
}

void mousePressed(){
    push=true;
    println("push: "+push);
}
void mouseReleased(){
    push=false;
    println("push: "+push);

}

void drawLine(int px,int py,int nx, int ny)
    {
        fill(0,255,0);
        rect(nx,ny,2,2);
        int x1 = (int)px;
        int y1 = (int)py;
        int x2 = (int)nx;
        int y2 = (int)ny;
        float dx = x2 - x1;
        float dy = y2 - y1;
        int addx = 1;
        int addy = 1;

        if (dx != 0)
        {
            float a = dy / dx;
            float b = y1 - a * x1;
            if (dx<0) addx = -1;
            for (int x = x1; x2 != x; x += addx)
            {
                int y = (int)(a * x + b);
                point(x, y);
            }
        }
        else if (dx == 0 && dy != 0)
        {
            if (dy<0) addy = -1;
            for (int y = y1; y2 != y; y += addy)
            {
                point(x1, y);
            }
        }
    }