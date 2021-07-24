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

ActiveRecord::Schema.define(version: 20210723175155) do

  create_table "campaign_quota_qualifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "campaign_quota_id",               null: false
    t.text    "pre_codes",         limit: 65535
    t.integer "question_id"
    t.index ["campaign_quota_id"], name: "index_campaign_quota_qualifications_on_campaign_quota_id", using: :btree
  end

  create_table "campaign_quotas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "campaign_id",     null: false
    t.integer "num_respondents"
    t.index ["campaign_id"], name: "index_campaign_quotas_on_campaign_id", using: :btree
  end

  create_table "campaigns", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.integer  "external_campaign_id"
    t.integer  "length_of_interview"
    t.decimal  "cpi",                  precision: 10, scale: 1
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.index ["external_campaign_id"], name: "index_campaigns_on_external_campaign_id", unique: true, using: :btree
  end

end
