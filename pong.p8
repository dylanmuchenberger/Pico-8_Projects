pico-8 cartridge // http://www.pico-8.com
version 27
__lua__
-- menu (implement later)
function _init() menu_init() end

function menu_init()
 _draw=menu_draw
 _update=menu_update
end

function menu_update()
 game_init()
end

function menu_draw()
end
-->8
-- game

--[[
todo
 * paddle move (add speed with x and maybe only speed for x seconds every y seconds)
 * ball bounce (Angles)
 * ball paddle interaction (Angles)
 * score
 * win/lose condition
 * paddle ai
 * menu
 * sounds [bounce, paddle, score, win, lose, menu]
--]]

function game_init()
 _update=game_update
 _draw=game_draw
 
p={}
  p.w=2
  p.h=24
  p.x=4
  p.y=64-(p.h/2)
  p.s=3
e={}
  e.w=2
  e.h=24
  e.x=123
  e.y=64-(p.h/2)
  e.s=4

 b={}
  b.x=64
  b.y=64
  b.r=2
  b.s=-2
end

function player()
  if btn(3) and p.y+p.h<127 then
    p.y+=p.s
  elseif btn(2) and p.y>0 then
    p.y-=p.s
  end
end

function enemy()
  if e.y+e.h>127 or e.y<0 then
    e.s=~e.s
  end
  e.y+=e.s
end

function ball()
  if b.x<0 or b.x>128 then b.x=64 end

  if b.x-(b.r/2)<p.x+p.w and b.y-(b.r/2)>p.y and b.y+(b.r/2)<p.y+p.h or 
    b.x+-(b.r/2)>e.x and b.y-(b.r/2)>e.y and b.y+(b.r/2)<e.y+e.h then
    b.s=~b.s
  end
  b.x+=b.s
end

function game_update()
  player()
  enemy()
  ball()
end

function game_draw()
 cls()
 rectfill(p.x,p.y,p.x+p.w,p.y+p.h,7)
 rectfill(e.x,e.y,e.x-e.w,e.y+e.h,7)
 circfill(b.x,b.y,b.r,7)
 
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
