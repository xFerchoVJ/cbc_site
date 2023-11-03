class ChangeDateToBeStringInAppointments < ActiveRecord::Migration[7.0]
  # def change
  #   change_column :appointments, :datet, :string
  #   #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  # end
  def up
    change_column :appointments, :date, :string
    remove_column :appointments, :datet
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end

  def down
    change_column :appointments, :date, :date
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
