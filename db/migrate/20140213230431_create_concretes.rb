class CreateConcretes < ActiveRecord::Migration
  def change
    create_table :concretes do |t|
      t.string :mix_type
      t.string :color
      t.integer :psi
      t.integer :cost_per_yard

      t.timestamps
    end
  end
end
