class RemoveTables < ActiveRecord::Migration
  def change
    drop_table "articletalks"
    drop_table "briefingcomments"
    drop_table "briefings"
    drop_table "briefings_channels"
    drop_table "comments"
    drop_table "commentsentiments"
    drop_table "crons"
    drop_table "fantypes"
    drop_table "faqs"
    drop_table "fb_target_countries"
    drop_table "fb_target_locales"
    drop_table "insightdays"
    drop_table "insightmonths"
    drop_table "insightweeks"
    drop_table "post_insights"
    drop_table "postsentiments"
    drop_table "sentimentcountdays"
    drop_table "tags"
    drop_table "tags_tickets"
    drop_table "targetpresets"
  end
end
