class ItemReport < ApplicationRecord
  validates :report_count, numericality: { less_than_or_equal_to: 3}

  before_save :reset_report_count_if_needed

  private

  def reset_report_count_if_needed
    if last_reported_at.present? && (Time.now - last_reported_at) >= 2.hours
      self.report_count = 0
      self.last_reported_at = Time.now
    end
  end    
end
