class AddServiceToCandidates < ActiveRecord::Migration[5.0]
  def change
    add_reference :candidates, :service
  end
end
