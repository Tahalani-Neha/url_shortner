class AddClickedToLinks < ActiveRecord::Migration[6.0]
  def change
    add_column :links, :clicked, :integer
  end
end
