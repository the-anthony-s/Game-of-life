require './app/world'
require './app/cell'

RSpec.describe 'Cell' do
  let(:world) { World.new(5, 9) }

  context 'when initialize dimensions' do
    it 'accepts arguments' do
      cell = Cell.new(world, 8, 8)

      expect(cell.world).to eq(world)
    end

    it 'initialize X and Y' do
      cell = Cell.new(world, 0, 8)

      expect(cell.x).to eq(0)
      expect(cell.y).to eq(8)
    end

    it 'initialize as dead' do
      cell = Cell.new(world, 0, 0)
      cell.dead!

      expect(cell).to be_dead
    end
  end # when initialize dimensions

  context 'when @alive' do
    it 'initialize as dead' do
      cell = Cell.new(world, 0, 0)

      expect(cell).to be_dead
      expect(cell).not_to be_alive
    end

    it 'is dead' do
      cell = Cell.new(world, 0, 0)
      cell.alive! # set alive to true (false comes by default)
      cell.dead!

      expect(cell).to be_dead
      expect(cell).not_to be_alive
    end

    it 'initialize as alive' do
      cell = Cell.new(world, 0, 0)
      cell.alive!

      expect(cell).to be_alive
      expect(cell).not_to be_dead
    end

    it 'is alive' do
      cell = Cell.new(world, 0, 0)
      # cell.dead! # alive = false (false by default)
      cell.alive! # alive = true

      expect(cell).to be_alive
    end
  end # when @alive

  context 'when toggle @alive' do
    it 'should toggle between live and dead' do
      cell = Cell.new(world, 0, 0)
      cell.toggle_cell # false by default

      expect(cell).to be_alive

      cell.toggle_cell # should be true after toggle

      expect(cell).to be_dead
    end
  end # when toggle @alive

  context 'when cell' do
    it 'has neighbours' do
      cell = world.cell_at(1, 1)
      neighbours = cell.neighbours

      expect(neighbours).to include(world.cell_at(0, 0))
      expect(neighbours).to include(world.cell_at(0, 1))
      expect(neighbours).to include(world.cell_at(0, 2))
      expect(neighbours).to include(world.cell_at(1, 0))
      expect(neighbours).to include(world.cell_at(1, 2))
      expect(neighbours).to include(world.cell_at(2, 0))
      expect(neighbours).to include(world.cell_at(2, 1))
      expect(neighbours).to include(world.cell_at(2, 2))

      expect(neighbours.length).to eq(8)
    end

    it 'has alive neighbours' do
      cell = world.cell_at(1, 1)

      cell_x = world.cell_at(2, 2)
      cell_x.alive!

      cell_y = world.cell_at(2, 1)
      cell_y.alive!

      neighbours = cell.alive_neighbours

      expect(neighbours).to include(cell_x)
      expect(neighbours).to include(cell_y)
      expect(neighbours.length).to eq(2)
    end
  end # when cell
end