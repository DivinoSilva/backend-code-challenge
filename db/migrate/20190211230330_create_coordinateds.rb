class CreateCoordinateds< ActiveRecord::Migration[5.1]
  def change
    create_table :coordinateds do |t|
      t.string  :origin
      t.string  :destination
      t.integer :distance
    end
  end
end
