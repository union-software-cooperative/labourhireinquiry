class ReconfigureRecs2 < ActiveRecord::Migration
  def change
    add_column :recs, :family_life, :boolean
    add_column :recs, :family_life_comment, :text
    add_column :recs, :predictable_hours, :boolean
    add_column :recs, :predictable_hours_comment, :text
    add_column :recs, :compliant_employment, :boolean
    add_column :recs, :compliant_employment_comment, :text
    add_column :recs, :formally_employed, :boolean
    add_column :recs, :formally_employed_comment, :text
    add_column :recs, :prefer_flexibility, :boolean
    add_column :recs, :prefer_flexibility_comment, :text
    add_column :recs, :paid_fairly, :boolean
    add_column :recs, :paid_fairly_comment, :text
    add_column :recs, :secure_stay, :boolean
    add_column :recs, :secure_stay_comment, :text
    add_column :recs, :safe_work, :boolean
    add_column :recs, :safe_work_comment, :text
    add_column :recs, :could_speak_up, :boolean
    add_column :recs, :could_speak_up_comment, :text

    remove_column :recs, :strained_family_life, :boolean
    remove_column :recs, :strained_family_life_comment, :text
    remove_column :recs, :inflexible_hours, :boolean
    remove_column :recs, :inflexible_hours_comment, :text
    remove_column :recs, :prefer_full_time, :boolean
    remove_column :recs, :prefer_full_time_comment, :text
    remove_column :recs, :under_paid, :boolean
    remove_column :recs, :under_paid_comment, :text
    remove_column :recs, :not_paid, :boolean
    remove_column :recs, :not_paid_comment, :text
    remove_column :recs, :on_visa, :boolean
    remove_column :recs, :on_visa_comment, :text
    remove_column :recs, :poor_ohs, :boolean
    remove_column :recs, :poor_ohs_comment, :text
    remove_column :recs, :noncompliant_employment, :boolean
    remove_column :recs, :noncompliant_employment_comment, :text
    remove_column :recs, :informally_employed, :boolean
    remove_column :recs, :informally_employed_comment, :text
  end
end

