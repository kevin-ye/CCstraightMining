local tArgs = {...}

if not tArgs[1] then
  print("Usage: sMining [number of sideway mining]")
  return
end

distance = tArgs[1]
space = 4
side = 2
torch = 16

---- dig side way
function dig_sideway()
	for s=1, side, 1 do
		safedig()
		turtle.forward()
	end
end

---- back_from_side
function back_from_side()
	for s=1, side, 1 do
		turtle.back()
	end
end

---- spacing
function spacing()
	for s=1, space, 1 do
		safedig()
		turtle.forward()
		turtle.digDown()
	end
end

---- torching
function torching()
	turtle.select(torch)
	turtle.placeDown()
end

---- safedig()
function safedig()
	while turtle.detect() do
		turtle.dig()
	end
end

---- main

for d= 1, distance, 1 do

	spacing()
	torching()

	turtle.turnLeft()
	dig_sideway()

	back_from_side()

	turtle.turnRight()
	turtle.turnRight()
	dig_sideway()

	back_from_side()
	turtle.turnLeft()

	print(string.format("Progress: %f. Remained fuel: %d.\n", d/distance*100, turtle.getFuelLevel()))
end

print("Done. Remained fuel: "..turtle.getFuelLevel()..".")
