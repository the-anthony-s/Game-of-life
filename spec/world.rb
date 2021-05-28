require './app/world'
# require './app/cell'

RSpec.describe 'World' do
  it 'initialized with x & y and cells are dead' do
    world = World.new(6, 6)

    expect(world.cells.length).to eq(36)
    expect(world.cells.all?(&:dead?)).to be true
  end

  it 'returns x and y' do
    world = World.new(3, 3)

    expect(world.cell_at(0, 2)).to eq(world.cells[2])
    expect(world.cell_at(1, 0)).to eq(world.cells[3])
  end
end
