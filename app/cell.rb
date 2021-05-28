# Generation 1:
# 4 8
# ........
# ....*...
# ...**...
# ........

###################

# Generation 2:
# 4 8
# ........
# ...**...
# ...**...
# ........

class Cell
  attr_reader :world, :x, :y # make data public

  # 1. initialize class
  def initialize(world, x, y)
    @world = world
    @x = x
    @y = y
    @alive = false
  end

  def dead!
    @alive = false
  end

  def dead?
    !@alive
  end

  def alive!
    @alive = true
  end

  def alive?
    @alive
  end

  def toggle_cell
    @alive = !@alive # switch boolean to the opposite value
  end

  def neighbours
    neighbours = []

    neighbours.push(@world.cell_at(x - 1, y - 1))
    neighbours.push(@world.cell_at(x - 1, y))
    neighbours.push(@world.cell_at(x - 1, y + 1))
    neighbours.push(@world.cell_at(x, y - 1))
    neighbours.push(@world.cell_at(x, y + 1))
    neighbours.push(@world.cell_at(x + 1, y - 1))
    neighbours.push(@world.cell_at(x + 1, y))
    neighbours.push(@world.cell_at(x + 1, y + 1))

    neighbours
  end

  def alive_neighbours
    neighbours.select do |n|
      n&.alive?
    end
  end
end
