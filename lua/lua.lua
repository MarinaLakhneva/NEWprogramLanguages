local islands = {
  {1, 1, 0, 0},
  {1, 0, 1, 0},
  {0, 1, 1, 0},
  {0, 1, 0, 1},
  {0, 0, 0, 1}
}

local result = {}

local islandsNumber = 0

local moves_x = {1, -1, 0, 0}
local moves_y = {0, 0, 1, -1}

local function testMove(x, y, mass, res)
  return (x >= 1 and x <= #res) and (y >= 1 and y <= #res[1]) and (mass[x][y] == 1) and (res[x][y] == 0)
end

local function bfs(i, j, mass, res)
  local q = {}
  table.insert(q, {i, j})
  res[i][j] = islandsNumber
  while (#q > 0) do
    local x, y = table.unpack(table.remove(q, 1))
    for k = 1, 4 do
      if (testMove(x + moves_x[k], y + moves_y[k], mass, res)) then
        res[x + moves_x[k]][y + moves_y[k]] = islandsNumber
        table.insert(q, {x + moves_x[k], y + moves_y[k]})
      end
    end
  end
end

local function solution(mass, res)
  for i = 1, #mass do
    res[i] = {}
    for j = 1, #mass[i] do
      res[i][j] = 0
    end
  end

  for i = 1, #mass do
    for j = 1, #mass[i] do
      if (mass[i][j] == 1 and res[i][j] == 0) then
        islandsNumber = islandsNumber + 1
        bfs(i, j, mass, res)
      end
    end
  end
end

print("islands:", table.unpack(islands))
solution(islands, result)
print("result:")
for i = 1, #result do
  print(table.unpack(result[i]))
end