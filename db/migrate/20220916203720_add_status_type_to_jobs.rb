class AddStatusTypeToJobs < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :status_type, :string
  end
end
