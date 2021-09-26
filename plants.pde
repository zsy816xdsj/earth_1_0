class plants extends organism{
  int step_x;
  int step_y;
  plants(float s,float x,float y){
    super(x,y);
    Width = s;
    Height = s;
    step_x = int(x/step_max);
    step_y = int(y/step_max);
  }
  void be_eaten(){
    life = life-10;
  }
  void more_leafs(){
    if(Weather.weather_grid[step_x][step_y]==1){
      life = life+1;
    }
  }
}


class pine extends plants{
  pine(float s,float x,float y){
    super(s,x,y);
    life = 1000;
  }
  void update(){
    text(life,pos.x,pos.y);
    Width = Width+0.01;
    Height = Height+0.01;
    life--;
    if(life <= 0){
      p_plant.remove(this);
    }
    if(life <= 450){
      int sometree = int(random(0,500));
      if(sometree == 0){
        p_plant.add(new plants(random(step_min,step_max),random(pos.x-step_max,pos.x+step_max),random(pos.y-step_max,pos.y+step_max)));
      }
    }
    more_leafs();
  }
}
