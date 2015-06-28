class AddBgColorToGoldenwords < ActiveRecord::Migration
  def change
    add_column :goldenwords, :bg_colour, :string
  end
end
