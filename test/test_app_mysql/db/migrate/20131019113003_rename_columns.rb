class RenameColumns < ActiveRecord::Migration
  def change
    rename_column "articles", :created, :created_at
    rename_column "articlehistories", :created, :created_at
    rename_column "channels", :created, :created_at
    rename_column "channels_clients", :created, :created_at
    rename_column "clientrights", :created, :created_at
    rename_column "clients", :created, :created_at
    rename_column "groups", :created, :created_at
    rename_column "groups_users", :created, :created_at
    rename_column "histories", :created, :created_at
    rename_column "posts", :created, :created_at
    rename_column "tickets", :created, :created_at
    rename_column "users", :created, :created_at
  end
end
