class MiscFixesCakeToRails < ActiveRecord::Migration
  def change
    rename_column "articles", :changed, :changed_bogus
    rename_column "channels", :type, :network
    rename_column "clients", :changed, :changed_bogus
    rename_column "groups", :changed, :changed_bogus
    rename_column "posts", :type, :posting_type
    rename_column "tickets", :changed, :changed_bogus
  end
end
