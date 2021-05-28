require './app/cell'

class World
  # 1. Initializes
  def initialize(width, height)
    @cells = []
    height.times do |i|
      @cells.push([])
      width.times do |x|
        @cells[i].push(Cell.new(self, i, x))
      end
    end
  end

  # 2. Get cells
  def cells
    @cells.flatten
  end

  # 3. Get cell position
  def cell_at(x, y)
    return @cells[x][y] if @cells[x]
  end

  def next_generation
    affected = []

    cells.each do |cell|
      affected.push cell if cell.alive? && (cell.alive_neighbours.length < 2)
    end

    affected.each(&:toggle_cell)
  end
end