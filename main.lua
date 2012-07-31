--group sprites
local group = Sprite.new()

--create panes
local top = Bitmap.new(Texture.new("crate.png"))
local left = Bitmap.new(Texture.new("crate.png"))
local right = Bitmap.new(Texture.new("crate.png"))

--top pane
local t1 = Transform.new()
t1:translate(-1,100)
t1:rotate(45)
t1:scale(1.2, 0.55)
t1:apply(top)

--left pane
local t2 = Transform.new()
t2:translateY(100)
t2:scaleX(0.85)
t2:skewX(25)
t2:apply(left)

--right pane
local t3 = Transform.new()
t3:translate(75,135)
t3:scaleX(0.85)
t3:skewX(-25)
t3:apply(right)

--adding panes
group:addChild(top)
group:addChild(left)
group:addChild(right)

--setting position
group:setPosition(80, 100)

--adding to stage
stage:addChild(group)