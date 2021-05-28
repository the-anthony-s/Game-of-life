require './app/world'
require './app/cell'

RSpec.describe 'Game laws' do
  let(:world) { World.new(5, 9) }

  # Any live cell with fewer than two live neighbours dies, as if caused by underpopulation
  context 'when follows the first law' do
    it 'and has no alive cells around' do
      cell = world.cell_at(0, 0)
      cell.alive!
      world.next_generation

      expect(cell).to be_dead
    end

    it "and has one alive cell" do
      cell = world.cell_at(0, 0)
      cell.alive!

      neighbour_cell = world.cell_at(0, 1)
      neighbour_cell.alive!

      world.next_generation

      expect(cell).to be_dead
      expect(neighbour_cell).to be_dead
    end
  end # follows the first law

  # Any live cell with two or three live neighbours lives on to the next generation
  context 'follows the second law' do
    it 'has two live cells' do
      cell = world.cell_at(2, 2)
      cell.alive!

      left_cell = world.cell_at(1, 2)
      left_cell.alive!

      right_cell = world.cell_at(3, 2)
      right_cell.alive!

      world.next_generation

      expect(cell).to be_alive
      expect(left_cell).to be_dead
      expect(right_cell).to be_dead
    end

    it 'has three live cells' do
      cell = world.cell_at(2, 2)
      cell.alive!

      left_cell = world.cell_at(1, 2)
      left_cell.alive!

      right_cell = world.cell_at(3, 2)
      right_cell.alive!

      center_cell = world.cell_at(2, 3)
      center_cell.alive!

      world.next_generation

      expect(cell).to be_alive
      expect(right_cell).to be_alive
      expect(left_cell).to be_alive
      expect(center_cell).to be_alive
    end
  end # follows the second law
end
