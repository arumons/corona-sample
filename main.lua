tbl = {{"#", "#", " ", "#", "#", "#", "#", "#"},
       {"#", "#", " ", "#", "#", "#", "#", "#"},
       {"#", "#", " ", " ", "#", "#", "#", "#"},
       {"#", "#", "#", " ", "#", "#", "#", "#"},
       {"#", "#", "#", " ", " ", " ", "#", "#"},
       {"#", "#", "#", "#", "#", " ", " ", "#"},
       {"#", "#", "#", "#", "#", "#", " ", "#"}}

local x = 0
local y = 20
for key, val in pairs(tbl) do
  for key, val in pairs(val) do
    local textObject = display.newText(val, x, y, nil, 24)
    textObject:setTextColor(255, 255, 255)
    x = x + 24
  end
  x = 0
  y = y + 24
end

pos = {}
pos.x = 3
pos.y = 1

textObject = display.newText("@", 0, 0, nil, 24)

function display_player()
  local x = 0
  local y = 20
  for j = 1, pos.x - 1 do
    x = x + 24
  end
  for i = 1, pos.y - 1 do
    y = y + 24
  end
  textObject.x = x + 8
  textObject.y = y + 8
  textObject:setTextColor(255, 255, 255)
end

display_player()

function move_player(x, y)
  prev = {}
  prev.x = pos.x
  prev.y = pos.y

  pos.x = pos.x + x
  pos.y = pos.y + y
  if check_pos() == false then
    pos = prev
  end
end

function check_pos()
  print(tbl[pos.x - 1][pos.y -1])
  if tbl[pos.y] == nil or tbl[pos.y][pos.x] == nil or tbl[pos.y] == "#" or tbl[pos.y][pos.x] == "#"  then
    return false
  end
  return true
end

local button_left = display.newImage("button.png")
button_left.x = 30
button_left.y = display.contentHeight - 90
function button_left:tap(event)
  move_player(-1, 0)
  display_player()
end
button_left:addEventListener("tap", button_left)

local button_up = display.newImage("button.png")
button_up.x = 70
button_up.y = display.contentHeight - 130
function button_up:tap(event)
  move_player(0, -1)
  display_player()
end
button_up:addEventListener("tap", button_up)

local button_right = display.newImage("button.png")
button_right.x = 110
button_right.y = display.contentHeight - 90
function button_right:tap(event)
  move_player(1, 0)
  display_player()
end
button_right:addEventListener("tap", button_right)

local button_down = display.newImage("button.png")
button_down.x = 70
button_down.y = display.contentHeight - 50
function button_down:tap(event)
  move_player(0, 1)
  display_player()
  print('hoge')
end
print('abc')
button_down:addEventListener("tap", button_down)

