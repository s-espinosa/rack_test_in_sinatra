class Film < ActiveRecord::Base
  belongs_to :genre
  belongs_to :director

  def self.total_sales
    sum(:box_office_sales)
  end

  def self.average_sales
    self.total_sales / Film.count
  end
end

