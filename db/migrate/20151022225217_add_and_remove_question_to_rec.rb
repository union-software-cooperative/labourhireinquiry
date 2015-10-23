class AddAndRemoveQuestionToRec < ActiveRecord::Migration
  def change
    add_column :recs, :pay_and_conditions_comment, :text
    add_column :recs, :safe_work_explained, :boolean
    add_column :recs, :hsr_explained, :boolean
    add_column :recs, :health_and_safety_comment, :text
    add_column :recs, :personal_impact_comment, :text
    add_column :recs, :feeling_secure, :boolean
    add_column :recs, :financial_security_comment, :text
    add_column :recs, :options, :boolean
    add_column :recs, :feeling_trapped_comment, :text
    remove_column :recs, :paid_fairly_comment, :text
    remove_column :recs, :compliant_employment_comment, :text
    remove_column :recs, :safe_work_comment, :text
    remove_column :recs, :predictable_hours_comment, :text
    remove_column :recs, :primary_carer_comment, :text
    remove_column :recs, :entitlements_comment, :text
    remove_column :recs, :financially_stable_comment, :text
    remove_column :recs, :accommodation_secure_comment, :text
    remove_column :recs, :community_life_comment, :text
    remove_column :recs, :secure_stay_comment, :text
    remove_column :recs, :secure_stay, :boolean
    remove_column :recs, :advertised, :string
    remove_column :recs, :prefer_flexibility, :string
    remove_column :recs, :prefer_flexibility_comment, :text
    remove_column :recs, :family_life, :string
    remove_column :recs, :family_life_comment, :text
    remove_column :recs, :formally_employed, :string
    remove_column :recs, :formally_employed_comment, :text
  end
end
