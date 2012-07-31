--[[
*************************************************************
* This script is developed by Arturs Sosins aka ar2rsawseen, http://appcodingeasy.com
* Feel free to distribute and modify code, but keep reference to its creator
*
* Transform object abstracts matrix transformations to simple transform functions
* as scaling, rotation, translating, skewing and provides an option 
* to multiply, reset and copy matrices
*
* For more information, examples and online documentation visit: 
* http://appcodingeasy.com/Gideros-Mobile/Abstracting-matrix-transformation-in-Gideros-Mobile
**************************************************************
]]--

Transform = gideros.class(Matrix)

function Transform:rotate(deg)
	local rad = (math.pi/180)*deg
	self:multiply(Matrix.new(math.cos(rad), math.sin(rad), -math.sin(rad), math.cos(rad), 0, 0))
end

function Transform:translate(x,y)
	if not y then y = x end
	self:multiply(Matrix.new(1, 0, 0, 1, x, y))
end

function Transform:translateX(x)
	self:translate(x, 0)
end

function Transform:translateY(y)
	self:translate(0, y)
end

function Transform:scale(x,y)
	if not y then y = x end
	self:multiply(Matrix.new(x, 0, 0, y, 0, 0))
end

function Transform:scaleX(x)
	self:scale(x, 1)
end

function Transform:scaleY(y)
	self:scale(1, y)
end

function Transform:skew(xAng,yAng)
	if not yAng then yAng = xAng end
	xAng = (math.pi/180)*xAng
	yAng = (math.pi/180)*yAng
	self:multiply(Matrix.new(1, math.tan(yAng), math.tan(xAng), 1, 0, 0))
end

function Transform:skewX(xAng)
	self:skew(xAng, 0)
end

function Transform:skewY(yAng)
	self:skew(0, yAng)
end

function Transform:multiply(matrix)
	local m11 = matrix:getM11()*self:getM11() + matrix:getM12()*self:getM21()
	local m12 = matrix:getM11()*self:getM12() + matrix:getM12()*self:getM22()
	local m21 = matrix:getM21()*self:getM11() + matrix:getM22()*self:getM21()
	local m22 = matrix:getM21()*self:getM12() + matrix:getM22()*self:getM22()
	local tx = self:getTx() + matrix:getTx()
	local ty = self:getTy() + matrix:getTy()
	self:setElements(m11, m12, m21, m22, tx, ty)
end

function Transform:copy()
	return Transform.new(self:getElements())
end

function Transform:apply(obj)
	obj:setMatrix(self)
end

function Transform:reset()
	self:setElements(1, 0, 0, 1, 0, 0)
end
