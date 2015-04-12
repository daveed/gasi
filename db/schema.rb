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

ActiveRecord::Schema.define(version: 20150412030427) do

  create_table "calcs", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.decimal  "mass_fuel_total",             precision: 10
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   limit: 4,     default: 0, null: false
    t.integer  "attempts",   limit: 4,     default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.string   "queue",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "properties", force: :cascade do |t|
    t.string   "object_type",                            limit: 255
    t.string   "n_or_d",                                 limit: 255
    t.integer  "number",                                 limit: 4
    t.string   "name",                                   limit: 255
    t.binary   "packed_designation",                     limit: 16
    t.string   "designation",                            limit: 255
    t.string   "epoch",                                  limit: 255
    t.decimal  "epoch_jd",                                           precision: 8,  scale: 1
    t.string   "perihelion_date",                        limit: 255
    t.decimal  "perihelion_date_jd",                                 precision: 14, scale: 7
    t.decimal  "argument_of_perihelion",                             precision: 10, scale: 7
    t.decimal  "ascending_node",                                     precision: 10, scale: 7
    t.decimal  "inclination",                                        precision: 10, scale: 7
    t.decimal  "eccentricity",                                       precision: 10, scale: 9
    t.decimal  "perihelion_distance",                                precision: 13, scale: 9
    t.integer  "origin",                                 limit: 4
    t.decimal  "p_vector_x",                                         precision: 9,  scale: 8
    t.decimal  "p_vector_y",                                         precision: 9,  scale: 8
    t.decimal  "p_vector_z",                                         precision: 9,  scale: 8
    t.decimal  "q_vector_x",                                         precision: 9,  scale: 8
    t.decimal  "q_vector_y",                                         precision: 9,  scale: 8
    t.decimal  "q_vector_z",                                         precision: 9,  scale: 8
    t.decimal  "absolute_magnitude",                                 precision: 4,  scale: 2
    t.decimal  "phase_slope",                                        precision: 4,  scale: 2
    t.integer  "observations",                           limit: 4
    t.integer  "oppositions",                            limit: 4
    t.integer  "arc_length",                             limit: 4
    t.string   "orbit_uncertainty",                      limit: 4
    t.string   "perturbers_coarse_indicator",            limit: 255
    t.string   "perturbers_precise_indicator",           limit: 255
    t.decimal  "semimajor_axis",                                     precision: 11, scale: 7
    t.decimal  "period",                                             precision: 7,  scale: 2
    t.decimal  "aphelion_distance",                                  precision: 13, scale: 9
    t.decimal  "mean_daily_motion",                                  precision: 10, scale: 7
    t.decimal  "mean_anomaly",                                       precision: 8,  scale: 5
    t.string   "first_observation_date_used",            limit: 255
    t.string   "first_opposition_used",                  limit: 255
    t.string   "last_observation_date_used",             limit: 255
    t.string   "last_opposition_used",                   limit: 255
    t.decimal  "residual_rms",                                       precision: 12, scale: 8
    t.integer  "orbit_type",                             limit: 4
    t.boolean  "critical_list_numbered_object",          limit: 1
    t.boolean  "neo",                                    limit: 1
    t.boolean  "km_neo",                                 limit: 1
    t.boolean  "pha",                                    limit: 1
    t.boolean  "nearly_numberable",                      limit: 1
    t.boolean  "one_opposition_object_seen_prior",       limit: 1
    t.string   "reference",                              limit: 255
    t.string   "computer_name",                          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "apparition_start_date",                  limit: 255
    t.float    "apparition_start_magn",                  limit: 24
    t.float    "greatest_elong",                         limit: 24
    t.string   "greatest_elong_date",                    limit: 255
    t.float    "greatest_elong_magn",                    limit: 24
    t.float    "greatest_elong_decl",                    limit: 24
    t.string   "apparition_end_date",                    limit: 255
    t.float    "apparition_end_magn",                    limit: 24
    t.string   "one_line_format",                        limit: 512
    t.float    "delta_v",                                limit: 24
    t.float    "tisserand_jupiter",                      limit: 24
    t.float    "mercury_moid",                           limit: 24
    t.float    "venus_moid",                             limit: 24
    t.float    "earth_moid",                             limit: 24
    t.float    "mars_moid",                              limit: 24
    t.float    "jupiter_moid",                           limit: 24
    t.float    "saturn_moid",                            limit: 24
    t.float    "uranus_moid",                            limit: 24
    t.float    "neptune_moid",                           limit: 24
    t.decimal  "moid_orbit_epoch",                                   precision: 8,  scale: 1
    t.string   "moid_reference",                         limit: 32
    t.float    "h_neowise",                              limit: 24
    t.float    "g_neowise",                              limit: 24
    t.float    "albedo_neowise",                         limit: 24
    t.float    "albedo_neowise_unc",                     limit: 24
    t.float    "diameter_neowise",                       limit: 24
    t.float    "diameter_neowise_unc",                   limit: 24
    t.float    "h",                                      limit: 24
    t.float    "h_unc",                                  limit: 24
    t.float    "g",                                      limit: 24
    t.float    "albedo",                                 limit: 24
    t.float    "albedo_unc",                             limit: 24
    t.float    "diameter",                               limit: 24
    t.float    "diameter_unc",                           limit: 24
    t.string   "taxonomy_class",                         limit: 1
    t.string   "taxonomy_class_source",                  limit: 1
    t.string   "color_ignore",                           limit: 3
    t.float    "g_adopted",                              limit: 24
    t.string   "g_adopted_source",                       limit: 1
    t.float    "u_minus_b",                              limit: 24
    t.string   "u_minus_b_source",                       limit: 1
    t.float    "b_minus_v",                              limit: 24
    t.string   "b_minus_v_source",                       limit: 1
    t.float    "v_minus_rc",                             limit: 24
    t.string   "v_minus_rc_source",                      limit: 1
    t.float    "rc_minus_ic",                            limit: 24
    t.string   "rc_minus_ic_source",                     limit: 1
    t.float    "panstarrs_v_minus_uprime",               limit: 24
    t.float    "panstarrs_v_minus_gprime",               limit: 24
    t.string   "panstarrs_v_minus_gprime_source",        limit: 1
    t.float    "panstarrs_v_minus_rprime",               limit: 24
    t.string   "panstarrs_v_minus_rprime_source",        limit: 1
    t.float    "panstarrs_v_minus_iprime",               limit: 24
    t.string   "panstarrs_v_minus_iprime_source",        limit: 1
    t.float    "panstarrs_v_minus_zprime",               limit: 24
    t.string   "panstarrs_v_minus_zprime_source",        limit: 1
    t.float    "panstarrs_v_minus_wprime",               limit: 24
    t.string   "panstarrs_v_minus_wprime_source",        limit: 1
    t.float    "panstarrs_v_minus_yprime",               limit: 24
    t.string   "panstarrs_v_minus_yprime_source",        limit: 1
    t.float    "v_minus_uprime",                         limit: 24
    t.float    "v_minus_gprime",                         limit: 24
    t.string   "v_minus_gprime_source",                  limit: 1
    t.float    "v_minus_rprime",                         limit: 24
    t.string   "v_minus_rprime_source",                  limit: 1
    t.float    "v_minus_iprime",                         limit: 24
    t.string   "v_minus_iprime_source",                  limit: 1
    t.float    "v_minus_zprime",                         limit: 24
    t.string   "v_minus_zprime_source",                  limit: 1
    t.float    "v_minus_wprime",                         limit: 24
    t.float    "v_minus_yprime",                         limit: 24
    t.string   "spin_period_flag",                       limit: 1
    t.string   "spin_period_description",                limit: 255
    t.float    "spin_period",                            limit: 24
    t.string   "spin_amplitude_flag",                    limit: 1
    t.float    "spin_min_amplitude",                     limit: 24
    t.float    "spin_max_amplitude",                     limit: 24
    t.string   "lightcurve_quality",                     limit: 2
    t.string   "lightcurve_notes",                       limit: 5
    t.string   "binary_object",                          limit: 1
    t.string   "computed_jd",                            limit: 255
    t.string   "perihelion_date_jd_uncertainty",         limit: 255
    t.string   "argument_of_perihelion_uncertainty",     limit: 255
    t.string   "ascending_node_uncertainty",             limit: 255
    t.string   "inclination_uncertainty",                limit: 255
    t.string   "eccentricity_uncertainty",               limit: 255
    t.string   "perihelion_distance_uncertainty",        limit: 255
    t.float    "perihelion_date_jd_uncertainty_dbl",     limit: 24
    t.float    "argument_of_perihelion_uncertainty_dbl", limit: 24
    t.float    "ascending_node_uncertainty_dbl",         limit: 24
    t.float    "inclination_uncertainty_dbl",            limit: 24
    t.float    "eccentricity_uncertainty_dbl",           limit: 24
    t.float    "perihelion_distance_uncertainty_dbl",    limit: 24
    t.float    "h_neowise_2",                            limit: 24
    t.float    "g_neowise_2",                            limit: 24
    t.float    "albedo_neowise_2",                       limit: 24
    t.float    "albedo_neowise_unc_2",                   limit: 24
    t.float    "diameter_neowise_2",                     limit: 24
    t.float    "diameter_neowise_unc_2",                 limit: 24
    t.float    "h_2",                                    limit: 24
    t.float    "h_unc_2",                                limit: 24
    t.float    "g_2",                                    limit: 24
    t.float    "albedo_2",                               limit: 24
    t.float    "albedo_unc_2",                           limit: 24
    t.float    "diameter_2",                             limit: 24
    t.float    "diameter_unc_2",                         limit: 24
    t.float    "h_neowise_3",                            limit: 24
    t.float    "g_neowise_3",                            limit: 24
    t.float    "albedo_neowise_3",                       limit: 24
    t.float    "albedo_neowise_unc_3",                   limit: 24
    t.float    "diameter_neowise_3",                     limit: 24
    t.float    "diameter_neowise_unc_3",                 limit: 24
    t.float    "h_3",                                    limit: 24
    t.float    "h_unc_3",                                limit: 24
    t.float    "g_3",                                    limit: 24
    t.float    "albedo_3",                               limit: 24
    t.float    "albedo_unc_3",                           limit: 24
    t.float    "diameter_3",                             limit: 24
    t.float    "diameter_unc_3",                         limit: 24
    t.float    "h_neowise_4",                            limit: 24
    t.float    "g_neowise_4",                            limit: 24
    t.float    "albedo_neowise_4",                       limit: 24
    t.float    "albedo_neowise_unc_4",                   limit: 24
    t.float    "diameter_neowise_4",                     limit: 24
    t.float    "diameter_neowise_unc_4",                 limit: 24
    t.float    "h_4",                                    limit: 24
    t.float    "h_unc_4",                                limit: 24
    t.float    "g_4",                                    limit: 24
    t.float    "albedo_4",                               limit: 24
    t.float    "albedo_unc_4",                           limit: 24
    t.float    "diameter_4",                             limit: 24
    t.float    "diameter_unc_4",                         limit: 24
    t.datetime "orbit_updated_at"
    t.datetime "spin_updated_at"
    t.datetime "albedo_updated_at"
    t.datetime "color_updated_at"
  end

  add_index "properties", ["absolute_magnitude"], name: "index_properties_on_absolute_magnitude", using: :btree
  add_index "properties", ["albedo"], name: "index_properties_on_albedo", using: :btree
  add_index "properties", ["albedo_2"], name: "index_properties_on_albedo_2", using: :btree
  add_index "properties", ["albedo_2"], name: "index_properties_on_albedo_neowise_2", using: :btree
  add_index "properties", ["albedo_2"], name: "index_properties_on_g_neowise_2", using: :btree
  add_index "properties", ["albedo_2"], name: "index_properties_on_h_neowise_2", using: :btree
  add_index "properties", ["albedo_3"], name: "index_properties_on_albedo_3", using: :btree
  add_index "properties", ["albedo_3"], name: "index_properties_on_albedo_neowise_3", using: :btree
  add_index "properties", ["albedo_3"], name: "index_properties_on_g_neowise_3", using: :btree
  add_index "properties", ["albedo_3"], name: "index_properties_on_h_neowise_3", using: :btree
  add_index "properties", ["albedo_4"], name: "index_properties_on_albedo_4", using: :btree
  add_index "properties", ["albedo_4"], name: "index_properties_on_albedo_neowise_4", using: :btree
  add_index "properties", ["albedo_4"], name: "index_properties_on_h_neowise_4", using: :btree
  add_index "properties", ["albedo_neowise"], name: "index_properties_on_albedo_neowise", using: :btree
  add_index "properties", ["aphelion_distance"], name: "index_properties_on_aphelion_distance", using: :btree
  add_index "properties", ["argument_of_perihelion"], name: "index_properties_on_argument_of_perihelion", using: :btree
  add_index "properties", ["ascending_node"], name: "index_properties_on_ascending_node", using: :btree
  add_index "properties", ["ascending_node_uncertainty_dbl"], name: "index_properties_on_ascending_node_uncertainty_dbl", using: :btree
  add_index "properties", ["binary_object"], name: "index_properties_on_binary_object", using: :btree
  add_index "properties", ["delta_v"], name: "delta_v", using: :btree
  add_index "properties", ["designation"], name: "index_properties_on_designation", using: :btree
  add_index "properties", ["diameter"], name: "index_properties_on_diameter", using: :btree
  add_index "properties", ["diameter_2"], name: "index_properties_on_diameter_2", using: :btree
  add_index "properties", ["diameter_2"], name: "index_properties_on_diameter_neowise_2", using: :btree
  add_index "properties", ["diameter_2"], name: "index_properties_on_g_2", using: :btree
  add_index "properties", ["diameter_2"], name: "index_properties_on_h_2", using: :btree
  add_index "properties", ["diameter_3"], name: "index_properties_on_diameter_3", using: :btree
  add_index "properties", ["diameter_3"], name: "index_properties_on_diameter_neowise_3", using: :btree
  add_index "properties", ["diameter_3"], name: "index_properties_on_g_3", using: :btree
  add_index "properties", ["diameter_3"], name: "index_properties_on_h_3", using: :btree
  add_index "properties", ["diameter_4"], name: "index_properties_on_diameter_4", using: :btree
  add_index "properties", ["diameter_4"], name: "index_properties_on_diameter_neowise_4", using: :btree
  add_index "properties", ["diameter_4"], name: "index_properties_on_h_4", using: :btree
  add_index "properties", ["diameter_neowise"], name: "index_properties_on_diameter_neowise", using: :btree
  add_index "properties", ["earth_moid"], name: "earth_moid", using: :btree
  add_index "properties", ["eccentricity"], name: "index_properties_on_eccentricity", using: :btree
  add_index "properties", ["eccentricity_uncertainty_dbl"], name: "index_properties_on_eccentricity_uncertainty_dbl", using: :btree
  add_index "properties", ["inclination"], name: "index_properties_on_inclination", using: :btree
  add_index "properties", ["inclination_uncertainty_dbl"], name: "index_properties_on_inclination_uncertainty_dbl", using: :btree
  add_index "properties", ["jupiter_moid"], name: "jupiter_moid", using: :btree
  add_index "properties", ["mars_moid"], name: "mars_moid", using: :btree
  add_index "properties", ["mean_anomaly"], name: "index_properties_on_mean_anomaly", using: :btree
  add_index "properties", ["mean_daily_motion"], name: "index_properties_on_mean_daily_motion", using: :btree
  add_index "properties", ["mercury_moid"], name: "mercury_moid", using: :btree
  add_index "properties", ["n_or_d"], name: "index_properties_on_n_or_d", using: :btree
  add_index "properties", ["neptune_moid"], name: "neptune_moid", using: :btree
  add_index "properties", ["number", "designation"], name: "index_properties_on_number_and_designation", unique: true, using: :btree
  add_index "properties", ["number"], name: "index_properties_on_number", using: :btree
  add_index "properties", ["orbit_type"], name: "index_properties_on_orbit_type", using: :btree
  add_index "properties", ["packed_designation"], name: "index_properties_on_packed_designation", using: :btree
  add_index "properties", ["perihelion_date_jd_uncertainty_dbl"], name: "index_properties_on_perihelion_date_jd_uncertainty_dbl", using: :btree
  add_index "properties", ["perihelion_distance"], name: "index_properties_on_perihelion_distance", using: :btree
  add_index "properties", ["perihelion_distance_uncertainty_dbl"], name: "index_properties_on_perihelion_distance_uncertainty_dbl", using: :btree
  add_index "properties", ["period"], name: "index_properties_on_period", using: :btree
  add_index "properties", ["saturn_moid"], name: "saturn_moid", using: :btree
  add_index "properties", ["semimajor_axis"], name: "index_properties_on_semimajor_axis", using: :btree
  add_index "properties", ["spin_max_amplitude"], name: "index_properties_on_spin_max_amplitude", using: :btree
  add_index "properties", ["spin_min_amplitude"], name: "index_properties_on_spin_min_amplitude", using: :btree
  add_index "properties", ["spin_period"], name: "index_properties_on_spin_period", using: :btree
  add_index "properties", ["taxonomy_class"], name: "index_properties_on_taxonomy_class", using: :btree
  add_index "properties", ["tisserand_jupiter"], name: "tisserand_jupiter", using: :btree
  add_index "properties", ["uranus_moid"], name: "uranus_moid", using: :btree
  add_index "properties", ["venus_moid"], name: "venus_moid", using: :btree

end
