# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131019124941) do

  create_table "articlehistories", force: true do |t|
    t.integer  "article_id",          limit: 8
    t.integer  "channel_id",          limit: 8
    t.integer  "user_id",             limit: 8
    t.integer  "assigned_user_id",    limit: 8
    t.string   "title"
    t.text     "text"
    t.string   "link",                limit: 1024
    t.string   "link_title"
    t.string   "link_description",    limit: 1024
    t.string   "link_image",          limit: 1024
    t.string   "image",               limit: 1024
    t.date     "publication_date"
    t.time     "publication_time"
    t.boolean  "autopublish",                      default: false,       null: false
    t.boolean  "publish_hidden",                   default: false,       null: false
    t.string   "target_type",         limit: 50
    t.string   "targets",             limit: 1024
    t.string   "action",              limit: 50,   default: "suggested", null: false
    t.boolean  "ad_reminder",                      default: false
    t.integer  "ad_assigned_user_id", limit: 8
    t.string   "ad_budget"
    t.text     "ad_details"
    t.text     "comment"
    t.datetime "created_at"
  end

  add_index "articlehistories", ["article_id"], name: "IDX_ARTICLEHISTORIES_ARTICLE_ID", using: :btree

  create_table "articles", force: true do |t|
    t.integer  "channel_id",          limit: 8
    t.integer  "client_id",           limit: 8
    t.integer  "assigned_user_id",    limit: 8
    t.string   "p_id",                limit: 64
    t.string   "title"
    t.text     "text"
    t.string   "link",                limit: 1024
    t.string   "link_title"
    t.string   "link_description",    limit: 1024
    t.string   "link_image",          limit: 1024
    t.string   "image",               limit: 1024
    t.date     "publication_date"
    t.time     "publication_time"
    t.boolean  "autopublish",                      default: false,       null: false
    t.boolean  "publish_hidden",                   default: false,       null: false
    t.string   "target_type",         limit: 50
    t.string   "targets",             limit: 1024
    t.string   "status",              limit: 50,   default: "suggested"
    t.boolean  "ad_reminder",                      default: false
    t.integer  "ad_assigned_user_id", limit: 8
    t.string   "ad_budget"
    t.text     "ad_details"
    t.integer  "current_user_id",     limit: 8
    t.datetime "changed_bogus"
    t.datetime "created_at"
  end

  create_table "channelaims", force: true do |t|
    t.integer  "client_id",        limit: 8
    t.integer  "channel_id",       limit: 8
    t.integer  "fan_aim"
    t.float    "comment_rate_aim"
    t.float    "like_rate_aim"
    t.integer  "year"
    t.datetime "changed"
    t.datetime "created"
  end

  create_table "channels", force: true do |t|
    t.string   "page_id",         limit: 64
    t.string   "network",         limit: 2,    default: "fb", null: false
    t.string   "name"
    t.string   "picture",         limit: 1024
    t.string   "link",            limit: 1024
    t.string   "category"
    t.integer  "fan_count"
    t.integer  "can_post",        limit: 1
    t.integer  "update_interval"
    t.datetime "created_at"
    t.datetime "modified"
  end

  create_table "channels_clients", force: true do |t|
    t.integer  "client_id",                                   limit: 8
    t.integer  "channel_id",                                  limit: 8
    t.string   "channel_name"
    t.string   "accesstoken",                                 limit: 1024
    t.string   "accesstoken_secret",                          limit: 1024
    t.integer  "token_valid",                                 limit: 1
    t.integer  "token_from_id",                               limit: 8
    t.string   "bitly_login",                                 limit: 32
    t.string   "bitly_api_key",                               limit: 64
    t.string   "bitly_accesstoken",                           limit: 64
    t.integer  "creator",                                     limit: 8
    t.boolean  "setting_auto_ticket",                                      default: true,  null: false
    t.boolean  "setting_auto_ticket_page",                                 default: false, null: false
    t.boolean  "setting_notification_ticket_new",                          default: true,  null: false
    t.boolean  "setting_notification_ticket_reopen",                       default: true,  null: false
    t.boolean  "setting_notification_ticket_assigned",                     default: true,  null: false
    t.boolean  "setting_default_publish_mode_is_autopublish",              default: true
    t.boolean  "deleted",                                                  default: false, null: false
    t.datetime "created_at"
    t.datetime "changed"
  end

  create_table "clientrights", force: true do |t|
    t.integer  "client_id",  limit: 8,  default: 0, null: false
    t.integer  "user_id",    limit: 8,  default: 0, null: false
    t.string   "role",       limit: 50
    t.datetime "created_at"
  end

  create_table "clients", force: true do |t|
    t.integer  "group_id",          limit: 8
    t.string   "name"
    t.string   "bitly_login",       limit: 32
    t.string   "bitly_api_key",     limit: 64
    t.string   "bitly_accesstoken", limit: 64
    t.boolean  "deleted",                      default: false, null: false
    t.datetime "created_at"
    t.datetime "changed_bogus"
    t.datetime "modified"
  end

  create_table "groups", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "code",                             limit: 64
    t.boolean  "activated",                                   default: false, null: false
    t.integer  "max_client_count",                            default: 0
    t.date     "created_at"
    t.datetime "modified"
    t.date     "changed_bogus"
    t.boolean  "setting_calendar_bestpostingtime",            default: false, null: false
    t.boolean  "setting_posting_title",                       default: false, null: false
    t.boolean  "setting_posting_targettype",                  default: false, null: false
    t.boolean  "setting_posting_talk",                        default: false, null: false
    t.integer  "setting_statistic_team",           limit: 1,  default: 0,     null: false
    t.integer  "setting_briefing",                 limit: 1,  default: 0,     null: false
    t.integer  "setting_fantype",                  limit: 1,  default: 0,     null: false
  end

  create_table "groups_users", force: true do |t|
    t.integer  "group_id",        limit: 8
    t.integer  "user_id",         limit: 8
    t.boolean  "r_account_owner",           default: false, null: false
    t.datetime "created_at"
  end

  create_table "histories", force: true do |t|
    t.integer  "ticket_id",        limit: 8
    t.integer  "user_id",          limit: 8,  default: 0,         null: false
    t.integer  "assigned_user_id", limit: 8,  default: 0,         null: false
    t.string   "action",           limit: 50, default: "created"
    t.text     "comment"
    t.datetime "created_at"
  end

  add_index "histories", ["ticket_id"], name: "IDX_HISTORIES_TICKET_ID", using: :btree

  create_table "posts", force: true do |t|
    t.integer  "channel_id",    limit: 8
    t.string   "p_id",          limit: 64
    t.string   "full_id",       limit: 64
    t.string   "object_id",     limit: 64
    t.string   "to_id",         limit: 64
    t.string   "from_id",       limit: 64
    t.string   "from_name"
    t.string   "from_category"
    t.string   "from_profile",  limit: 1024
    t.string   "from_picture",  limit: 1024
    t.string   "link",          limit: 1024
    t.text     "message"
    t.string   "posting_type"
    t.string   "a_name"
    t.string   "a_link",        limit: 1024
    t.string   "a_image",       limit: 1024
    t.string   "a_caption"
    t.string   "a_description", limit: 1024
    t.integer  "likes"
    t.integer  "comment_count"
    t.boolean  "is_pm",                      default: false, null: false
    t.integer  "is_published",  limit: 1,    default: 1,     null: false
    t.boolean  "deleted",                    default: false, null: false
    t.datetime "real_created"
    t.datetime "real_changed"
    t.datetime "created_at"
    t.datetime "changed"
  end

  add_index "posts", ["id", "channel_id"], name: "id_channel_id", using: :btree
  add_index "posts", ["p_id", "channel_id"], name: "IDX_POSTS_P_ID_CHANNEL_ID", using: :btree

  create_table "tickets", force: true do |t|
    t.integer  "ticketnr",         limit: 8
    t.integer  "channel_id",       limit: 8
    t.integer  "client_id",        limit: 8
    t.integer  "post_id",          limit: 8
    t.integer  "assigned_user_id", limit: 8, default: 0,    null: false
    t.boolean  "open",                       default: true, null: false
    t.datetime "created_at"
    t.datetime "changed_bogus"
  end

  add_index "tickets", ["client_id", "channel_id"], name: "IDX_TICKETS_CLIENT_ID_CHANNEL_ID", using: :btree
  add_index "tickets", ["post_id", "channel_id", "client_id"], name: "post_id_channel_id_client_id", using: :btree
  add_index "tickets", ["post_id"], name: "post_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "future_id",               limit: 36
    t.integer  "fb_uid",                  limit: 8
    t.string   "email",                   limit: 100
    t.string   "password"
    t.string   "nickname",                limit: 100
    t.string   "first_name",              limit: 100
    t.string   "last_name",               limit: 100
    t.string   "gender",                  limit: 50
    t.boolean  "admin"
    t.string   "accesstoken",             limit: 1024
    t.boolean  "token_valid"
    t.datetime "last_accesstoken_update"
    t.boolean  "disabled_notifications",               default: false, null: false
    t.datetime "created_at"
    t.datetime "modified"
  end

end
