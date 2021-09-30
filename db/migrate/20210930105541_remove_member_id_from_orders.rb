class RemoveMemberIdFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :member_id, :integer
  end
end
