class CreateTennisCourts < ActiveRecord::Migration
  def change
    create_table :tennis_courts do |t|
      t.string :name
    end
  end
end
